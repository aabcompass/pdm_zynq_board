/*
 * ftp_server.c
 *
 *  Created on: Jun 26, 2018
 *      Author: alx
 */
#include "lwip/err.h"
#include "lwip/tcp.h"

#include "ftp_server.h"
#include "pdmdp_err.h"
#include "string.h"
#include "axi_spectral_core.h"

static u32 ip_addr_client;
static u16 port_client;
static int ftp_frame_acknowledged = 0;

struct tcp_pcb* ctrl_tpcb;
char not_reply_message[100];
u8 is_message = 0;
char spare[10000];

FileRecord files[MAX_FILES];

static enum  {
	no_state = 0,
	start_send_dir = 20,
	wait_connect = 25,
	look_for_the_next_record = 30,
	send_filename_record = 40,
	wait_state,
	send_control_message,
	close_ftp_data = 50,
	start_send_file = 100,
	wait_connect2 = 125,
	send_portion = 150,
	wait_state2 = 175,
	close_ftp_data2 = 200,
	send_control_message2 = 220
} ftp_state = no_state;

char file1[] = "The content of the file 1";
char file2[] = "The content of the file 2";

static int current_record, requested_record, spectrum_nbytes, portion_size;
static char* spectrum_addr;

int dir_list_short;

int GetFTPstate()
{
	return ftp_state;
}

void FileSystemInit()
{
	memset(files, 0, sizeof(files));
	//CreateFile("file1.bin", file1, sizeof(file1), 0, file_regular);
	//CreateFile("file2.bin", file2, sizeof(file2), 0, file_regular);
	//PrintFS();
}

int CreateFile(char* filename, char* pData, int size, uint32_t unix_time, File_types file_type)
{
	int i;
	// check whether file name is too long
	if(strlen(filename) > MAX_FILENAME_LEN-1)
		return FILENAME_IS_TOO_LONG;
	// check whether does filename already exist
	for(i=0;i<MAX_FILES;i++)
	{
		if(files[i].is_presented == 1)
			if(strcmp(filename, files[i].filename) == 0)
				return FILE_ALREADY_EXIST;
	}
	//looking for empty record
	for(i=0;i<MAX_FILES;i++)
	{
		if(files[i].is_presented == 0)
		{
			strcpy(files[i].filename, filename);
			files[i].length = size;
			files[i].file_type = file_type;
			files[i].unix_time = unix_time;
			files[i].is_presented = 1;
			files[i].link = pData;
			return i;
		}
	}
	return TOO_MANY_FILES;
}

int DeleteFile(char* filename)
{
	int i;
	// check whether file name is too long
	if(strlen(filename) > MAX_FILENAME_LEN-1)
		return FILENAME_IS_TOO_LONG;
	// check whether does filename already exist
	for(i=0;i<MAX_FILES;i++)
	{
		if(files[i].is_presented == 1)
		{
			if(strcmp(filename, files[i].filename) == 0)
			{
				files[i].is_presented = 0;
				return 0;
			}
		}
	}
	return NO_SUCH_FILE;
}

void SendDir(int is_short)
{
	dir_list_short = is_short;
	if(ftp_state == no_state)
		ftp_state = start_send_dir;
	else
		print("Send data SM is not in the IDLE state!\r\n");
}

void SendFile()
{
	if(ftp_state == no_state)
	{
		ftp_state = start_send_file;
		spectrum_nbytes = files[requested_record].length;
		spectrum_addr = files[requested_record].link;
	}
	else
		print("Send data SM is not in the IDLE state!\r\n");
}

void RestartFile(u32 point)
{
	if(ftp_state == no_state)
	{
		ftp_state = start_send_file;
		spectrum_nbytes = files[requested_record].length - point;
		spectrum_addr = files[requested_record].link + point;
	}
	else
		print("Send data SM is not in the IDLE state!\r\n");
}

void SendNotReplyMessage(struct tcp_pcb *tpcb, char* text)
{
	ctrl_tpcb = tpcb;
	strcpy(not_reply_message, text);
	is_message = 1;
}

void ProcessFTPCommands(struct tcp_pcb *tpcb, struct pbuf* p, err_t err)
{
	char str2[25];
	char str3[250];
	int ip0, ip1, ip2, ip3, port0, port1, i;
	char filename[MAX_FILENAME_LEN];
	u32 param;
	if(sscanf(p->payload, "USER %s", str2) == 1)
	{
		sprintf(str3, "331 Please specify the password.\r\n", str2);
		tcp_write(tpcb, str3, strlen(str3), 1);
	}
	else if(strncmp(p->payload, "PASS", 4) == 0)
	{
		char ok_eomess_str[] = "230 Login successful.\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "PWD", 3) == 0)
	{
		char ok_eomess_str[] = "257 / is the current directory\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "SYST", 4) == 0)
	{
		char ok_eomess_str[] = "215 UNIX Type: L8\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "TYPE I", 6) == 0)
	{
		char ok_eomess_str[] = "200 Switching to Binary mode.\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "MDTM", 4) == 0)
	{
		char ok_eomess_str[] = "213 20000101000000\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "FEAT", 4) == 0)
	{
		char ok_eomess_str[] = "211 no features\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "CWD /", 5) == 0)
	{
		char ok_eomess_str[] = "250 Directory successfully changed.\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(sscanf(p->payload, "PORT %d,%d,%d,%d,%d,%d",
			&ip0, &ip1, &ip2, &ip3, &port0, &port1) == 6)
	{
		ip_addr_client = (ip0) | (ip1<<8) | (ip2<<16) | (ip3<<24);
		port_client = (port0<<8) | port1;
		char ok_eomess_str[] = "200 PORT command successful\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "LIST", 4) == 0)
	{
		//char ok_eomess_str[] = "150 Here comes the directory listing.\r\n";
		//tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
		SendDir(0);
	}
	else if(strncmp(p->payload, "NLST", 4) == 0)
	{
		//char ok_eomess_str[] = "150 Here comes the directory listing.\r\n";
		//tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
		SendDir(1);
	}
	else if(strncasecmp(p->payload, "QUIT", 4) == 0)
	{
		char ok_eomess_str[] = "221 Goodbye.\r\n";
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);

		//tcp_close(tpcb);
	}
	else if(sscanf(p->payload, "RETR %s",
			filename) == 1)
	{
		xil_printf("Requested file %s\n\r", filename);
		for(i=0;i<MAX_FILES;i++)
		{
			if(files[i].is_presented == 1)
			{
				if(strcmp(filename, files[i].filename) == 0)
				{
					requested_record = i;
					break;
				}
			}
		}
		if(i==MAX_FILES)
		{
			char ok_eomess_str[] = "550 Requested action ot taken. File unavailable\r\n";
			tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
		}
		else
		{
			sprintf(str3, "150 Opening BINARY mode data connection for %s (%d bytes).\r\n", files[requested_record].filename, (int)files[requested_record].length);
			tcp_write(ctrl_tpcb, str3, strlen(str3), 1);
			SendFile();
		}
	}
	else if(sscanf(p->payload, "REST %s",
			param) == 1)
	{
		RestartFile(param);
	}
	else if(sscanf(p->payload, "DELE %s",
			filename) == 1)
	{
		xil_printf("Delete file %s\n\r", filename);
		for(i=0;i<MAX_FILES;i++)
		{
			if(files[i].is_presented == 1)
			{
				if(strcmp(filename, files[i].filename) == 0)
				{
					files[i].is_presented = 0;
					if(files[i].file_type == file_scidata)
					{
						((DATA_TYPE_SCI_ALLTRG_RECORD*)(files[i].link))->is_occupied = 0;
						xil_printf("link addr %08X freed\n\r", files[i].link);
					}
					char ok_eomess_str[] = "250 File successfully deleted\r\n";
					tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
					break;
				}
			}
		}
		if(i==MAX_FILES)
		{
			char ok_eomess_str[] = "550 Requested action not taken. File unavailable\r\n";
			tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
		}
	}
	else
	{
		char ok_eomess_str[] = "500 Unknown command.\r\n";
		print("UNKNOWN FTP CMD:\n\r");
		print(p->payload);
		tcp_write(tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
		for(i=0; i<p->len; i++)
			xil_printf("%02X " , ((char*)p->payload)[i]);
	}
}

//////////////////////////
// data tcp connection
//////////////////////////
//**********************************************************
//
// FTP DATA
//
//**********************************************************
volatile int ftpserver_data_connected = 0;

static struct tcp_pcb *ftpdata_pcb;


static err_t
ftpdata_sent_callback(void *arg, struct tcp_pcb *tpcb, u16_t len)
{
	ftp_frame_acknowledged = 1;
	//print("\n\r->\n\r");
	//tcp_packets_counter--;
	return ERR_OK;
}


static err_t ftp_send_data(char * data, u16_t len)
{
	err_t err;
	//print("ftp_send_data()...\r\n");
	tcp_sent(ftpdata_pcb, ftpdata_sent_callback);
	err = tcp_write(ftpdata_pcb, data, len, 1);
	if (err != ERR_OK)
	{
		xil_printf("BIN: ftp_send_data: Error on tcp_write: %d, len=%d, tpcb=0x%08x\r\n", err, len, ftpdata_pcb);
		return err;
	}
	err = tcp_output(ftpdata_pcb);
	if (err != ERR_OK)
		xil_printf("BIN: ftp_send_data: Error on tcp_output: %d\r\n",err);
	return err;
}

static void
ftpdata_client_err_callback(void * arg, err_t err)
{
	xil_printf("BIN: ftpdata_client_err_callback: err=%d,\t state=%d\n\r", err, ftp_state);
	print("FTP server it returned to default state\n\r");
	ftp_state = 0;
}

static err_t
ftpdata_connected_callback(void *arg, struct tcp_pcb *tpcb, err_t err)
{
	//xil_printf("txperf: Connected to ftpdata server\r\n");
	ftpserver_data_connected = 1;
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
start_ftpserver_data()
{
	err_t err;
	struct ip_addr ipaddr;
	//xil_printf("start_ftpserver_data(), IP=%08x\n\r", ip_addr_client);

	/* create new TCP PCB structure */
	ftpdata_pcb = tcp_new();
	if (!ftpdata_pcb) {
		xil_printf("BIN: start_ftpdata_application: Error creating PCB. Out of Memory\r\n");
		return -1;
	}

	ipaddr.addr = ip_addr_client;

	err = tcp_connect(ftpdata_pcb, &ipaddr, port_client, ftpdata_connected_callback);
	tcp_err(ftpdata_pcb, ftpdata_client_err_callback);
	if (err != ERR_OK) {
		xil_printf("BIN: start_ftpdata_application: tcp_connect returned error: %d\r\n", err);
		return err;
	}

	return 0;
}

//////////////////////////
// control tcp connection
//////////////////////////

static err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	/* do not read the packet if we are not in ESTABLISHED state */
	//print("b");
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);


	ProcessFTPCommands(tpcb, p, err);

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */

	/* free the received pbuf */
	pbuf_free(p);
	ctrl_tpcb = tpcb; //Leads to error
	return ERR_OK;
}

char wellcome_str[] = "220 (Baremetal non standard FTP server)\r\n";

static err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;
	print("a");

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)connection);

	tcp_write(newpcb, wellcome_str, strlen(wellcome_str), 1);
	/* increment for subsequent accepted connections */
	connection++;

	//ctrl_tpcb = *newpcb; //leads to memory errors

	return ERR_OK;
}

int start_ftp_server_cmd()
{
	struct tcp_pcb *pcb;
	err_t err;

	unsigned port = 21; //

	/* create new TCP PCB structure */
	pcb = tcp_new();
	if (!pcb) {
		xil_printf("Error creating PCB. Out of Memory\n\r");
		return -1;
	}

	/* bind to specified @port */
	err = tcp_bind(pcb, IP_ADDR_ANY, port);
	if (err != ERR_OK) {
		xil_printf("Unable to bind to port %d: err = %d\n\r", port, err);
		return -2;
	}

	/* we do not need any arguments to callback functions */
	tcp_arg(pcb, NULL);

	/* listen for connections */
	pcb = tcp_listen(pcb);
	if (!pcb) {
		xil_printf("Out of memory while tcp_listen\n\r");
		return -3;
	}

	/* specify callback to use for incoming connections */
	tcp_accept(pcb, accept_callback);

	//ctrl_tpcb = &pcb; //doesn't work
	xil_printf("TCP commands server started @ port %d\n\r", port);

	return 0;
}

void PrintFS()
{
	int i;
	for(i=0; i<MAX_FILES; i++)
	{
		if(files[i].is_presented)
			printf("-r--r--r-- 1 1001 1001 %d Jan 01 2000 %s\r\n", (int)files[i].length, files[i].filename);
	}
}

void send_data_sm()
{
	//char dir_sent_str[] = "226 Directory send OK.\r\n";
	int buf_sz, ret;
	char file_record[100];
	char str3[250];
	switch(ftp_state)
	{
	case no_state:
		ftp_frame_acknowledged = 0;
		ftpserver_data_connected = 0;
		break;
	case start_send_dir:
		print("Send directory list...\n\r");
		current_record = 0;
		start_ftpserver_data();
		ftp_state = wait_connect;
		break;
	case wait_connect:
		if(ftpserver_data_connected == 1)
		{
			ftp_state = look_for_the_next_record;
			ftpserver_data_connected = 0;
			char ok_eomess_str[] = "150 Here comes the directory listing.\r\n";
			tcp_write(ctrl_tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
		}
		break;
	case look_for_the_next_record:
		if(current_record >= MAX_FILES)
			ftp_state = close_ftp_data;
		else if(files[current_record].is_presented)
			ftp_state = send_filename_record;
		else
			current_record++;
		break;
	case send_filename_record:
		if(dir_list_short == 0)
			sprintf(file_record, "-r--r--r-- 1 1001 1001 %d Jan 01 2000 %s\r\n", (int)files[current_record].length, files[current_record].filename);
		else
			sprintf(file_record, "%s\r\n", (int)files[current_record].length, files[current_record].filename);
		//print(file_record);
		ftp_send_data(file_record, strlen(file_record));
		current_record++;
		ftp_state = wait_state;
		break;
	case wait_state:
		if(ftp_frame_acknowledged)
		{
			ftp_frame_acknowledged = 0;
			ftp_state = look_for_the_next_record;
		}
		break;
	case close_ftp_data:
		buf_sz=tcp_sndbuf(ftpdata_pcb);
		//xil_printf("tcp_data_close_state: buf_sz=%d\n\r", buf_sz);
		if(buf_sz == 8192)
		{
			ret = tcp_close(/*ftpdata_connected_pcb*/ftpdata_pcb);
			if(ret) xil_printf("tcp_close data returns %d\n\r", ret);
			ftp_state = send_control_message;
		}
		break;
	case send_control_message:
		{
			char str2[] = "226 Directory send OK.\r\n";
			tcp_write(ctrl_tpcb, str2, strlen(str2), 1);
			//char ok_eomess_str[] = "150 Here comes the directory listing.\r\n";
			//tcp_write(ctrl_tpcb, ok_eomess_str, strlen(ok_eomess_str), 1);
			ftp_state = no_state;
			break;
		}
	case start_send_file:
		start_ftpserver_data();
		ftp_state = wait_connect2;
		break;
	case wait_connect2:
		if(ftpserver_data_connected == 1)
		{
			ftp_state = send_portion;
			ftpserver_data_connected = 0;
//			sprintf(str3, "150 Opening BINARY mode data connection for %s (%d bytes).\r\n", files[requested_record].filename, (int)files[requested_record].length);
//			tcp_write(ctrl_tpcb, str3, strlen(str3), 1);
		}
	case send_portion:
		portion_size = spectrum_nbytes > MAX_SIZE_TCP_PACKET ? MAX_SIZE_TCP_PACKET : spectrum_nbytes;
		ret = ftp_send_data(spectrum_addr, portion_size);
		if(ret == 0)
		{
			spectrum_addr += portion_size;
			spectrum_nbytes -= portion_size;
			//xil_printf("%d\n\r", spectrum_nbytes);
			ftp_state = wait_state2;
		}
		break;
	case wait_state2:
		if(ftp_frame_acknowledged)
		{
			ftp_frame_acknowledged = 0;
			if(spectrum_nbytes)
			{
				//print(".");
				ftp_state = send_portion;
			}
			else
			{
				ftp_state = close_ftp_data2;
			}
		}
		break;
	case close_ftp_data2:
		buf_sz=tcp_sndbuf(ftpdata_pcb);
		//xil_printf("tcp_data_close_state: buf_sz=%d\n\r", buf_sz);
		if(buf_sz == 8192)
		{
			ret = tcp_close(ftpdata_pcb);
			if(ret) xil_printf("tcp_close data returns %d\n\r", ret);
			ftp_state = send_control_message2;
		}
		break;
	case send_control_message2:
		{
//			sprintf(str3, "150 Opening BINARY mode data connection for %s (%d bytes).\r\n", files[requested_record].filename, (int)files[requested_record].length);
//			tcp_write(ctrl_tpcb, str3, strlen(str3), 1);
			char str2[] = "226 Transfer complete.\r\n";
			tcp_write(ctrl_tpcb, str2, strlen(str2), 1);
			ftp_state = no_state;
			break;
		}
	}

	//if(ftp_state != 0)
	//	xil_printf(" %d\n\r", ftp_state);
}

//send not reply messages
void TestFunc()//if(is_message)
{
	is_message = 0;
	tcp_write(ctrl_tpcb, not_reply_message, strlen(not_reply_message), 1);
}

int RemoveAllSciDataFilesFromFTP()
{
	int i,j=0;
	for(i=0;i<MAX_FILES;i++)
	{
		if(files[i].is_presented == 1 && files[i].file_type == file_scidata)
		{
			files[i].is_presented = 0;
			j++;
		}
	}
	return j;
}
