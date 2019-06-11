/*
 * data_provider.c
 *
 *  Created on: Oct 29, 2017
 *      Author: alx
 */
#include "data_provider.h"
#include "xparameters.h"
#include "xil_types.h"
#include "minieuso_pdmdata.h"

void WaitDataProviderIdle()
{
	int i;
	//wait for data_provider to be in idle_state
	for(i=0;i<10000000;i++)
		if(!(*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGR_STATUS) & 0x00000007))
			break;
	if(i==10000000)
		print("Data_provider is stalled\n\r");
}

int IsDataProviding()
{
	return *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGR_STATUS) & 0x00000007;
}

void SetGrandTotals(u32 max)
{
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_GRAND_TOTAL_MAX) = max;
}

u32 GetOverbrightStatus()
{
	return *(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGR_OVERBRIGHT);
}


void SetDataProviderTestMode(int mode)
{
	print("Waiting for data provider idle state.\n\r");
	WaitDataProviderIdle();
	print("Changing the data provider test mode.\n\r");

	if(mode == DATA_PROV_TEST_MODE_NONE)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 0;
	}
	else if(mode == DATA_PROV_TEST_MODE_ECASIC)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_TRANS_STEP)	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_STEPS_MAX) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_0R0L) 	= 0x06060000;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_1R1L) 	= 0x12120C0C;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_2R2L) 	= 0x1E1E1818;
	}
	else if(mode == DATA_PROV_TEST_MODE_PMT)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_TRANS_STEP)	= 32;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_STEPS_MAX) 	= 6;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_0R0L) 	= 0x06060000;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_1R1L) 	= 0x12120C0C;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_2R2L) 	= 0x1E1E1818;
	}
	else if(mode == DATA_PROV_TEST_MODE_PDM)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_TRANS_STEP)	= 32*6;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_STEPS_MAX) 	= 128;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_0R0L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_1R1L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_2R2L) 	= 0;
	}
	else if(mode == DATA_PROV_TEST_MODE_L1)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_TRANS_STEP)	= 128*32*6;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_STEPS_MAX) 	= 128;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_0R0L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_1R1L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_2R2L) 	= 0;
	}
	else if(mode == DATA_PROV_TEST_MODE_L2)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_TRANS_STEP)	= 128*128*32*6;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_STEPS_MAX) 	= 128;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_0R0L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_1R1L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_2R2L) 	= 0;
	}
	else if(mode == DATA_PROV_TEST_MODE_L3)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_TRANS_STEP)	= 128*128*128*32*6;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_STEPS_MAX) 	= 128;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_0R0L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_1R1L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_2R2L) 	= 0;
	}
	else if(mode == DATA_PROV_TEST_MODE_DBG1)
	{
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_TESTMODE) = 1;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_TRANS_STEP)	= 192;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_STEPS_MAX) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_0R0L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_1R1L) 	= 0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_PATTERN_CLR_2R2L) 	= 0;
	}

	print("Pre-loading test generator ...");
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CLR) = (1<<CMD_CLR_TEST_MODE);
	print("Ok\n\r");
	if(mode != DATA_PROV_TEST_MODE_ECASIC)
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CLR) = 0;
}

void Provide(u32 len)
{
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = len;
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
}

void ProvideAndCheck()
{
	int i,j;
	Provide(N_OF_FRAMES_RAW_POLY_V0*N_OF_FRAMES_INT16_POLY_V0*N_OF_FRAMES_INT32_POLY_V0);
	print("Waiting for D3 interrupt\n\r");
	for(i=0;i<10000;i++)
	{
		if(IsBufferL2Changed())
			break;
		for(j=0;j<10000000;j++);
		print("*");
	}
	xil_printf("DMAIntrCounterRaw=%d\n\r", GetDMAIntrCounterN(0));
	xil_printf("DMAIntrCounterL1=%d\n\r", GetDMAIntrCounterN(1));
	xil_printf("DMAIntrCounterL2=%d\n\r", GetDMAIntrCounterN(2));
}

void LoadPixMaskTst(u32 pixel, u32 ec, u32 msk)
{
	int i;
	u32 val;
	val = msk*BIT_PIX_DISCARD | pixel*BIT_PIX_NUM | ec*BIT_ECASIC_LINE | BIT_PIX_WR;
	*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_LOAD_PIX_MASK) = val;
}
