#include "lwip/err.h"
#include "lwip/tcp.h"
//#include "spectral_err.h"
#include "axi_spectral_core.h"
#include <string.h>
#include "hv.h"

u32 frame_buffer[N_OF_PIXEL_PER_PDM/3/4];
u32 frame_buffer_all_pdm[N_OF_PIXEL_PER_PDM/4];


u32 scurve_counter = 0;
u32 frame_counter = 0;
extern SCurveStruct sCurveStruct;
extern InstrumentState instrumentState;
DebugSettings debugSettings;


void ProcessTelnetCommands(struct tcp_pcb *tpcb, struct pbuf* p, err_t err)
{
	u8 str_len=0; char reply[128];
	u32 get_len, param, i;
	u64 long_param;
	u8 array_param[15];
	char ans_str[64]; u8 ans_pos;
	char buf[10];
	double double_param, double_param2, double_param3;
	int ret;
	int turn[NUM_OF_HV];
	if(strncmp(p->payload, "help", 4) == 0)
	{
		char ok_eomess_str[] = "Mini-EUSO PDM DP console\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "test connect", 12) == 0)
	{
		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "instrument status", 17) == 0)
	{
		char ok_eomess_str[] = "Ok\n\r";
		sprintf(reply, "%d %d\n\r", GetFTP_bin_State(), instrumentState.mode);
		tcp_write(tpcb, reply, sizeof(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "instrument ver", 14) == 0)
	{
		//char ok_eomess_str[] = "Ok\n\r";
		strcpy(ans_str, __DATE__);
		strcat(ans_str, " ");
		strcat(ans_str, __TIME__);
		strcat(ans_str, "\r\n");
		tcp_write(tpcb, ans_str, strlen(ans_str), 1);
	}
	else if(sscanf(p->payload, "instrument mode %d",
			&param) == 1)
	{
		instrumentState.mode = param;
		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "instrument start", 16) == 0)
	{
		//This function does nothing
		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "instrument stop", 15) == 0)
	{
		//This function does nothing
		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
	}

	//	else if(strncmp(p->payload, "acq start", 9) == 0)
//	{
//		GetFrameFromOneArtix(frame_buffer);
//		SendSpectrum2FTP(frame_buffer, sizeof(frame_buffer), "data_from_2ecasic.dat");
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(strncmp(p->payload, "acq shot", 8) == 0)
//	{
//		GetFrameFromAllArtix(frame_buffer_all_pdm);
//		char filename_str[20];
//		sprintf(filename_str, "fr_%08d.dat", frame_counter++);
//		SendSpectrum2FTP(frame_buffer_all_pdm, sizeof(frame_buffer_all_pdm), filename_str);
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(strncmp(p->payload, "acq bunch", 9) == 0)
//	{
//		Get128FramesFromOneArtix1(scurve_buffer, NUM_OF_PIXELS_PER_FRAME/3/4*FRAMES_PER_BUNCH);
//		SendSpectrum2FTP(scurve_buffer, sizeof(scurve_buffer));
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(strncmp(p->payload, "acq scurve", 10) == 0)
//	{
//		u32 datasize = 0;
//		char filename_str[20];
//		GetSCurveFromOneArtix1(scurve_buffer, &datasize);
//		xil_printf("datasize=%d\n\r", datasize);
//		sprintf(filename_str, "sc_%08d.dat", scurve_counter++);
//		SendSpectrum2FTP(scurve_buffer, datasize, filename_str);
//		//TODO !!! We must wait for operation complete !!!
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(strncmp(p->payload, "acq tcp", 7) == 0)
//	{
//		//for(i=0;i<2304;i++)
//		//	scurve_buffer[i]=i;
//		StartGatherOneFrameFromArtix();
//		//TODO//GetFrameFromAllArtix(scurve_buffer);
//		ret = tcp_write(tpcb, scurve_buffer, 2304, 1);
//		xil_printf("tcp_write returns %d\n\r", ret);
//	}
//	else if(strncmp(p->payload, "acq sc_pdm", 10) == 0)
//	{
//		u32 datasize = 0;
//		char filename_str[20];
//		GetSCurveFromAllArtix(scurve_buffer, &datasize);
//		xil_printf("datasize=%d\n\r", datasize);
//		sprintf(filename_str, "sc_%08d.dat", scurve_counter++);
//		SendSpectrum2FTP(scurve_buffer, datasize, filename_str);
//		//TODO !!! We must wait for operation complete !!!
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(sscanf(p->payload, "acq sweep %d %d %d %d",
//			&sCurveStruct.start_dac_value,
//			&sCurveStruct.step_dac_value,
//			&sCurveStruct.stop_dac_value,
//			&sCurveStruct.accumulation) == 4)
//	{
//		u32 datasize = 0;
//		char filename_str[20];
//		//TODO !!! Use new functions for gather data !!!
//		GetSCurveFromAllArtix(scurve_buffer, &datasize);
//		xil_printf("datasize=%d\n\r", datasize);
//		sprintf(filename_str, "sc_%08d.dat", scurve_counter++);
//		SendSpectrum2FTP(scurve_buffer, datasize, filename_str);
//		xil_printf("datasize=%d\n\r", datasize);
//		//TODO !!! We must wait for operation complete !!!
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(strncmp(p->payload, "acq shot", 8) == 0)
//	{
//		u32 datasize = 0;
//		char filename_str[20];
//		sCurveStruct.accumulation = 1;
//		//TODO//GetBurstFromAllArtix(scurve_buffer, &datasize);
//		sprintf(filename_str, "fr_%08d.dat", frame_counter++);
//		SendSpectrum2FTP(scurve_buffer, datasize, filename_str);
//		xil_printf("datasize=%d\n\r", datasize);
//		//TODO !!! We must wait for operation complete !!!
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(sscanf(p->payload, "acq burst %d",
//			&sCurveStruct.accumulation) == 1)
//	{
//		u32 datasize = 0;
//		char filename_str[20];
//		//TODO//GetBurstFromAllArtix(scurve_buffer, &datasize);
//		sprintf(filename_str, "fr_%08d.dat", frame_counter++);
//		SendSpectrum2FTP(scurve_buffer, datasize, filename_str);
//		xil_printf("datasize=%d\n\r", datasize);
//		//TODO !!! We must wait for operation complete !!!
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
	else if(sscanf(p->payload, "slowctrl all dac %d", &param) == 1)
	{
		debugSettings.current_thr = param;
		LoadSameDataToSlowControl2(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "hvps status interrupt", 21) == 0)
	{
		sprintf(reply, "%d\n\r", GetIntrState());
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(sscanf(p->payload, "hvps turnon %d %d %d %d %d %d %d %d %d",
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
		char str[] = "Ok\n\r";
		HV_turnON_list(turn);
		tcp_write(tpcb, str, sizeof(str), 1);
		SetupHVPSIntrSystem(getIntcPtr());
	}
	else if(sscanf(p->payload, "hvps turnoff %d %d %d %d %d %d %d %d %d",
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
		char str[] = "Ok\n\r";
		HV_turnOFF_list(turn);
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "hvps setdac %d %d %d %d %d %d %d %d %d",
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
		char str[] = "Ok\n\r";
		setDacValue_list(turn);
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "hvps cathode %d %d %d %d %d %d %d %d %d",
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
		HV_setCathodeVoltage(turn);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "hvps status gpio", 16) == 0)
	{
		HV_getStatus(turn);
		sprintf(reply, "%x %x %x %x %x %x %x %x %x\n\r",
				turn[0], turn[1], turn[2], turn[3], turn[4], turn[5], turn[6], turn[7], turn[8]);
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(strncmp(p->payload, "exit", 4) == 0 || strncmp(p->payload, "quit", 4) == 0)
	{
		tcp_close(tpcb);
	}
	else
	{
		static int called = 0;
		if(called)
			strcpy(ans_str, "Error 1\n\r");
		else
			strcpy(ans_str, "PDM DP console\n\r");
		tcp_write(tpcb, ans_str, strlen(ans_str), 1);
		called = 1;
	}
}

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

	if(p->len > 2)
		ProcessTelnetCommands(tpcb, p, err);

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */

	/* free the received pbuf */
	pbuf_free(p);

	return ERR_OK;
}

static err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;
	print("a");

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)connection);

	/* increment for subsequent accepted connections */
	connection++;

	return ERR_OK;
}


int start_telnet_cmd()
{
	struct tcp_pcb *pcb;
	err_t err;

	unsigned port = 23; // ���� ��� ������� ����������

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

	xil_printf("TCP commands server started @ port %d\n\r", port);

	return 0;
}
