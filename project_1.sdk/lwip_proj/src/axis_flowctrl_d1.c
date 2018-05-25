/*
 * axis_flowctrl.c
 *
 *  Created on: Jun 5, 2017
 *      Author: alx
 */
#include "axis_flowctrl_d1.h"
#include "xparameters.h"
#include "xbasic_types.h"
#include "minieuso_pdmdata.h"
#include "pdmdata_hw.h"



void FlowControlsClr_D1()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_ALL;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_ALL;
}

void ResetGTUCounter_D1()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_GTU_CNT;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_GTU_CNT;
}

void ResetTriggerService_D1()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_TRIG_SERVICE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_TRIG_SERVICE;
}

//int CheckTrigger_L1()
//{
//	return (*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_FC_SM_STATE*4)) & BIT_FC_IS_TRIGGER;
//}

u32 GetTrigNGTU_L1()
{
	return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_GTU_TIMESTAMP*4);
}

u32 GetTrigType_L1()
{
	return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_TRIG_TYPE*4);
}

u32 GetUnixTimestamp_L1()
{
	return *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_UNIX_TIMESTAMP*4);
}


void FlowControlInit_D1()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_GTUS_PER_CYCLE*4) = N_FRAMES_PER_LIFECYCLE;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_PERIODIC_TRIG_PERIOD*4) = N_FRAMES_PER_LIFECYCLE/128*30;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_D1_N_GTU_AFTER_TRIG*4) = N_OF_FRAMES_L1_V0;

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_D1_FIFO_THR*4) = (N_OF_FRAMES_L1_V0/2) * N_OF_PIXEL_PER_PDM/8;

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED | BIT_FC_EN_PERIODIC_TRIG;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_TLAST_REMOVER_PHASE*4) = 4;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_TRIGGER_RELAX_TIME*4) = 40000; //40000*5ns=2 ms


	Set_N1(4);

	//reset flow control cores
	FlowControlsClr_D1();
	// reset time to zero
	SetTime(0);
}

void StartEventsLog_L1()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) |= BIT_FC_TRIG_EVENTS_LOG_EN;
}

int StopEventsLog_L1() // returns the number of collected events
{
	u32 num = *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_TRIG_ALL_CNT*4);
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) &= ~BIT_FC_TRIG_EVENTS_LOG_EN;
	return num;
}

void Inject16Events2DMA()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = BIT_FC_INJECT_16_EVENTS_4DMA;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) = 0;
}

int IsD1Triggered()
{
	//xil_printf("%d %d\n\r", *(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_FC_SM_STATE*4), (*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_FC_SM_STATE*4)) & 0xF == 5);
	return (((*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGR_FC_SM_STATE*4)) & 0xF) == 5);
}

int IsD1DMA_error()
{
	return (*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_CLR_FLAGS*4) & BIT_FC_STATUS_DMA_ERROR);
}

void D1_release()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_EDGE_FLAGS*4) = (1<<BIT_FC_RELEASE);
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_EDGE_FLAGS*4) = 0;
}
