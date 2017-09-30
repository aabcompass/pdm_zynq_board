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

void ResetMaxisAlarm()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_RESET_ALARM*4) = 1;
	print("==");
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_RESET_ALARM*4) = 0;
}

void FlowControlsClrSet()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_ALL;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) |= BIT_FC_CLR_ALL;
}


void FlowControlsClrUnset()
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_ALL;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_CLR_FLAGS*4) &= ~BIT_FC_CLR_ALL;
}

void FlowControlInit()
{
	//reset flow control cores
	FlowControlsClrSet();
	FlowControlsClrUnset();
	//TODO these delays must be adjusted because currently the trigger is not in the middle of the kept data
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_TRIG_DELAY*4) =
			2500 /*ns GTU*/ / 5/*ns clk*/ * 64 /*GTU to save after event*/;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_TRIG_DELAY*4) =
			2500*128 /*ns GTU*/ / 10/*ns clk*/ * 64 /*GTU to save after event*/;

	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_PERIODIC_TRIG_PHASE*4) =
			SCALE_GTU_SMALL_PER_BIG * SCALE_GTU_BIG_PER_HUGE * SCALE_GTU_HUGE_PER_LIFECYCLE -
			SCALE_GTU_SMALL_PER_BIG;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGW_PERIODIC_TRIG_PHASE*4) =
			SCALE_GTU_SMALL_PER_BIG * SCALE_GTU_BIG_PER_HUGE * SCALE_GTU_HUGE_PER_LIFECYCLE -
			SCALE_GTU_SMALL_PER_BIG * SCALE_GTU_BIG_PER_HUGE;

}
