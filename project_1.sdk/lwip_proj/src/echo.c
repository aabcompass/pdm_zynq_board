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
#include "axis_flowctrl.h"
#include "hv.h"
#include "xparameters.h"

#include "pdmdata.h"
#include "pdmdata_hw.h"

#include "xscurve_adder.h"
#include "xl2_trigger.h"
#include "data_provider.h"

//#include "netif/xaxiemacif.h"

//extern xaxiemacif_s xaxiemacif_s_obj;

u8 test_data[10000];

//#define EMAC_PHY_MIIM_ADDR 7

//u32 thr = 200;

#define N_LINES 	N_OF_ECASIC_PER_PDM
#define N_CHIPS		N_OF_PMT_PER_ECASIC
#define N_PIXELS	N_OF_PIXELS_PER_PMT
#define NUM_OF_PIXELS_PER_FRAME	N_OF_PIXEL_PER_PDM

//XScurve_adderv2 scurve_adder[N_LINES];
//XScurve_adder32 scurve_adder32[N_LINES];
XScurve_adder scurve_adder;
XL2_trigger l2trigger;

//XLlFifo xllfifo_raw_array[N_LINES];

extern SystemSettings systemSettings;
extern InstrumentState instrumentState;

u32 frame_buffer_art1[NUM_OF_PIXELS_PER_FRAME/4];
extern SCurveStruct sCurveStruct;
extern DebugSettings debugSettings;

//Z_DATA_TYPE_SCI_POLY_V5 packet_sci_poly __attribute__ ((aligned (256)));



static enum  {
	idle_state = 10,
	wait4trigger_state=100,
	wait4ftp_ready2=120
	} trigger_sm_state = idle_state;

u8 spaciroc_slow_data[30000];
int current_hvdac_value = 0;

#define DDR_BASE_ADDR 		XPAR_PS7_DDR_0_S_AXI_BASEADDR
#define MEM_BASE_ADDR		(DDR_BASE_ADDR + 0x01000000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00300000)
//#define MAX_PKT_LEN		0x20




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
	//*(u32*)(XPAR_AXI_GPIO_0_BASEADDR + GPIO_OUTPUT_REG_OFFSET) = (1<<CMD_START_BIT_OFFSET | 1<<NUMFRAMES_BIT_OFFSET);
	//*(u32*)(XPAR_AXI_GPIO_0_BASEADDR + GPIO_OUTPUT_REG_OFFSET) = 0;
}

void StartGatherNBunchFromArtix(int N)
{
	//print("Gather a bunch!\n\r");
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N;
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
	//*(u32*)(XPAR_AXI_GPIO_0_BASEADDR + GPIO_OUTPUT_REG_OFFSET) = (1<<CMD_START_BIT_OFFSET | 128<<NUMFRAMES_BIT_OFFSET);
	//*(u32*)(XPAR_AXI_GPIO_0_BASEADDR + GPIO_OUTPUT_REG_OFFSET) = 0;
}

//void PrintFrameBuffer(int num)
//{
//	int i;
//	for(i=0;i<num;i++)
//		xil_printf("%d:\t0x%08x\n\r", i, frame_buffer_art1[i]);
//}

void TriggerService()
{
	int i, offset;
	char* ptr;

	char filename_str[20];
	static int what_trigger_armed = 0; // 1- L1, 2 - L2, 3 - L3
	if(systemSettings.isPrinting) xil_printf("#%d", trigger_sm_state);
	switch(trigger_sm_state)
	{
	case idle_state:
		if(instrumentState.mode == INSTRUMENT_MODE_FREERUN)
		{
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_FLAGS*4) |= BIT_FC_IS_STARTED;
			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE) = 1;
//			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N_OF_FRAMES_RAW_POLY_V0*N_OF_FRAMES_INT16_POLY_V0*N_OF_FRAMES_INT32_POLY_V0;
//			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
//			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;

			trigger_sm_state = wait4trigger_state;
		}
		else if(instrumentState.mode == INSTRUMENT_MODE_NONE)
		{
			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE) = 0;

			//FlowControlsClrSet();
			//*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_FLAGS*4) = 0;
			//*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_FLAGS*4) = 0;
			//*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_INFINITE) = 0;
		}
		break;
	case wait4trigger_state:
		if(IsBufferL2Changed())
		{
			xil_printf("BufferL2Changed!\n\r");
			if(instrumentState.ftp_files_mode == INSTRUMENT_FTPFILES_SEPARATED)
			{
				sprintf(filename_str, FILENAME_MODE_TRIGGER3, instrumentState.file_counter_l3++);
				SendSpectrum2FTP((char*)GetZ_DATA_TYPE_SCI_ptr(DATA_TYPE_L3), sizeof(Z_DATA_TYPE_SCI_L3_V2), filename_str);
			}
			else if(instrumentState.ftp_files_mode == INSTRUMENT_FTPFILES_CONCAT)
			{
				CopyEventDataFreerun();
				sprintf(filename_str, FILENAME_CONCATED, instrumentState.file_counter_cc++);
				SendSpectrum2FTP((char*)Get_ZYNQ_PACKET(), sizeof(ZYNQ_PACKET), filename_str);
			}
			trigger_sm_state = wait4ftp_ready2;
			what_trigger_armed = 3;
		}
		break;
	case wait4ftp_ready2:
		if(IsFTP_bin_idle())
		{
			// release trigger
			trigger_sm_state = idle_state;
		}
		break;
	}
}


void ProcessUartCommands(struct netif *netif, char c)
{
	int i, j, k, occupancy;//, cc_fifo_occupancy0, cc_fifo_occupancy1, cc_fifo_occupancy2;
	u16* reg_data;
	u16* p;
	static int num = 0;

	if(c == '*')
	{
		print("\n\r");
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
			xil_printf("\t%08X",  *(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR+i*4));
		}
		print("\n\rXPAR_AXIS_FLOW_CONTROL_L2_BASEADDR");
		for(i=0;i<32;i++)
		{
			if(i%4==0) xil_printf("\n\r%d.", i);
			xil_printf("\t%08X",  *(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR+i*4));
		}
		print("\n\rXPAR_HV_HK_V1_0_0_BASEADDR");
		for(i=0;i<32;i++)
		{
			if(i%4==0) xil_printf("\n\r%d.", i);
			xil_printf("\t%08X",  *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR+i*4));
		}
	}
	else if(c == 'h')
	{
		HV_prnLog();
	}
	else if(c == 't')
	{
		static int is_test_mode = 0;
		is_test_mode = !is_test_mode;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = is_test_mode<<1;
		xil_printf("is_test_mode=%d\n\r", is_test_mode);
	}
	else if(c == 'Y')
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_EDGE_FLAGS*4) = BIT_FC_TRIG_FORCE;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_EDGE_FLAGS*4) = 0;
	}
	else if(c == 'y')
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_EDGE_FLAGS*4) = BIT_FC_RELEASE;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_EDGE_FLAGS*4) = 0;
	}
	else if(c == 's')
	{
		xil_printf("GetArtixLoadState=0x%08x\n\r",  GetArtixLoadState());
		xil_printf("locked = 0x%08x\n\r", *(u32*)(XPAR_AXI_GPIO_0_BASEADDR));
		xil_printf("GetFTP_bin_State() = %d\n\r", GetFTP_bin_State());
		xil_printf("GetFTP_ini_State() = %d\n\r", GetFTP_ini_State());
		xil_printf("trigger_sm_state = %d\n\r", trigger_sm_state);

		xil_printf("GetSC3FifoVacancy: %d\n\r",  GetSC3FifoVacancy());

		xil_printf("Intr: %d\n\r", *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR));
		xil_printf("HV_getLogSize()= %d\n\r", HV_getLogSize());

		xil_printf("Get_receive_buffer_offset=%d\n\r", Get_receive_buffer_offset());
		xil_printf("GetSWSMState()=0x%08x\n\r",  GetSWSMState());
		xil_printf("GetCurPosFC1()=%d\n\r", GetCurPosFC1());
		xil_printf("GetDMAIntrCounterN(0)=%d\n\r", GetDMAIntrCounterN(0));
		xil_printf("GetDMAIntrCounterN(1)=%d\n\r", GetDMAIntrCounterN(1));
		xil_printf("GetDMAIntrCounterN(2)=%d\n\r", GetDMAIntrCounterN(2));

		xil_printf("DMA RAW CR=0x%08x\n\r", *(u32*)(XPAR_AXI_DMA_RAW_BASEADDR + XAXIDMA_RX_OFFSET + XAXIDMA_CR_OFFSET));
		xil_printf("DMA RAW SR=0x%08x\n\r", *(u32*)(XPAR_AXI_DMA_RAW_BASEADDR + XAXIDMA_RX_OFFSET + XAXIDMA_SR_OFFSET));
		xil_printf("DMA RAW DEST=0x%08x\n\r", *(u32*)(XPAR_AXI_DMA_RAW_BASEADDR + XAXIDMA_RX_OFFSET + XAXIDMA_DESTADDR_OFFSET));
		xil_printf("GetPacketCounter=0x%08x\n\r", GetPacketCounter(XPAR_TOP_SWITCH_TST_BASEADDR));
		xil_printf("Data provider status = 0x%08x\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGR_STATUS));
		printMMVars();
	}
	else if(c == 'S')
	{
		PrintTriggerInfo();
	}
//	else if(c == 'c')
//	{
//		regs_clr_intr();
//	}
	else if(c == 'p')
	{
		systemSettings.isPrinting = !systemSettings.isPrinting;
	}
	else if(c == 'P')
	{
		PrintFirstElementsL1();
	}
	else if(c == 'R')
	{
		PrintFirstElementsL2(num);
	}
	else if(c == 'Q')
	{
		PrintFirstElementsRaw();
	}
	else if(c == '+')
	{
		xil_printf("num=%d\n\r", ++num);
	}
	else if(c == '-')
	{
		xil_printf("num=%d\n\r", --num);
	}
	else if(c == 'f')
	{
		SetFTP_state(20);
	}
//	else if(c == 'F')
//	{
//		SendSpectrum2FTP((char*)&packet_sci_poly, sizeof(packet_sci_poly), "testfile.tst");
//	}
	else if(c >= '0' && c <= '9')
	{
		//SelectSwitch(0);
		num = c - '0';
		if(num == 8) num = 127;
		if(num == 9) num = 128;
		xil_printf("num=%d\n\r", num);
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
	else if(c == 'G')
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N_FRAMES_DMA_RAW;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
	}
	else if(c == 'j')
	{
		//*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N_OF_FRAMES_RAW_POLY_V0*N_OF_FRAMES_INT16_POLY_V0*N_OF_FRAMES_INT32_POLY_V0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
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
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_CLR_INTR;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	}
	else if(c == 'C')
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_CLR_ALL;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	}
	else if(c == 'U')
	{
		ProvideTestDataL1();
	}
	else if(c == 'u')
	{
		RxReceiveAndPrint();
	}
	else if(c == 'x')
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) ^= (1<<BIT_TESTMODE_0);
		xil_printf("REGW_TESTMODE=0x%08x\n\r", *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE));
	}
//	else if(c == 'r')
//	{
//		DmaRawReset();
//	}
//	else if(c == 'S')
//	{
//		DmaRawStart();
//	}

}

void SetDefaultParameters()
{
	//FillExperimentalData();
	systemSettings.isPrinting = 0;

	sCurveStruct.start_dac_value = 0;
	sCurveStruct.step_dac_value = 5;
	sCurveStruct.stop_dac_value = 1000;
	sCurveStruct.accumulation = 10;
	debugSettings.current_thr = 0;
	SetDefaultSCParameters();

	instrumentState.mode = INSTRUMENT_MODE_NONE;
	instrumentState.ftp_files_mode = INSTRUMENT_FTPFILES_CONCAT;
	instrumentState.file_counter_l1 = 0;
	instrumentState.file_counter_l2 = 0;
	instrumentState.file_counter_l3 = 0;
	instrumentState.is_simple_packets = 0;
}


int transfer_data() {
	return 0;
}



//void PrintSpacirocConfVector()
//{
//	int i;
//	for(i=0;i<SIZEOF_SPACIROC_CONF_VECTOR;i++)
//		xil_printf("i=%d data=0x%08x\n\r", i, spaciroc_configuration_vector[i]);
//}


err_t recv_callback(void *arg, struct tcp_pcb *tpcb,
                               struct pbuf *p, err_t err)
{
	int i;
	/* do not read the packet if we are not in ESTABLISHED state */
	if (!p) {
		tcp_close(tpcb);
		tcp_recv(tpcb, NULL);
		return ERR_OK;
	}

	/* indicate that the packet has been received */
	tcp_recved(tpcb, p->len);

	/* echo back the payload */
	/* in this case, we assume that the payload is < TCP_SND_BUF */
//	if (tcp_sndbuf(tpcb) > p->len) {
//		err = tcp_write(tpcb, p->payload, p->len, 1);
//	} else
//		xil_printf("no space in tcp_sndbuf\n\r");

	xil_printf("p->len=%d\n\r", p->len);
	for(i=0;i<p->len/4; i++)
		printf("array(%d)=%08x\n\r", i, __bswap_constant_32(*(u32*)(p->payload+4*i)));

	//memcpy(spaciroc_configuration_vector, p->payload, SIZEOF_SPACIROC_CONF_VECTOR*4);
	//PrintSpacirocConfVector();

	//spaciroc_configuration_vector[10] = 75<<16;

	//LoadSpacirocConfigurationVector();


	/* free the received pbuf */
	pbuf_free(p);

	return ERR_OK;
}

err_t accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
	static int connection = 1;

	/* set the receive callback for this connection */
	tcp_recv(newpcb, recv_callback);

	/* just use an integer number indicating the connection id as the
	   callback argument */
	tcp_arg(newpcb, (void*)connection);

	/* increment for subsequent accepted connections */
	connection++;
	print("Connected to configuration port\n\r");

	return ERR_OK;
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
	XL2_trigger_Start(&l2trigger);
}

static void delay(int time)
{
	int i;
	for(i=0;i<70000*time;i++); // 100 thousands means 1 ms
}

int start_application()
{
	struct tcp_pcb *pcb;
	err_t err;
	unsigned port = 50001;
	int i;

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
	} delay(200);

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

	xil_printf("TCP SPACIROC slow control server started @ port %d\n\r", port);

	return 0;
}

