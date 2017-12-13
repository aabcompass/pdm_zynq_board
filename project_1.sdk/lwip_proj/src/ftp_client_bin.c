// FTP client. Put data to the FTP server

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#include "lwipopts.h"
#ifndef __PPC__
#include "xil_printf.h"
#endif

#include "axi_spectral_core.h"
//#include "spectral_err.h"
#include "xparameters.h"
#include "prototypes.h"
#include "network_settings.h"

#define PER_NETWORK_TIMER_NOT_EXCEED	 100

#define DEF_MAX_FILE_SIZE 1000000000 /*in bytes*/
#define MAX_IDLE_TIME		30000000
#define MIN_BUF_REMINDER	1500 /*bytes*/
#define MAX_SIZE_TCP_PACKET 1500 /*bytes*/



#if (USE_JUMBO_FRAMES==1)
#define SEND_BUFSIZE (9000)
#else
#define SEND_BUFSIZE (1400)
#endif
static struct tcp_pcb *ftpctrl_connected_pcb = NULL;

//static char send_buf[SEND_BUFSIZE];

//static unsigned txperf_client_connected = 0;

extern NetworkNVSettings networkNVSettings;
extern SystemSettings systemSettings;




//*****************
// Global variables
//*****************

static int connect_acknowledged=0, user_acknowledged=0, pass_acknowledged=0, cwd_acknowledged=0,
		type_acknowledged=0, pasv_acknowledged = 0, stor_acknowledged=0,
		ftp_frame_acknowlodged = 0, ftpdata_sent = 0, stor_complete=0;

static int unknown_message = 0;
//char port_str[32];
static u16 port_str;
static char* spectrum_addr;
static u32 spectrum_nbytes = 0, portion_size = 0;
static int cmd_finalyze = 0;
static int open_new_file = 0;
static int tcp_packets_counter = 0;
static int idle_time = 0;


static enum  {no_state = 0,
	idle_state = 10,
	connect_ack_state,
	user_state,
	user_ack_state,
	pass_state,
	pass_ack_state,
	cwd_state,
	cwd_ack_state,
	type_state=18,
	type_ack_state,
	pasv_state=20,
	pasv_ack_state,
	start_ftpdata_application_state=30,
	start_ftpdata_application_wait_state,
	stor_state = 40,
	stor_ack_state = 50,
	buffer_wait_state = 60,
	frame_send_state,
	frame_ack_state = 70,
	spectrum_wait_state = 80,
	tcp_data_close_state,
	tcp_ctrl_close_state,
	tcp_ctrl_close_state2,
	complete_state = 90} ftp_state = no_state;


//**********************************************************
//
// FTP CONTROL
//
//**********************************************************


static u32 file_counter = 1;
u32 spectrum_bytes_counter = 0;

static char stor_ftp_cmd[] = "STOR DatYYYYMMDDHHmmSS_.ready\r\n";
static char filename[50];
char scan_addr_info[50];


static int program_counter, program_counter_d1, program_counter_d2 = 0;

void IncProgramCounter()
{
	program_counter++;
}

static int
SendFTPcmd(char* str)//transfer_ftpctrl_data()
{
	//char str[] = "1USER root\r\n";
	err_t err;
	//print("$"); xil_printf("%s (%d)", str, strlen(str));
	struct tcp_pcb *tpcb = ftpctrl_connected_pcb;

	//strcpy(send_buf, str);
	//if (!ftpctrl_connected_pcb)
		//return ERR_OK;
	err = tcp_write(tpcb, str/*send_buf*/, strlen(str), 0);
	if(err == PER_NETWORK_TIMER_NOT_EXCEED)
	{
		return PER_NETWORK_TIMER_NOT_EXCEED;
	}
	else if (err != ERR_OK)
	{
		xil_printf("BIN: SendFTPcmd: Error on tcp_write: %d, tpcb=0x%08x\r\n", err, tpcb);
		//ftpctrl_connected_pcb = NULL;
		return err;
	}
	err = tcp_output(tpcb);
	if (err != ERR_OK)
		xil_printf("BIN: SendFTPcmd: Error on tcp_output: %d\r\n",err);

	return 0;
}

static err_t
ftpctrl_sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
//	print("txperf_sent_callback\n\r");
	return ERR_OK;
}


void ParsePortStr(char* str, u16* port)
{
	// Example: 227 Entering Passive Mode (192,168,7,1,217,0)
	int i, j, parse_state=0;
	u16 k;
	*port = 0;
	for(i=0;i<100;i++)
	{
		if(str[i]==')')
			break;
	}
	for(j=i-1;j>0;j--)
	{
		if(str[j] == ',')
		{
			if(parse_state>=10)
				break;
			else
				parse_state = 10;
		}
		else
		{
			switch(parse_state)
			{
				case 0: k=1; break;
				case 1: k=10; break;
				case 2: k=100; break;
				case 10: k=256; break;
				case 11: k=2560; break;
				case 12: k=25600; break;
			}
			parse_state++;
			*port+=k*(str[j]-0x30);
		}
	}
	//xil_printf("\n\rstr=%s port=%d state=%d\n\r", str, *port, ftp_state);
}


static err_t
ftpctrl_rcv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
	int len = p->len,i;
	//xil_printf("#%d#", p->len);
	if(p->len < 1000)
	{
		if(/*systemSettings.isPrinting*/1)
		{
			//print("$");
			//print(p->payload);
		}
		if(strncmp(p->payload, "220", 3) == 0) {connect_acknowledged=1;stor_complete=0;}
		else if(strncmp(p->payload, "331", 3) == 0) {user_acknowledged=1;}
		else if(strncmp(p->payload, "230", 3) == 0) {pass_acknowledged=1;}
		else if(strncmp(p->payload, "250", 3) == 0) {cwd_acknowledged=1;}
		//else if(strncmp(p->payload, "200 TYPE", 7) == 0) type_acknowledged=1;
		else if(strncmp(p->payload, "200", 3) == 0) {type_acknowledged=1;}
		else if(strncmp(p->payload, "227", 3) == 0) { ParsePortStr(p->payload, &port_str); pasv_acknowledged=1; }
		else if(strncmp(p->payload, "150", 3) == 0) {stor_acknowledged=1;}
		else if(strncmp(p->payload, "226", 3) == 0)
		{
			stor_complete=1;
			connect_acknowledged=0;
			user_acknowledged=0;
			pass_acknowledged=0;
			cwd_acknowledged=0;
			type_acknowledged=0;
			pasv_acknowledged=0;
		}
		else unknown_message = 1;
		if(systemSettings.isPrinting)
			for(i=0; i<p->len; i++)
				memset(p->payload, 0, p->len);
	}
	tcp_recved(tpcb, len);
	pbuf_free(p);
	return ERR_OK;
}

static void
ftpctrl_client_err_callback(void * arg, err_t err)
{
	xil_printf("BIN: ftpctrl_client_err_callback: err=%d\n\r", err);
	StartFTP_data();
}


static err_t
ftpctrl_connected_callback(void *arg, struct tcp_pcb *tpcb, err_t err)
{
	//xil_printf("BIN: ftpctrl_connected_callback: Connected to ftpctrl server\r\n");

	/* store state */
	ftpctrl_connected_pcb = tpcb;

	/* set callback values & functions */
	tcp_arg(tpcb, NULL);
	tcp_sent(tpcb, ftpctrl_sent_callback);
	tcp_recv(tpcb, ftpctrl_rcv_callback);

	/* initiate data transfer */
	return ERR_OK;
}


static int
start_ftpctrl_application()
{
	struct tcp_pcb *pcb;
	struct ip_addr ipaddr;
	err_t err;
	u16_t port;
	//int i;
	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("BIN: start_ftpctrl_application: Error creating PCB. Out of Memory\r\n");
		return -1;
	}

	/* !!! NAS IP-address !!! */
	//IP4_ADDR(&ipaddr,  192, 168,   7, 2);		/* iperf server address */
	ipaddr.addr = FTP_SERVER_IP;

	port = 21;					/* FTP port */
	err = tcp_connect(pcb, &ipaddr, port, ftpctrl_connected_callback);
	tcp_err(pcb, ftpctrl_client_err_callback);
 //       txperf_client_connected = 0;

	if (err != ERR_OK) {
		xil_printf("BIN: start_ftpctrl_application: tcp_connect returned error: %d\r\n", err);
		return err;
	}
	//xil_printf("ctrl_port=%d\n\r", local_ctrl_ftp_port);
//	/* initialize data buffer being sent */
//	for (i = 0; i < SEND_BUFSIZE; i++)
//		send_buf[i] = (i % 10) + '0';
	//print("BIN: Started FTP control client\n\r");

	return 0;
}

//**********************************************************
//
// FTP DATA
//
//**********************************************************
static int ftpdata_connected = 0;

static struct tcp_pcb *ftpdata_pcb;
//static struct tcp_pcb *ftpdata_connected_pcb = NULL;
//err_t ftp_send_data(char * data, u16_t len);


static err_t
ftpdata_sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
	ftp_frame_acknowlodged = 1;
	tcp_packets_counter--;
	return ERR_OK;
}


static err_t ftp_send_data(char * data, u16_t len)
{
	err_t err;
	tcp_sent(/*ftpdata_connected_pcb*/ftpdata_pcb, ftpdata_sent_callback);
	err = tcp_write(/*ftpdata_connected_pcb*/ftpdata_pcb, data, len, 0);
	if(err == PER_NETWORK_TIMER_NOT_EXCEED)
		return PER_NETWORK_TIMER_NOT_EXCEED;
	else if (err != ERR_OK)
	{
		xil_printf("BIN: ftp_send_data: Error on tcp_write: %d, len=%d, tpcb=0x%08x\r\n", err, len, /*ftpdata_connected_pcb*/ftpdata_pcb);
		//ftpdata_connected_pcb = NULL;
		return -1;
	}
	tcp_packets_counter++;
	err = tcp_output(/*ftpdata_connected_pcb*/ftpdata_pcb);
	if (err != ERR_OK)
		xil_printf("BIN: ftp_send_data: Error on tcp_output: %d\r\n",err);
	return err;
}

static void
ftpdata_client_err_callback(void * arg, err_t err)
{
	xil_printf("BIN: ftpdata_client_err_callback: err=%d,\t state=%d\n\r", err, ftp_state);
}

static err_t
ftpdata_connected_callback(void *arg, struct tcp_pcb *tpcb, err_t err)
{
	//xil_printf("txperf: Connected to ftpdata server\r\n");
    ftpdata_connected = 1;
	/* store state */
	//ftpdata_connected_pcb = tpcb;

	/* set callback values & functions */
	tcp_arg(tpcb, NULL);
	tcp_sent(tpcb, ftpdata_sent_callback);
	//tcp_recv(tpcb, ftpdata_rcv_callback);

	/* initiate data transfer */
	return ERR_OK;
}

static int
start_ftpdata_application()
{
	err_t err;
	struct ip_addr ipaddr;


	/* create new TCP PCB structure */
	ftpdata_pcb = tcp_new();
	if (!ftpdata_pcb) {
		xil_printf("BIN: start_ftpdata_application: Error creating PCB. Out of Memory\r\n");
		return -1;
	}

	/* !!! NAS IP-address !!! */
	//IP4_ADDR(&ipaddr,  192, 168,   7, 2);		/* iperf server address */
	ipaddr.addr = FTP_SERVER_IP;

	//xil_printf("Port_str=%d\n\r", port_str);
	err = tcp_connect(ftpdata_pcb, &ipaddr, port_str, ftpdata_connected_callback);
	tcp_err(ftpdata_pcb, ftpdata_client_err_callback);
//	txperf_client_connected = 0;
	if (err != ERR_OK) {
		xil_printf("BIN: start_ftpdata_application: tcp_connect returned error: %d\r\n", err);
		return err;
	}

	//print("BIN: Started FTP data client\n\r");
	return 0;
}

int buf_sz;

static int idle_state_counter = 0;
static char filename_counter = 0x30;

void ftp_data_sm()
{
	int ret;
	switch(ftp_state)
	{
		case no_state:
			break;
		case idle_state:
			if(idle_state_counter == 1000000)
			{
				idle_state_counter = 0;
				start_ftpctrl_application();
				ftp_state = connect_ack_state;
			}
			else
				idle_state_counter++;
			break;
		case connect_ack_state:
			if(connect_acknowledged) {connect_acknowledged=0; ftp_state = user_state;}
			break;
		case user_state:
			if(SendFTPcmd("USER minieusouser\r\n") == 0)
				ftp_state = user_ack_state;
			break;
		case user_ack_state:
			if(user_acknowledged) {user_acknowledged=0; ftp_state = pass_state;}
			break;
		case pass_state:
			if(SendFTPcmd("PASS minieusopass\r\n") == 0)
				ftp_state = pass_ack_state;
			break;
		case pass_ack_state:
			if(pass_acknowledged) {pass_acknowledged=0; ftp_state = cwd_state;}
			break;
		case cwd_state:
			if(SendFTPcmd("CWD DATA\r\n") == 0)
				ftp_state = cwd_ack_state;
			break;
		case cwd_ack_state:
			if(cwd_acknowledged) {cwd_acknowledged=0; ftp_state = type_state;}
			break;
		case type_state:
			if(SendFTPcmd("TYPE I\r\n") == 0)
				ftp_state = type_ack_state;
			break;
		case type_ack_state:
			if(type_acknowledged) {type_acknowledged=0; ftp_state = pasv_state;}
			break;
		case pasv_state:
			if(SendFTPcmd("PASV\r\n") == 0)
				ftp_state = pasv_ack_state;
			break;
		case pasv_ack_state:
			if(pasv_acknowledged) {pasv_acknowledged=0; ftp_state = start_ftpdata_application_state;}
			break;
		case start_ftpdata_application_state:
			start_ftpdata_application();
			ftp_state = stor_state;
			break;
		case start_ftpdata_application_wait_state:
			if(ftpdata_connected)
			{
				ftpdata_connected = 0;
				ftp_state = stor_state;
			}
			break;
		case stor_state:
			if(spectrum_nbytes)
			{
				//BuildStorFTPCMD(0, file_counter, stor_ftp_cmd);
				//stor_ftp_cmd[22] = filename_counter;
				//xil_printf("Filename = %s", filename);
				strcpy(stor_ftp_cmd, "STOR ");
				strcat(stor_ftp_cmd, filename);
				strcat(stor_ftp_cmd, "\r\n");
				if(SendFTPcmd(stor_ftp_cmd) == 0)
				{
					//xil_printf("stor_ftp_cmd=%s", stor_ftp_cmd);
					filename_counter++;
					ftp_state = buffer_wait_state;
				}
			}
			// uncomment these lines if you want to alive connection
			break;
		case buffer_wait_state:
			buf_sz=tcp_sndbuf(/*ftpdata_connected_pcb*/ftpdata_pcb);
			//xil_printf("buf_sz=%d\n\r", buf_sz);
			if(buf_sz > MIN_BUF_REMINDER)
				ftp_state = frame_send_state;
			break;
		case frame_send_state:
			portion_size = spectrum_nbytes > MAX_SIZE_TCP_PACKET ? MAX_SIZE_TCP_PACKET : spectrum_nbytes;
			ret = ftp_send_data(spectrum_addr, portion_size);
			if(ret == 0)
			{
				spectrum_addr += portion_size;
				spectrum_nbytes -= portion_size;
				//xil_printf("%d\n\r", spectrum_nbytes);
				ftp_state = frame_ack_state;
			}
			break;
		case frame_ack_state:
			if(ftp_frame_acknowlodged)
			{
				ftp_frame_acknowlodged = 0;
				if(spectrum_nbytes)
				{
					//print(".");
					ftp_state = buffer_wait_state;
				}
				else
				{
					ftp_state = tcp_data_close_state;
				}
			}
			break;
		case spectrum_wait_state:
			if(spectrum_nbytes)
			{
				ftp_state = buffer_wait_state;
			}
			else// if(cmd_finalyze)
			{
				cmd_finalyze = 0;
				ftp_state = tcp_data_close_state;
			}
//			else if(idle_time > MAX_IDLE_TIME)
//			{
//				idle_time = 0;
//				SendFTPcmd("help\r\n");
//			}
//			else
//				idle_time++;
			break;
		case tcp_data_close_state:
			buf_sz=tcp_sndbuf(/*ftpdata_connected_pcb*/ftpdata_pcb);
			//xil_printf("tcp_data_close_state: buf_sz=%d\n\r", buf_sz);
			if(buf_sz == 8192)
			{
				ret = tcp_close(/*ftpdata_connected_pcb*/ftpdata_pcb);
				if(ret) xil_printf("tcp_close data returns %d\n\r", ret);
				ftp_state = tcp_ctrl_close_state;
			}
			break;
		case tcp_ctrl_close_state:
			//SendFTPcmd("QUIT\r\n");
			if(stor_complete)
				ftp_state = tcp_ctrl_close_state2;
			break;
		case tcp_ctrl_close_state2:
			ret = tcp_close(ftpctrl_connected_pcb);
			if(ret) xil_printf("tcp_close ctrl returns %d\n\r", ret);
			ftp_state = idle_state;
			xil_printf("%d %d\n\r", program_counter - program_counter_d1, program_counter - program_counter_d2);
			program_counter_d2 = program_counter;
			break;
		case complete_state:
			break;
	}
}

void StartFTP_data()
{
	//print("StartFTP_BIN...\n\r");
	ftp_state = idle_state;
}

void SetFTP_state(int s)
{
	ftp_state = s;
}

int GetFTP_bin_State()
{
	return ftp_state;
}

int IsFTP_bin_Connected()
{
	return (ftp_state >= pasv_ack_state);
}


void AcquireScanSettings()
{
//TODO AcquireScanSettings()
}


int IsFTP_bin_idle()
{
	return (ftp_state == spectrum_wait_state)
			|| (ftp_state == stor_state);//!spectrum_nbytes;
}

void SendSpectrum2FTP(u32* spectrum_addr_param, u32 nbytes, char* filename_param)
{
	strcpy(filename, filename_param);//   \r\n in filename_param is obligatory
	spectrum_addr = spectrum_addr_param;
	if(spectrum_nbytes) print("!!!");
	spectrum_nbytes = nbytes;
	spectrum_bytes_counter += nbytes;
	//xil_printf("nbytes=%d\n\r", nbytes);
	if(spectrum_bytes_counter > DEF_MAX_FILE_SIZE)
	{
		file_counter++;
		open_new_file = 1;
		spectrum_bytes_counter = 0;
	}
	//xil_printf("%d>", program_counter);
	program_counter_d1 = program_counter;
}


int FinalyzeFTP_bin_files()
{
	if(tcp_packets_counter == 0)
	{
		cmd_finalyze = 1;
		file_counter++;
		spectrum_bytes_counter = 0;
		return 1;
	}
	else
		return 0;
}
//
//void SendAddrinfo2FTP()
//{
//	BuildScanFTPstr(2-systemSettings.is_master, file_counter, spectrum_bytes_counter, scan_addr_info);
//	SendText2FTP(scan_addr_info);
//}



int Get_tcp_bin_sndbuf()
{
	return tcp_sndbuf(/*ftpdata_connected_pcb*/ftpdata_pcb);
}


int GetFileCounter()
{
	return file_counter;
}

void SetFileNumBin(int num)
{
	file_counter = num;
}

int GetFileNumBin()
{
	return file_counter;
}
