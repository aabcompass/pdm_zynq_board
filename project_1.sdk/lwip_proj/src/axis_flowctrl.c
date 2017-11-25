/*
 * axis_flowctrl.c
 *
 *  Created on: Jun 5, 2017
 *      Author: alx
 */
#include "axis_flowctrl.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "pdmdata.h"
#include "pdmdata_hw.h"

int N1=4, N2=4; // Maximum allowed triggers L1 and L2

void Set_N1(int value)
{
	N1 = value;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_NUM_OF_TRIGS*4) = N1;
}

void Set_N2(int value)
{
	N2 = value;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_NUM_OF_TRIGS*4) = N2;
}

void FlowControlsClr()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_ALL;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_ALL;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_ALL;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_ALL;
}

void ResetGTUCounter()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_GTU_CNT;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_GTU_CNT;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_GTU_CNT;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_GTU_CNT;
}

void ResetTriggerService()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_TRIG_SERVICE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_TRIG_SERVICE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_TRIG_SERVICE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_TRIG_SERVICE;
}

void ReleaseTrigger(int n) //1=raw, 2==L1
{
	if(n == 1)
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_EDGE_FLAGS*4) = BIT_FC_RELEASE;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_EDGE_FLAGS*4) = 0;
	}
	else if(n == 2)
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_EDGE_FLAGS*4) = BIT_FC_RELEASE;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_EDGE_FLAGS*4) = 0;
	}

}



int CheckTrigger(int n) //1=raw, 2==L1
{
	if(n == 1)
		return (*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_FC_SM_STATE*4)) & BIT_FC_IS_TRIGGER;
	else if(n == 2)
		return (*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_FC_SM_STATE*4)) & BIT_FC_IS_TRIGGER;
	return 0;
}

u32 GetTrigNGTU(int n) //1=raw, 2==L1
{
	if(n == 1)
		return *(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GTU_TIMESTAMP*4);
	else if(n == 2)
		return *(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_GTU_TIMESTAMP*4);
	return 0;
}

u32 GetTrigType(int n) //1=raw, 2==L1
{
	if(n == 1)
		return *(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_TRIG_TYPE*4);
	else if(n == 2)
		return *(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_TRIG_TYPE*4);
	return 0;
}

u32 GetUnixTimestamp(int n) //1=raw, 2==L1
{
	if(n == 1)
		return *(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_UNIX_TIMESTAMP*4);
	else if(n == 2)
		return *(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_UNIX_TIMESTAMP*4);
	return 0;
}


void FlowControlClrIntr(int n) //1=raw, 2==L1
{
	if(n==1)
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_CLR_INTR;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	}
	else if(n==2)
	{
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_CLR_INTR;
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) = 0;
	}
}
void FlowControlInit()
{


	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_GTUS_PER_CYCLE*4) =
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_GTUS_PER_CYCLE*4) = N_FRAMES_PER_LIFECYCLE;

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_DMA_LENGTH*4) = N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_RAW / sizeof(uint64_t);
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_DMA_LENGTH*4) = N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_L1 / sizeof(uint32_t);

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_PERIODIC_TRIG_PERIOD*4) =
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_PERIODIC_TRIG_PERIOD*4) = N_FRAMES_PER_LIFECYCLE/128*30;
	//TODO these delays must be adjusted because currently the trigger is not in the middle of the kept data
//	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_TRIG_DELAY*4) =
//			2500 /*ns GTU*/ / 5/*ns clk*/ * 64 /*GTU to save after event*/;
//	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_TRIG_DELAY*4) =
//			2500*128 /*ns GTU*/ / 10/*ns clk*/ * 64 /*GTU to save after event*/;

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_FLAGS*4) =
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED | BIT_FC_EN_PERIODIC_TRIG;

	Set_N1(4);
	Set_N2(4);

	//reset flow control cores
	FlowControlsClr();

}
