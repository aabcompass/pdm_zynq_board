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

void FlowControlInit()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_DMA_LENGTH*4) = N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_RAW / sizeof(uint64_t);
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_DMA_LENGTH*4) = N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_L1 / sizeof(uint32_t);
	//reset flow control cores
	FlowControlsClr();
	//TODO these delays must be adjusted because currently the trigger is not in the middle of the kept data
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_TRIG_DELAY*4) =
			2500 /*ns GTU*/ / 5/*ns clk*/ * 64 /*GTU to save after event*/;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_TRIG_DELAY*4) =
			2500*128 /*ns GTU*/ / 10/*ns clk*/ * 64 /*GTU to save after event*/;

	Set_N1(4);
	Set_N2(4);
}
