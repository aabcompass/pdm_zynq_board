// FTP client. Get data from the FTP server


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
		type_acknowledged=0, pasv_acknowledged = 0, retr_acknowledged=0, file_not_found=0, retr_complete=0;

static int unknown_message = 0;
//char port_str[32];
static u16 port_str = 4444;

#define SIZEOF_SETTINGS_BUFFER	100
//static char settings_buffer[SIZEOF_SETTINGS_BUFFER];
static char * receive_buffer;
static u32 receive_buffer_offset = 0;
char filename_cmd[50];

//**********************************************************
//
// FTP CONTROL
//
//**********************************************************

#define PER_NETWORK_TIMER_NOT_EXCEED	 100

static int
SendFTPcmd(char* str)//transfer_ftpctrl_data()
{
	//char str[] = "1USER root\r\n";
	err_t err;
	struct tcp_pcb *tpcb = ftpctrl_connected_pcb;

	//strcpy(send_buf, str);
	if (!ftpctrl_connected_pcb)
		return ERR_OK;
	err = tcp_write(tpcb, str/*send_buf*/, strlen(str), 0);
	if(err == PER_NETWORK_TIMER_NOT_EXCEED)
		return PER_NETWORK_TIMER_NOT_EXCEED;
	else if (err != ERR_OK)
	{
		xil_printf("TXT: SendFTPcmd: Error on tcp_write: %d\r\n", err);
		//ftpctrl_connected_pcb = NULL;
		return err;
	}
	err = tcp_output(tpcb);
	if (err != ERR_OK)
		xil_printf("TXT: SendFTPcmd: Error on tcp_output: %d\r\n",err);

	return 0;
}

static err_t
ftpctrl_sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
//	print("txperf_sent_callback\n\r");
	return ERR_OK;
}

static err_t
ftpctrl_rcv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
	int len = p->len,i;
	//xil_printf("#%d#", p->len);
	if(p-> len < 1000)
	{
		if(/*systemSettings.isPrinting*/1)
		{
			print("#");
			print(p->payload);
		}
		if(strncmp(p->payload, "220", 3) == 0) connect_acknowledged=1;
		else if(strncmp(p->payload, "331", 3) == 0) user_acknowledged=1;
		else if(strncmp(p->payload, "230", 3) == 0) pass_acknowledged=1;
		else if(strncmp(p->payload, "250", 3) == 0) cwd_acknowledged=1;
		//else if(strncmp(p->payload, "200 TYPE", 7) == 0) type_acknowledged=1;
		else if(strncmp(p->payload, "200", 3) == 0) type_acknowledged=1;
		else if(strncmp(p->payload, "227", 3) == 0) { ParsePortStr(p->payload, &port_str); pasv_acknowledged=1; }
		else if(strncmp(p->payload, "150", 3) == 0) retr_acknowledged=1;
		else if(strncmp(p->payload, "550", 3) == 0) file_not_found=1;
		else if(strncmp(p->payload, "226", 3) == 0) retr_complete=1;
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
	xil_printf("INI: ftpctrl_client_err_callback: err=%d\n\r", err);
	StartFTP_config();
}

static err_t
ftpctrl_connected_callback(void *arg, struct tcp_pcb *tpcb, err_t err)
{
	xil_printf("INI: ftpctrl_connected_callback: Connected to ftpctrl server\r\n");
//    txperf_client_connected = 1;

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
	print("INI: start_ftpctrl_application()...\n\r");
	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("INI: start_ftpctrl_application: Error creating PCB. Out of Memory\r\n");
		return -1;
	}

	/* !!! NAS IP-address !!! */
	//IP4_ADDR(&ipaddr,  192, 168,   7, 1);		/* iperf server address */
	ipaddr.addr = FTP_SERVER_IP;

	port = 21;					/* FTP port */
	err = tcp_connect(pcb, &ipaddr, port, ftpctrl_connected_callback);
	tcp_err(pcb, ftpctrl_client_err_callback);
 //       txperf_client_connected = 0;

	if (err != ERR_OK) {
		xil_printf("INI: start_ftpctrl_application: tcp_connect returned error: %d\r\n", err);
		return err;
	}
	//xil_printf("ctrl_port=%d\n\r", local_ctrl_ftp_port);
//	/* initialize data buffer being sent */
//	for (i = 0; i < SEND_BUFSIZE; i++)
//		send_buf[i] = (i % 10) + '0';

	return 0;
}

//**********************************************************
//
// FTP DATA
//
//**********************************************************
static int ftpdata_connected = 0;

static struct tcp_pcb *ftpdata_pcb;
static struct tcp_pcb *ftpdata_connected_pcb = NULL;
//err_t ftp_send_data(char * data, u16_t len);


//static err_t
//ftpdata_sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
//{
//	ftp_frame_acknowlodged = 1;
//	return ERR_OK;
//}

static err_t
ftpdata_rcv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
	int len = p->len;
	//xil_printf("INI: ftpdata_rcv_callback: p->len=%d tpcb->state=%d\n\r", p->len, tpcb->state);
	if(tpcb->state == ESTABLISHED || tpcb->state == CLOSE_WAIT)
	{
		memcpy(receive_buffer+receive_buffer_offset, p->payload, p->len);
		receive_buffer_offset += p->len;
		//xil_printf("%d\n\r", receive_buffer_offset);
	}
	//memcpy(receive_buffer, p->payload, (p->len < SIZEOF_SETTINGS_BUFFER ?  p->len : SIZEOF_SETTINGS_BUFFER));
	tcp_recved(tpcb, len);
	pbuf_free(p);
	print(".");
	return ERR_OK;
}

//static int start_ftpdata_application();

static void
ftpdata_client_err_callback(void * arg, err_t err)
{
	xil_printf("INI: ftpdata_client_err_callback: err=%d\n\r", err);
	//if(err == -11)
	//	start_ftpdata_application();
}

static err_t
ftpdata_connected_callback(void *arg, struct tcp_pcb *tpcb, err_t err)
{
	xil_printf("INI: ftpdata_connected_callback: Connected to ftpdata server\r\n");
//    txperf_client_connected = 1;
	/* store state */
	ftpdata_connected_pcb = tpcb;
	ftpdata_connected = 1;

	/* set callback values & functions */
	tcp_arg(tpcb, NULL);
	//tcp_sent(tpcb, ftpdata_sent_callback);
	tcp_recv(tpcb, ftpdata_rcv_callback);

	/* initiate data transfer */
	return ERR_OK;
}

static int
start_ftpdata_application()
{
	err_t err;
	struct ip_addr ipaddr;

	print("INI: start_ftpdata_application\n\r");

	/* create new TCP PCB structure */
	ftpdata_pcb = tcp_new();
	if (!ftpdata_pcb) {
		xil_printf("INI: start_ftpdata_application: Error creating PCB. Out of Memory\r\n");
		return -1;
	}

	/* !!! NAS IP-address !!! */
	//IP4_ADDR(&ipaddr,  192, 168,   7, 1);		/* iperf server address */
	ipaddr.addr = FTP_SERVER_IP;

	err = tcp_connect(ftpdata_pcb, &ipaddr, port_str, ftpdata_connected_callback);
	tcp_err(ftpdata_pcb, ftpdata_client_err_callback);
//	txperf_client_connected = 0;
	if (err != ERR_OK) {
		xil_printf("INI: start_ftpdata_application: tcp_connect returned error: %d\r\n", err);
		return err;
	}

	return 0;
}

static enum  {no_state = 0,
	idle_state = 10,
	connect_ack_state,
	user_state,
	user_ack_state,
	pass_state,
	pass_ack_state,
	cwd_state,
	cwd_ack_state,
	type_state,
	type_ack_state,
	wait_4readcmd,
	pasv_state,
	pasv_ack_state,
	start_ftpdata_application_state=30,
	start_ftpdata_application_wait_state,
	retr_state = 40,
	retr_ack_state = 50,
	file_not_found_state,
	frame_rcv_state,
	tcp_data_close_state,
	tcp_ctrl_close_state,
	parse_state1, parse_state2, parse_state3, parse_state4,
	copy_state,
	complete_state = 90} ftp_state = no_state;

u32 len, err;
u64 long_param1, long_param2;
u32 int_param1, int_param2;
char* p;
int f_start, f_stop;

u32 test_file(u16* addr, int n)
{
	u32 i;
	for(i=0;i<n;i++)
		if(*(addr+i) != i%65536)
			return i;
	return 0;
}



void ftp_config_sm()
{
	int ret, i;
	//xil_printf("<%d>", ftp_state);
	switch(ftp_state)
	{
		// idle state
		case no_state:
			break;
		case idle_state:
			start_ftpctrl_application();
			ftp_state = connect_ack_state;
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
			if(pass_acknowledged)
			{
				pass_acknowledged=0;
				ftp_state = cwd_state;
			}
			break;
		case cwd_state:
			if(SendFTPcmd("CWD CONFIG\r\n") == 0)
				ftp_state = cwd_ack_state;
			break;
		case cwd_ack_state:
			if(cwd_acknowledged)
			{
				cwd_acknowledged=0;
				ftp_state = type_state;
			}
			break;
		case type_state:
			if(SendFTPcmd("TYPE I\r\n") == 0)
				ftp_state = type_ack_state;
			break;
		case type_ack_state:
			if(type_acknowledged)
			{
				type_acknowledged=0;
				ftp_state = pasv_state;
			}
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
			ftp_state = start_ftpdata_application_wait_state;
			break;
		case start_ftpdata_application_wait_state:
			if(ftpdata_connected)
			{
				ftpdata_connected = 0;
				ftp_state = retr_state;
			}
			break;
		case retr_state:
			if(SendFTPcmd(filename_cmd/*"RETR spaciroc.bin\r\n"*/) == 0)
			{
				ftp_state = retr_ack_state;
			}
		case retr_ack_state:
			if(retr_acknowledged)
			{
				retr_acknowledged=0;
				ftp_state = frame_rcv_state;
			}
			else if(file_not_found)
			{
				file_not_found=0;
				ftp_state = file_not_found_state;
			}
			break;
		case file_not_found_state:
			break;
		case frame_rcv_state:
			if(retr_complete)
			{
				retr_complete = 0;
				ftp_state = tcp_data_close_state;
			}
			break;
		case tcp_data_close_state:
			//ret = tcp_close(/*ftpdata_pcb*/ftpdata_connected_pcb);
			//if(ret)
			//	xil_printf("tcp_data_close_state: tcp_close returns %d\n\r", ret);
			ftp_state = tcp_ctrl_close_state;
			break;
		case tcp_ctrl_close_state:
			//ret = tcp_close(ftpctrl_connected_pcb);
			//if(ret)
			//	xil_printf("tcp_ctrl_close_state: tcp_close returns %d\n\r", ret);
			SendFTPcmd("QUIT\r\n");
			ftp_state = complete_state;
//			for (i=0;i<receive_buffer_offset;i++)
//			{
//				xil_printf("%c", receive_buffer[i]);
//				if(receive_buffer[i] == '\n')
//					print("\r");
//			}
//			xil_printf("receive_buffer_offset=%d\n\r", receive_buffer_offset);
//			print("Test region:");
//			xil_printf("Error in %d\n\r", test_file((u16*)receive_buffer, receive_buffer_offset/2));
			break;
		case complete_state:
			break;
	}
}

void StartFTP_config()
{
	print("StartFTP_INI...\n\r");
	ftp_state = no_state;
}

void ReadFile(char* fnm, char* data)
{
	receive_buffer = data;
	receive_buffer_offset = 0;
	strcpy(filename_cmd, fnm);
	xil_printf("Reading file %s from FTP server\n\r", filename_cmd);
	ftp_state = idle_state;
}

int GetFTP_ini_State()
{
	return ftp_state;
}

int IsRetrComplete()
{
	return (ftp_state == complete_state);
}

int GetFileSize()
{
	return receive_buffer_offset;
}

int IsSettingsObtained()
{
	return (ftp_state == complete_state);
}

void StartNetCat(char* data)
{
	receive_buffer = data;
	start_ftpdata_application();
}

//u32 Get_receive_buffer_offset()
//{
//	return receive_buffer_offset;
//}
