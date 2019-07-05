/*
 * axis_flowctrl.c
 *
 *  Created on: Jun 5, 2017
 *      Author: alx
 */
#include "axis_flowctrl_d2.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "minieuso_pdmdata.h"
#include "pdmdata_hw.h"

void FlowControlsClr_D2()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_ALL;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_ALL;
}

void ResetGTUCounter_D2()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_GTU_CNT;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_GTU_CNT;
}

void ResetTriggerService_D2()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_TRIG_SERVICE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_TRIG_SERVICE;
}

// clear trigger flag
void ReleaseTrigger_L2()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_EDGE_FLAGS*4) = BIT_FC_RELEASE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_EDGE_FLAGS*4) = 0;
}



int CheckTrigger_L2()
{
	return (*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGR_FC_SM_STATE*4)) & BIT_FC_IS_TRIGGER;
}

u32 GetTrigNGTU_L2()
{
	return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGR_GTU_TIMESTAMP*4);
}

u32 GetTrigType_L2()
{
	return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGR_TRIG_TYPE*4);
}

u32 GetUnixTimestamp_L2()
{
	return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGR_UNIX_TIMESTAMP*4);
}

u32 GetUnixTime()
{
	return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_UNIX_TIME*4);
}

u32 GetNGTU()
{
		return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_GTU_CNT*4);
}

// Allow to continue pass data to DMA block
void FlowControlClrIntr_D2()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_CLR_INTR;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_CLR_FLAGS*4) = 0;
}

void FlowControlInit_D2()
{

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_GTUS_PER_CYCLE*4) = N_FRAMES_PER_LIFECYCLE;

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_DMA_LENGTH*4) = N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_D2 / sizeof(uint32_t);

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_PERIODIC_TRIG_PERIOD*4) = N_FRAMES_PER_LIFECYCLE/128*30;
	//TODO these delays must be adjusted because currently the trigger is not in the middle of the kept data
//	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_TRIG_DELAY*4) =
//			2500 /*ns GTU*/ / 5/*ns clk*/ * 64 /*GTU to save after event*/;
//	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_TRIG_DELAY*4) =
//			2500*128 /*ns GTU*/ / 10/*ns clk*/ * 64 /*GTU to save after event*/;


	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED | BIT_FC_EN_PERIODIC_TRIG;

	Set_N2(4);

	//reset flow control core
	FlowControlsClr_D2();
	// reset time to zero
	SetTime(0);
}

void StartEventsLog_L2()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) |= BIT_FC_TRIG_EVENTS_LOG_EN;
}

int StopEventsLog_L2() // returns the number of collected events
{
	u32 num = *(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGR_TRIG_ALL_CNT*4);
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) &= ~BIT_FC_TRIG_EVENTS_LOG_EN;
	return num;
}
