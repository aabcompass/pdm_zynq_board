#include "lwip/err.h"
#include "lwip/tcp.h"
//#include "spectral_err.h"
#include "axi_spectral_core.h"
#include <string.h>
#include "hv.h"
#include "pdmdp_err.h"
#include "axis_flowctrl_d1.h"
#include "axis_flowctrl_d2.h"
#include "xparameters.h"


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

char err_str[20];

void SendErrorCommand(struct tcp_pcb *tpcb,  int err_code)
{
	sprintf(err_str, "Error %d\n\r", err_code);
	tcp_write(tpcb, err_str, strlen(err_str), 1);
}

void ProcessInstrumentModeCommand(struct tcp_pcb *tpcb, u32 param, u32 param2)
{
	if(instrumentState.err_SDcard)
	{
		print("Artix board is absent or bad or artix.bin on SD-card was generated for another Artix type\n\r");
		SendErrorCommand(tpcb, ERR_ARTIX_BOARD + instrumentState.err_SDcard);
	}
	else if(instrumentState.err_artix_bin)
	{
		print("Problems with loading Artix board\n\r");
		SendErrorCommand(tpcb, ERR_ARTIX_BOARD + instrumentState.err_artix_bin);
	}
	else if(instrumentState.artix_locked == 0)
	{
		print("Artix does not give clock\n\r");
		SendErrorCommand(tpcb, ERR_ARTIX_NOT_LOCKED);
	}
	else
	{
		if(param == 0)
			SendHVPSLogToFTP(1);
		else
			xil_printf("RRemoved  all sci data files from FTP server: %d files\n\r", RemoveAllSciDataFilesFromFTP());
		SetInstrumentMode(param);
		SetTime(param2);
		DateTime dateTime;
		convertUnixTimeToDate(param2, &dateTime);
		xil_printf("%s\n\r", formatDate(&dateTime, 0));

		if(param == 0)
			RunStopping();
		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
	}

}

void hvpson_cmd(int* turn, struct tcp_pcb *tpcb)
{
	if(!instrumentState.is_HVPS_OK)
	{
		print("Additional try to initialize HVPS\n\r");
		instrumentState.is_HVPS_OK = expIni(); //init hv
		if(!instrumentState.is_HVPS_OK)
		{
			print("HVPS seems not connected or powered\n\r");
			SendErrorCommand(tpcb, ERR_HVPS_DISCONN_OR_POWERED);
			return;
		}
	}
	HV_turnON_list(turn);
	SetupHVPSIntrSystem(getIntcPtr());
	char str[] = "Ok\n\r";
	tcp_write(tpcb, str, sizeof(str), 1);
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
	else if(strncmp(p->payload, "instrument clean", 16) == 0)
	{
		DeleteAllFiles();
		char ok_eomess_str[] = "Ok\n\r";
		tcp_write(tpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);
	}
	else if(strncmp(p->payload, "instrument ver", 14) == 0) //documented
	{
		char tmp_str[10];
		//char ok_eomess_str[] = "Ok\n\r";
		strcpy(ans_str, __DATE__);
		strcat(ans_str, " ");
		strcat(ans_str, __TIME__);
		strcat(ans_str, " ");
		strcat(ans_str, MINIEUSO_ZYNQ_VER_STRING);
		strcat(ans_str, "\r\n");
		sprintf(tmp_str, "%d\n\r", *(u32*)(XPAR_AXI_GPIO_0_BASEADDR+8));
		strcat(ans_str, tmp_str);
		tcp_write(tpcb, ans_str, strlen(ans_str), 1);
	}
	else if(sscanf(p->payload, "instrument mode %d %d", //documented
			&param, &param2) == 2)
	{
		ProcessInstrumentModeCommand(tpcb, param, param2);
	}
	else if(sscanf(p->payload, "instrument mode %d", //documented
			&param) == 1)
	{
		ProcessInstrumentModeCommand(tpcb, param, 0);
	}
	else if(sscanf(p->payload, "acq scurve %d %d %d %d", //documented
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
	else if(strncmp(p->payload, "acq scurve status", 17) == 0) //documented
	{
		SCurveStruct* pSCurveStruct;
		pSCurveStruct = GetSCurveStruct();
		sprintf(reply, "CurrentDAC=%d GatheringInProgress=%d\n\r", pSCurveStruct->current_dac_value, pSCurveStruct->is_scurve_being_gathered);
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(sscanf(p->payload, "acq test %d", &param) == 1) //documented
	{
		SetDataProviderTestMode(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl all dac %d", &param) == 1) //documented
	{
		debugSettings.current_thr = param;
		LoadSameDataToSlowControl2(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl line %d", &param) == 1) //documented
	{
		SetIndSCCurrentLine(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl asic %d", &param) == 1) //documented
	{
		SetIndSCCurrentAsic(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl pixel %d", &param) == 1) //documented
	{
		SetIndSCCurrentPixel(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl dac10 %d", &param) == 1) //documented
	{
		SetIndSCDac10(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl dac7 %d", &param) == 1) //documented
	{
		SetIndSCDac7(param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl mask %d", &param) == 1) //documented
	{
		//SetIndSCPixelMask(param);
		u32 pixel = GetIndSCCurrentPixel() + N_OF_PIXELS_PER_PMT*GetIndSCCurrentAsic();
		u32 line = GetIndSCCurrentLine();
		//LoadPixMaskTst(pixel, line, param);
		LoadPixMaskL1(pixel, line, param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl maskasic %d", &param) == 1) //documented
	{
		u32 pixel = N_OF_PIXELS_PER_PMT*GetIndSCCurrentAsic();
		u32 line = GetIndSCCurrentLine();
		for(i=pixel;i<pixel+N_OF_PIXELS_PER_PMT;i++)
			LoadPixMaskL1(i, line, param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "slowctrl maskline %d", &param) == 1) //documented
	{
		u32 line = GetIndSCCurrentLine();
		for(i=0;i<0+N_OF_PIXELS_PER_PMT*6;i++)
			LoadPixMaskL1(i, line, param);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "slowctrl apply", 14) == 0) //documented
	{
		SendUserIndSCSettingsToSp3();
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "slowctrl dac10?", 15) == 0) //documented
	{
		sprintf(reply, "%d\n\r", GetIndSCDac10());
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(strncmp(p->payload, "slowctrl dac7?", 14) == 0) //documented
	{
		sprintf(reply, "%d\n\r", GetIndSCDac7());
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
//	else if(strncmp(p->payload, "slowctrl mask?", 14) == 0)
//	{
//		sprintf(reply, "%d\n\r", GetIndSCPixelMask());
//		tcp_write(tpcb, reply, strlen(reply), 1);
//	}
	else if(strncmp(p->payload, "hvps status interrupt", 21) == 0) //documented
	{
		sprintf(reply, "%d\n\r", GetIntrState());
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(sscanf(p->payload, "hvps turnon %d %d %d %d %d %d %d %d %d", //documented
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
//		if(!instrumentState.is_HVPS_OK)
//		{
//			print("Additional try to initialize HVPS\n\r");
//			instrumentState.is_HVPS_OK = expIni(); //init hv
//			if(!instrumentState.is_HVPS_OK)
//			{
//				print("HVPS seems not connected or powered\n\r");
//				SendErrorCommand(tpcb, ERR_HVPS_DISCONN_OR_POWERED);
//				return;
//			}
//		}
//		HV_turnON_list(turn);
//		SetupHVPSIntrSystem(getIntcPtr());
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
		hvpson_cmd(turn, tpcb);
	}
	else if(strncmp(p->payload, "hvps turnon all", 15) == 0) //documented
	{
		for(i=0;i<9;i++) turn[i] = 1;
		hvpson_cmd(turn, tpcb);
	}
	else if(strncmp(p->payload, "hvps init", 9) == 0) //documented
	{
		print("Additional try to initialize HVPS\n\r");
		instrumentState.is_HVPS_OK = expIni(); //init hv
		if(!instrumentState.is_HVPS_OK)
		{
			print("HVPS seems not connected or powered\n\r");
			SendErrorCommand(tpcb, ERR_HVPS_DISCONN_OR_POWERED);
		}
		else
		{
			char str[] = "Ok\n\r";
			tcp_write(tpcb, str, sizeof(str), 1);
		}
	}
	else if(sscanf(p->payload, "hvps turnoff %d %d %d %d %d %d %d %d %d", //documented
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
		char str[] = "Ok\n\r";
		HV_turnOFF_list(turn);
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "hvps turnoff all", 16) == 0) //documented
	{
		for(i=0;i<9;i++) turn[i] = 1;
		char str[] = "Ok\n\r";
		HV_turnOFF_list(turn);
		tcp_write(tpcb, str, sizeof(str), 1);
	}

	else if(sscanf(p->payload, "hvps setdac %d %d %d %d %d %d %d %d %d", //documented
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
		char str[] = "Ok\n\r";
		setDacValue_list(turn);
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "hvps setdac all %d", //documented
			&turn[0]) == 1)
	{
		for(i=1;i<9;i++) turn[i] = turn[0];
		char str[] = "Ok\n\r";
		setDacValue_list(turn);
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "hvps cathode %d %d %d %d %d %d %d %d %d", //documented
			&turn[0], &turn[1], &turn[2], &turn[3], &turn[4], &turn[5], &turn[6], &turn[7], &turn[8]) == 9)
	{
		HV_setCathodeVoltage(turn);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "hvps cathode all %d", //documented
			&turn[0]) == 1)
	{
		for(i=1;i<9;i++) turn[i] = turn[0];
		HV_setCathodeVoltage(turn);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "hvps status gpio", 16) == 0) //documented
	{
		HV_getStatus(turn);
		sprintf(reply, "%x %x %x %x %x %x %x %x %x\n\r",
				turn[0], turn[1], turn[2], turn[3], turn[4], turn[5], turn[6], turn[7], turn[8]);
		tcp_write(tpcb, reply, strlen(reply), 1);
	}
	else if(sscanf(p->payload, "hvps protect %d", &param0) == 1) //documented
	{
		SetGrandTotals(param0);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(sscanf(p->payload, "settime %d", //documented
			&param0) == 1)
	{
		SetTime(param0);
		char str[] = "Ok\n\r";
		tcp_write(tpcb, str, sizeof(str), 1);
	}
	else if(strncmp(p->payload, "gettime", 7) == 0) //documented
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
			&pmt_trig1, &pmt_trig2, &ec_trig1, &ec_trig2, &pdm_trig1, &pdm_trig2) == 6)
	{
		char str[] = "Ok\n\r";
		SetL1TAthresholds(pmt_trig1, pmt_trig2, ec_trig1, ec_trig2, pdm_trig1, pdm_trig2);
		tcp_write(tpcb, str, sizeof(str), 1);
		SetupHVPSIntrSystem(getIntcPtr());
	}
	else if(sscanf(p->payload, "trig l1 smax %d",
			&pmt_trig1) == 1)
	{
		char str[] = "Ok\n\r";
		SetSMax(pmt_trig1);
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
//	else if(strncmp(p->payload, "updatefw start", 14) == 0)
//	{
//		StartUpdateFW();
//		char str[] = "Ok\n\r";
//		tcp_write(tpcb, str, sizeof(str), 1);
//	}
//	else if(strncmp(p->payload, "updatefw status", 15) == 0)
//	{
//		param = IsFW_updated();
//		char str1[] = "1\n\r";
//		char str0[] = "0\n\r";
//		if(param)
//			tcp_write(tpcb, str1, sizeof(str1), 1);
//		else
//			tcp_write(tpcb, str0, sizeof(str0), 1);
//	}
	else if(strncmp(p->payload, "exit", 4) == 0 || strncmp(p->payload, "quit", 4) == 0)
	{
		tcp_close(tpcb);
	}
	else if(strncmp(p->payload, "reboot", 6) == 0)
	{
		RebootZynq();
	}
//	else
//	{
//		static int called = 0;
//		strcpy(ans_str, "Error 1\n\r");
//		tcp_write(tpcb, ans_str, strlen(ans_str), 1);
//		called = 1;
//	}
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

	//char ok_eomess_str[] = "Mini-EUSO PDM DP console\n\r";
	//tcp_write(newpcb, ok_eomess_str, sizeof(ok_eomess_str), 1);

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
