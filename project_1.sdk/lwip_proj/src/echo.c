/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
* git exp ch 3
*
******************************************************************************/
// small addition

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#if defined (__arm__) || defined (__aarch64__)
#include "xil_printf.h"
#endif

#include "xstatus.h"

#include "xllfifo.h"
#include "xllfifo_hw.h"
#include "xaxidma.h"
#include "xaxidma_hw.h"

#include "axi_spectral_core.h"
#include "swap.h"
#include "slow_control.h"
#include "axis_flowctrl_d1.h"
#include "axis_flowctrl_d2.h"
#include "hv.h"
#include "xparameters.h"

#include "minieuso_pdmdata.h"
#include "pdmdata_hw.h"

#include "xscurve_adder.h"
#include "xl2_trigger.h"
#include "data_provider.h"
#include "ftp_server.h"
#include "log_records.h"

#include "xtmrctr.h"

u8 test_data[10000];

#define N_LINES 	N_OF_ECASIC_PER_PDM
#define N_CHIPS		N_OF_PMT_PER_ECASIC
#define N_PIXELS	N_OF_PIXELS_PER_PMT
#define NUM_OF_PIXELS_PER_FRAME	N_OF_PIXEL_PER_PDM

XScurve_adder scurve_adder;
XL2_trigger l2trigger;

extern SystemSettings systemSettings;
extern InstrumentState instrumentState;

u32 frame_buffer_art1[NUM_OF_PIXELS_PER_FRAME/4];
extern SCurveStruct sCurveStruct;
extern DebugSettings debugSettings;

char boot_bin_buf[10000000];

//DATA_TYPE_SCI_ALLTRG_RECORD sci_data[SCI_DATA_ARRAY_SIZE];
DATA_TYPE_SCI_ALLTRG_RECORD* sci_data;
u32 *test_big_array;//[400000000];

static enum  {
	datapath_idle_state = 10,
	datapath_wait4trigger_state=100,
	//datapath_checkFTPready_state=110,
	datapath_wait4ftp_ready2=120
	} datapath_sm_state = datapath_idle_state;

static enum  {
	stop_sm_idle = 10,
	wait4data_provider_stop=100,
	wait4interruptD3=110,
	stop_sm_stopping=115,
	stop_sm_stopped=120
	} stop_sm_state = stop_sm_idle;


static enum  {
	update_idle = 10,
	update_start = 20,
	update_wait4ftp_retr=100,
	update_finished=120
	} update_sm_state = update_idle;

//u8 spaciroc_slow_data[30000];
int current_hvdac_value = 0;

#define DDR_BASE_ADDR 		XPAR_PS7_DDR_0_S_AXI_BASEADDR
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x01000000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00300000)
//#define MAX_PKT_LEN		0x20

char hvps_log_file_ftp[sizeof(Z_DATA_TYPE_HVPS_LOG_V1)];

XTmrCtr TimerCounter;

void RebootZynq()
{
	*(u32*)(0XF8000008) = 0xDF0D;
	*(u32*)(0xF8000200) = 1;
}

int mem_test()
{
//	sci_data = malloc(sizeof(DATA_TYPE_SCI_ALLTRG_RECORD)*SCI_DATA_ARRAY_SIZE);
	u32 N = 0x1F000000/sizeof(u32);
	u32 pStart = 0x20000000;
	u32 i;
	test_big_array = (u32*)pStart;
	for(i=0; i<N; i+=4)
	{
		*(u32*)(test_big_array+i) = i;
		if(i % (N/128) == 0)
			print("-");
	}
	for(i=0; i<N; i+=4)
	{
		if(i % (N/128) == 0)
			print("+");
		if(*(u32*)(test_big_array+i) != i)
		{
			xil_printf("Error on %d\n\r", i);
			return 0;
		}
	}
	print("Memory test passed\n\r");

	return 1;
}

int mem_alloc()
{
	char var_addr;
	xil_printf("Top addr = 0x%08x\n\r", &var_addr);
	sci_data = 0x10000000; // To be defined after the situation with memory will be clear for me.
}

void PrintBin(u16 data)
{
	int i;
	for(i=15; i>=0; i--)
	{
		((data & (1<<i)) != 0) ? xil_printf("1") : xil_printf("0");
		if(!(i%4)) print(" ");
		if(!(i%8)) print(" ");
	}
	xil_printf("\n\r");
}

#define PHY_RESET 			(1<<15)
#define RESTART_AN 			(1<<9)
#define MODE_1000			(1<<6)
#define AN_EN				(1<<12)
#define SET_FULL_DUPLEX		(1<<8)

int transmit_delay = 7;
#define SIZEOF_SPACIROC_CONF_VECTOR		43



///////////////////////////////////
// Start / stop / switch
///////////////////////////////////


void StartGatherOneFrameFromArtix()
{
	print("Gather one packet!\n\r");
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = 1;
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
}

void StartGatherNBunchFromArtix(int N)
{
	//print("Gather a bunch!\n\r");
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N;
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
}

void RunStopping()
{
	stop_sm_state = wait4data_provider_stop;
}

void SendHVPSLogToFTP(int mode) //0 - numerical,  1 - HVPS.log
{
	u32 size = HV_getLogFileSize();
	char filename_str[20];
	int ret;
	memset(hvps_log_file_ftp, 0, sizeof(Z_DATA_TYPE_HVPS_LOG_V1));
	memcpy(hvps_log_file_ftp, HV_getLogPtr(), size);
	//DeleteFile("HVPS.log");
	sprintf(filename_str, FILENAME_HVLOG, instrumentState.file_counter_hv++);
	if(mode == 0)
		ret = CreateFile(/*"HVPS.log"*/filename_str, hvps_log_file_ftp, size, 0, file_regular);
	else
		ret = CreateFile("HVPS.log", hvps_log_file_ftp, size, 0, file_regular);

	xil_printf("CreateFile rets %d\n\r", ret);
	HV_clean_log();
	xil_printf("%d HVPS size\n\r", size);
}

void StopSM()
{
	switch(stop_sm_state)
	{
	case stop_sm_idle:
		break;
	case wait4data_provider_stop:
		if(!IsDataProviding())
			stop_sm_state = wait4interruptD3;
		break;
	case wait4interruptD3:
		if(IsBufferD3Changed2())
			stop_sm_state = stop_sm_stopping;
		break;
	case stop_sm_stopping:
		if(IsFTP_bin_idle())
		{
			// release trigger
			datapath_sm_state = stop_sm_stopped;
		}
		break;
	case stop_sm_stopped:
		//SendLogToFTP();
		SetDataProviderTestMode(0);
		PrnAllRegs();
		stop_sm_state = stop_sm_idle;
		break;
	}
}


void DataPathSM()
{
	int i, offset, ret;
	char* ptr;
	int current_scidata_record;
	static u32 prev_mode = 0;

	char filename_str[20];
	static int what_trigger_armed = 0; // 1- L1, 2 - L2, 3 - L3
	if(systemSettings.isPrinting) xil_printf("#%d", datapath_sm_state);

	u32 timer_value = 0;
	switch(datapath_sm_state)
	{
	case datapath_idle_state:
		if(instrumentState.mode != 0)
		{
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_FLAGS*4) = instrumentState.mode | BIT_FC_IS_STARTED;
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_FLAGS*4) = instrumentState.mode | BIT_FC_IS_STARTED;
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_INT_TRIG_GTU_TIME*4) = 2048*1000+20;
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_INT_TRIG_GTU_TIME*4) = 128*128*32;
			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE) = 1;

			datapath_sm_state = datapath_wait4trigger_state;
		}
		else if((instrumentState.mode == 0) && (prev_mode != 0))
		{
			// stop command was received
			datapath_sm_state = datapath_wait4trigger_state;
			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE) = 0;
		}
		else
		{
			// do nothing
		}

		prev_mode = instrumentState.mode;

		break;
	case datapath_wait4trigger_state:
		if(IsBufferD3Changed())
		{
			XTmrCtr_Reset(&TimerCounter, 0);
			XTmrCtr_Start(&TimerCounter, 0);
			timer_value = XTmrCtr_GetValue(&TimerCounter, 0);
			print("*");
			// collect data parts from DMA memory
			CopyEventData_trig();
			// compose the filename
			sprintf(filename_str, FILENAME_CONCATED, instrumentState.file_counter_cc++);
			// copy to main sci data storage. Look for free space there
			for(i=0;i<SCI_DATA_ARRAY_SIZE;i++)
			{
				if(!sci_data[i].is_occupied)
				{
					current_scidata_record = i;
					xil_printf("[%d]\n\r", current_scidata_record);
					memcpy((char*)&sci_data[current_scidata_record].sci_data, (char*)Get_ZYNQ_PACKET(), sizeof(DATA_TYPE_SCI_ALLTRG_V1));
					sci_data[current_scidata_record].is_occupied = 1;
					//xil_printf("link addr %08X occupied\n\r", &sci_data[current_scidata_record]);
					// create file
					if((instrumentState.file_counter_cc+1)%25 == 0) SendHVPSLogToFTP(0);
					if(systemSettings.no_files == 0)
					{
						ret = CreateFile(filename_str, &sci_data[current_scidata_record].sci_data, sizeof(DATA_TYPE_SCI_ALLTRG_V1), 0, file_scidata);
						if(ret<0) xil_printf("CreateFile returns error %d\n\r", ret);
						HV_addLog(FTP_FILE_CREATED, (u32)ret);
					}
					break;
				}
			}
			//SendSpectrum2FTP((char*)Get_ZYNQ_PACKET(), sizeof(DATA_TYPE_SCI_ALLTRG_V1), filename_str);
			datapath_sm_state = datapath_wait4ftp_ready2;
			what_trigger_armed = 3;
			timer_value = XTmrCtr_GetValue(&TimerCounter, 0);
			//print("~");
		}
		break;
	case datapath_wait4ftp_ready2:
		//if(IsFTP_bin_idle())
		{
			// release trigger
			datapath_sm_state = datapath_idle_state;
		}
		break;
	}
}

//void UpdateFW_SM()
//{
//	switch(update_sm_state)
//	{
//	case update_idle:
//		break;
//	case update_start:
//		ReadFile("RETR BOOT.bin\r\n", boot_bin_buf);
//		update_sm_state = update_wait4ftp_retr;
//		break;
//	case update_wait4ftp_retr:
//		if(IsRetrComplete())
//		{
//			WriteFileToSDCard(boot_bin_buf, GetFileSize(), "BOOT.bin");
//			update_sm_state = update_finished;
//		}
//		break;
//	case update_finished:
//		break;
//	}
//}

void StartUpdateFW()
{
	update_sm_state = update_start;
}

int IsFW_updated()
{
	return (update_sm_state == update_finished);
}


void TrgImmediate()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_TRIG_IMMEDIATE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_TRIG_IMMEDIATE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) = 0;
}

void PrnAllRegs()
{
	int i;
	print("\n\r");
	print("\n\rXPAR_AXI_GPIO_0_BASEADDR");
	for(i=0;i<4;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_AXI_GPIO_0_BASEADDR+i*4));
	}
	print("\n\rXPAR_AXI_DATA_PROVIDER_0_BASEADDR");
	for(i=0;i<32;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR+i*4));
	}
	print("\n\rXPAR_TOP_SWITCH_RAW_BASEADDR");
	for(i=0;i<32;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_TOP_SWITCH_RAW_BASEADDR+i*4));
	}
	print("\n\rXPAR_AXIS_FLOW_CONTROL_L1_BASEADDR");
	for(i=0;i<32;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR+i*4));
	}
	print("\n\rXPAR_AXIS_FLOW_CONTROL_L2_BASEADDR");
	for(i=0;i<32;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR+i*4));
	}
	print("\n\rXPAR_HV_HK_V1_0_0_BASEADDR");
	for(i=0;i<32;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR+i*4));
	}
	print("\n\rXPAR_AXI_CATHODE_CTRL_0_BASEADDR");
	for(i=0;i<32;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_AXI_CATHODE_CTRL_0_BASEADDR+i*4));
	}
	print("\n\rXPAR_AXI_GPS_CORE_0_BASEADDR");
	for(i=0;i<8;i++)
	{
		if(i%4==0) xil_printf("\n\r%d.", i);
		xil_printf("\t%08X",  *(u32*)(XPAR_AXI_GPS_CORE_0_BASEADDR+i*4));
	}


}

void ProcessUartCommands(struct netif *netif, char c)
{
	int i, j, k, occupancy;//, cc_fifo_occupancy0, cc_fifo_occupancy1, cc_fifo_occupancy2;
	u16* reg_data;
	u16* p;
	static int num = 0;
	static int ec = 0;
	u32 log_data[4];

	if(c == '*')
	{
		PrnAllRegs();
	}
	else if(c == '#')
	{
		print_expander_regs();
	}
	else if(c == '&')
	{
		RebootZynq();
	}
	else if(c == 'h')
	{
		HV_prnLog();
	}
	else if(c == 't')
	{
		// TURN ON THE TRIG LED
		//*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) |= BIT_FC_IS_TRIGGER_LED;
		//static int is_test_mode = 0;
		//is_test_mode = !is_test_mode;
		//*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		//*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = is_test_mode<<1;
		//xil_printf("is_test_mode=%d\n\r", is_test_mode);
		//CathodeSetAutoMode(0);
		print("BIT_FC_TRIG_OUT_FORCE\n\r");
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + 4*REGW_NUM_OF_TRIGS_FLAGS2) |= BIT_FC_TRIG_OUT_FORCE;
	}
	else if(c == 'T')
	{
		//ConfADCV();
		CathodeSetAutoMode(1);
		//TestEC_sig();
	}
	else if(c == 'm')
	{
		//LoadPixMaskTst(num, ec, 0);
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_GRAND_TOTAL_MAX) = 100000;
	}
	else if(c == 'M')
	{
		LoadPixMaskTst(num, ec, 1);
	}
	else if(c == 'R')
	{
		D1_release();
	}
	else if(c == 'e')
	{
		Print_DataDMA_events_L1(/**(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_TRIG_ALL_CNT*4)*/20);
	}
	else if(c == 'E')
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_INJECT_16_EVENTS_4DMA;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	}
	else if(c == 'y')
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_EDGE_FLAGS*4) = BIT_FC_RELEASE;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_EDGE_FLAGS*4) = 0;
	}
	else if(c == 's')
	{
		xil_printf("GetProgramCounter=%d\n\r", GetProgramCounter());
		xil_printf("sizeof(DATA_TYPE_SCI_ALLTRG_V1)=%d\n\r", sizeof(DATA_TYPE_SCI_ALLTRG_V1));
		xil_printf("GetArtixLoadState=0x%08x\n\r",  GetArtixLoadState());
		xil_printf("locked = 0x%08x\n\r", *(u32*)(XPAR_AXI_GPIO_0_BASEADDR));
		// static int incr_var = 0;
		// for external trigger i/o check
		// *(u32*)(XPAR_AXI_GPIO_0_BASEADDR + 8) = ++incr_var;
		//xil_printf("GetFTP_bin_State() = %d\n\r", GetFTP_bin_State());
		xil_printf("Get_keepalive_cnt() = %d\n\r", Get_keepalive_cnt());

		//xil_printf("GetFTP_ini_State() = %d\n\r", GetFTP_ini_State());
		//xil_printf("GetFileSize() = %d\n\r", GetFileSize());
		xil_printf("datapath_sm_state = %d\n\r", datapath_sm_state);

		xil_printf("GetSC3FifoVacancy: %d\n\r",  GetSC3FifoVacancy());

		xil_printf("Intr: %d\n\r", *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR));
		xil_printf("HV_getLogSize()= %d\n\r", HV_getLogSize());

		xil_printf("Get_receive_buffer_offset=%d\n\r", Get_receive_buffer_offset());
		xil_printf("GetSWSMState()=0x%08x\n\r",  GetSWSMState());
		xil_printf("GetFTPstate()=%d\n\r",  GetFTPstate());
		xil_printf("GetCurPosFC1()=%d\n\r", GetCurPosFC1());
		xil_printf("GetDMAIntrCounterN(1)=%d\n\r", GetDMAIntrCounterN(1));
		xil_printf("GetDMAIntrCounterN(2)=%d\n\r", GetDMAIntrCounterN(2));
		xil_printf("GetDMAIntrCounterN(3)=%d\n\r", GetDMAIntrCounterN(3));
		xil_printf("GetNGTU()=%d\n\r", GetNGTU());


		xil_printf("DMA RAW CR=0x%08x\n\r", *(u32*)(XPAR_AXI_DMA_RAW_BASEADDR + XAXIDMA_RX_OFFSET + XAXIDMA_CR_OFFSET));
		xil_printf("DMA RAW SR=0x%08x\n\r", *(u32*)(XPAR_AXI_DMA_RAW_BASEADDR + XAXIDMA_RX_OFFSET + XAXIDMA_SR_OFFSET));
		xil_printf("DMA RAW DEST=0x%08x\n\r", *(u32*)(XPAR_AXI_DMA_RAW_BASEADDR + XAXIDMA_RX_OFFSET + XAXIDMA_DESTADDR_OFFSET));
		xil_printf("Data provider status = 0x%08x\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGR_STATUS));
		xil_printf("GetADCVEcTimer() returns 0x%08x\n\r", GetADCVEcTimer());
		xil_printf("GetLogFifoOcc() returns %d\n\r", GetLogFifoOcc());
		printMMVars();
		PrintFS();

	}
	else if(c == 'S')
	{
		PrintTriggerInfo();
	}
	else if(c == 'p')
	{
		systemSettings.isPrinting = !systemSettings.isPrinting;
	}
	else if(c == 'P')
	{
		PrintD1_1stElements();
		//PrintFirstElementsL1(num);
	}
	else if(c == '+')
	{
		xil_printf("num=%d\n\r", ++num);
	}
	else if(c == '-')
	{
		xil_printf("num=%d\n\r", --num);
	}
	else if(c == '!')
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR+4*REGW_ADCV_CONF) = num*BIT_ADCV_MAX_PIXEL_NUM + 60*BIT_ADCV_ASIC_CNT;
	}
	else if(c == 'l')
	{
		GetNextRecordFromFifoLog(log_data);
		xil_printf("0x%08x 0x%08x 0x%08x 0x%08x\n\r", log_data[0], log_data[1], log_data[2], log_data[3]);
		//SendHVPSLogToFTP(0);
	}
	else if(c == 'f')
	{
		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_TLAST_REMOVER_PHASE*4)) = num;

		//SetFTP_state(20);
	}
//	else if(c == 'F')
//	{
//		SendSpectrum2FTP((char*)&packet_sci_poly, sizeof(packet_sci_poly), "testfile.tst");
//	}
	else if(c >= '0' && c <= '9')
	{
		//SelectSwitch(0);
		ec = c - '0';
		xil_printf("ec=%d\n\r", ec);
	}
	else if(c == 'D')
	{
		SetDataProviderTestMode(num);
	}
	else if(c == 'd')
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
		print("  ");
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;

	}
	else if(c == 'g')
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N_OF_FRAMES_RAW_POLY_V0*N_OF_FRAMES_INT16_POLY_V0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
		print("  ");
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;

	}
	else if(c == 'j')
	{
		//*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED;
		Provide(N_OF_FRAMES_RAW_POLY_V0*N_OF_FRAMES_INT16_POLY_V0*N_OF_FRAMES_INT32_POLY_V0);
	}
	else if(c == 'J')
	{
		//*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N_OF_FRAMES_RAW_POLY_V0*N_OF_FRAMES_INT16_POLY_V0*N_OF_FRAMES_INT32_POLY_V0*2;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
	}
	else if(c == 'I')
	{
		xil_printf("*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE)=%d\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE));
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE) = 1;
		xil_printf("*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE)=%d\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE));
	}
	else if(c == 'i')
	{
		xil_printf("*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE)=%d\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE));
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE) = 0;
		xil_printf("*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE)=%d\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE));
	}
	else if(c == 'c')
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_CLR_INTR;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	}
	else if(c == 'C')
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_CLR_ALL;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	}
	else if(c == '%')
	{
		SendTestSettingsToSp3(712, 10);
	}
//	else if(c == 'w')
//	{
//		WriteFileToSDCard(boot_bin_buf, GetFileSize(), "BOOT.bin");
//	}
	else if(c == 'x')
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) ^= (1<<BIT_TESTMODE_ALL_ONES);
		xil_printf("REGW_TESTMODE=0x%08x\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE));
	}
	else if(c == 'r')
	{
		for(i=0;i<64*6;i++)
			for(j=0;j<6;j++)
				LoadPixMaskL1(i, j, 1);
	}

}

void SetDefaultParameters()
{
	//FillExperimentalData();
	systemSettings.isPrinting = 0;
	systemSettings.no_files = 0;

	sCurveStruct.start_dac_value = 0;
	sCurveStruct.step_dac_value = 5;
	sCurveStruct.stop_dac_value = 1000;
	sCurveStruct.accumulation = 10;
	debugSettings.current_thr = 0;
	SetDefaultSCParameters();
	SetDefaultIndSCParameters();

	//instrumentState.mode = INSTRUMENT_MODE_NONE;
	//instrumentState.ftp_files_mode = INSTRUMENT_FTPFILES_CONCAT;
	instrumentState.file_counter_l1 = 0;
	instrumentState.file_counter_l2 = 0;
	instrumentState.file_counter_l3 = 0;
	instrumentState.is_simple_packets = 0;
	memset(sci_data, 0, sizeof(DATA_TYPE_SCI_ALLTRG_RECORD)*SCI_DATA_ARRAY_SIZE /*sizeof(sci_data)*/);
}


void InitHLS_peripherals()
{
	int i;
	int n_boards;
	XAxiDma_Config *CfgPtr;
	XStatus status;


	XScurve_adder_Initialize(&scurve_adder, XPAR_SCURVE_ADDER_0_DEVICE_ID);
	XScurve_adder_Set_N_ADDS(&scurve_adder, N_OF_FRAMES_RAW_POLY_V0);
	XScurve_adder_Set_CH_INFO(&scurve_adder, 0x3F);
	XScurve_adder_EnableAutoRestart(&scurve_adder);
	XScurve_adder_Start(&scurve_adder);


	XL2_trigger_Initialize(&l2trigger, XPAR_L2_TRIGGER_0_DEVICE_ID);
	XL2_trigger_InterruptGlobalDisable(&l2trigger);
	XL2_trigger_Set_n_pixels_in_bus(&l2trigger, N_OF_PIXELS_PER_PMT*N_OF_PMT_PER_ECASIC*N_OF_ECASIC_PER_PDM);
	XL2_trigger_EnableAutoRestart(&l2trigger);
	XL2_trigger_Set_N_BG(&l2trigger, 1);
	XL2_trigger_Set_LOW_THRESH(&l2trigger, 0);
	XL2_trigger_Start(&l2trigger);
}

static void delay(int time)
{
	int i;
	for(i=0;i<70000*time;i++); // 100 thousands means 1 ms
}

void TmrCntrInit()
{
	XStatus Status = XTmrCtr_Initialize(&TimerCounter, XPAR_AXI_TIMER_0_DEVICE_ID);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//XTmrCtr_Start(&TimerCounter, 0);
}

