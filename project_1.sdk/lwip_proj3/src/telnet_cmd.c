#include "lwip/err.h"
#include "lwip/tcp.h"
//#include "spectral_err.h"
#include "axi_spectral_core.h"
#include <string.h>
#include "hv.h"
#include "pdmdp_err.h"
#include "axis_flowctrl_d1.h"
#include "axis_flowctrl_d2.h"


#include "unix_date_time.h"
#include "xl2_trigger.h"

extern XL2_trigger l2trigger;

u32 frame_buffer[N_OF_PIXEL_PER_PDM/3/4];
u32 frame_buffer_all_pdm[N_OF_PIXEL_PER_PDM/4];



u32 frame_counter = 0;
extern SCurveStruct sCurveStruct;
extern InstrumentState instrumentState;
DebugSettings debugSettings;

void SetInstrumentMode(u32 mode)
{
	instrumentState.mode = mode;
	if(mode != 0)
	{
		ResetGTUCounter_D1();
		ResetGTUCounter_D2();
	}
}


void ProcessTelnetCommands(struct tcp_pcb *tpcb, struct pbuf* p, err_t err)
{
	u8 str_len=0; char reply[128];
	u32 get_len, param, i;
	u32 param0, param1, param2, param3, param4;
	u64 long_param;
	u8 array_param[15];
	char ans_str[64]; u8 ans_pos;
	char buf[10];
	double double_param, double_param2, double_param3;
	int ret;
	int turn[NUM_OF_HV];
	u32 pmt_trig1,  pmt_trig2,  ec_trig1,  ec_trig2,  pdm_trig1,  pdm_trig2;
	// print command
	print("TCP: ");
	for(i=0; i<p->len; i++)
		xil_printf("%c", *(char*)(p->payload+i));
	print("\r");
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
		sprintf(reply, "%d %d\n\r", /*GetFTP_bin_State()*/40, instrumentState.mode);
		tcp_write(tpcb, reply, sizeof(reply), 1);
	}
	else if(strncmp(p->payload, "instrument ver", 14) == 0)
	{
		//char ok_eomess_str[] = "Ok\n\r";
		strcpy(ans_str, __DATE__);
		strcat(ans_str, " ");
		strcat(ans_str, __TIME__);
		strcat(ans_str, " ");
		strcat(ans_str, MINIEUSO_ZYNQ_VER_STRING);
		strcat(ans_str, "\r\n");
		tcp_write(tpcb, ans_str, strlen(ans_str), 1);
	}
	else if(sscanf(p->payload, "instrument mode %d %d",
			&param, &param2) == 2)
	{
		if(param == 0)
			SendLogToFTP();
		SetInstrumentMode(param);
		SetTime(param2);
		DateTime dateTime;
		convertUnixTimeToDate(param2, &dateTime);
		xil_printf("%s\n\r", formatDate(&dateTime, 0));

		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
		//if(param == 0)
		//	SendLogToFTP();
	}
	else if(sscanf(p->payload, "instrument mode %d",
			&param) == 1)
	{
		if(param == 0)
			SendLogToFTP();
		SetInstrumentMode(param);
		RunStopping();
		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
		//if(param == 0)
		//	SendLogToFTP();
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
	else if(sscanf(p->payload, "acq scurve %d %d %d %d",
			&param0,
			&param1,
			&param2,
			&param3) == 4)
	{
		if(instrumentState.mode == 0/*INSTRUMENT_MODE_NONE*/)
		{
			print("Starting S-curve gathering...\n\r");
			u32 datasize = 0;
			ret = StartScurveGathering(param0, param1, param2, param3);
			char str[] = "Ok\n\r";
			tcp_write(tpcb, str, sizeof(str), 1);
		}
		else
		{
			char str[20];
			sprintf(str, "Error %d\n\r", ERR_INSTR_MODE_MUSTBE_0);
			tcp_write(tpcb, str, sizeof(str), 1);
		}
	}
	else if(strncmp(p->payload, "acq scurve status", 17) == 0)
	{
		SCurveStruct* pSCurveStruct;
		pSCurveStruct = GetSCurveStruct();
		sprintf(reply, "CurrentDAC=%d GatheringInProgress=%d\n\r", pSCurveStruct->current_dac_value, pSCurveStruct->is_scurve_being_gathered);
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(sscanf(p->payload, "acq test %d", &param) == 1)
	{
		SetDataProviderTestMode(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
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
	else if(sscanf(p->payload, "settime %d",
			&param0) == 1)
	{
		SetTime(param0);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "gettime", 7) == 0)
	{
		sprintf(reply, "%d\n\r", *(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGR_UNIX_TIME*4));
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(strncmp(p->payload, "trig event_log start", 20) == 0)
	{
		DMA_events_log_start();
		StartEventsLog_L1();
		StartEventsLog_L2();
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "trig n_bg %d",&param0) == 1)
	{
		XL2_trigger_Set_N_BG(&l2trigger, param0);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "trig low_thresh %d",&param0) == 1)
	{
		XL2_trigger_Set_LOW_THRESH(&l2trigger, param0);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "trig event_log stop", 19) == 0)
	{
		u32 num_of_records, num_of_records_L1, num_of_records_L2;
		char str_ok[] = "Ok\n\r";
		char str_err[] = "Error 100\n\r"; //ERR_FTP_CLIENT_IS_BUSY
		if(!IsFTP_bin_idle())
		{
			tcp_write(tpcb, str_err, sizeof(str_err), 1);
		}
		else
		{
			num_of_records_L1 = StopEventsLog_L1();
			num_of_records_L2 = StopEventsLog_L2();
			num_of_records = num_of_records_L1 + num_of_records_L2;
			Inject16Events2DMA();
			ResetDMATrigEventLog();
			SendSpectrum2FTP(Get_DataDMA_events_L1_ptr_and_invalidate(num_of_records),
					num_of_records*sizeof(DATA_TYPE_EVENTS_LOG), "event_log.bin");
			tcp_write(tpcb, str_ok, sizeof(str_ok), 1);
		}
	}
	else if(strncmp(p->payload, "trg", 3) == 0)
	{
		TrgImmediate();
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
//	u32 pmt_trig1, u32 pmt_trig2, u32 ec_trig1, u32 ec_trig2, u32 pdm_trig1, u32 pdm_trig2;

	else if(sscanf(p->payload, "trig1ta %d %d %d %d %d %d",
			&pmt_trig1, &pmt_trig2, &ec_trig1, &ec_trig2, &pdm_trig1, &pdm_trig2) == 3)
	{
		char str[] = "Ok\n\r";
		SetL1TAthresholds(pmt_trig1, pmt_trig2, ec_trig1, ec_trig2, pdm_trig1, pdm_trig2);
		tcp_write(tpcb, str, sizeof(str), 1);
		SetupHVPSIntrSystem(getIntcPtr());
	}
	else if(sscanf(p->payload, "mmg N1 %d",
				&param0) == 1)
	{
		Set_N1(param0);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "mmg N2 %d",
				&param0) == 1)
	{
		Set_N2(param0);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "updatefw start", 14) == 0)
	{
		StartUpdateFW();
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "updatefw status", 15) == 0)
	{
		param = IsFW_updated();
		char str1[] = "1\n\r";
		char str0[] = "0\n\r";
		if(param)
			tcp_write(tpcb, str1, sizeof(str1), 1);
		else
			tcp_write(tpcb, str0, sizeof(str0), 1);
	}
	else if(strncmp(p->payload, "exit", 4) == 0 || strncmp(p->payload, "quit", 4) == 0)
	{
		tcp_close(tpcb);
	}
	else
	{
		static int called = 0;
		strcpy(ans_str, "Error 1\n\r");
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
