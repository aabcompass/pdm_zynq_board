/*
 * axis_switch.c
 *
 *  Created on: Mar 5, 2017
 *      Author: alx
 */
#include "xparameters.h"
#include "axi_spectral_core.h"
#include "axis_switch.h"

//#define FLOWCTRL_CTRL_REG	0
//#define FLOWCTRL_RESET_REG	1
//#define FLOWCTRL_DELAY_REG	2
//#define FLOWCTRL_GPI_6_REGS	16
//#define FLOWCTRL_TRAN_CNT	24

void AXISSW_conf()
{
	// raw data switch
	*(u32*)(XPAR_TOP_SWITCH_RAW_BASEADDR + 4*REGW_READY_DLY) = 0x10;
//	*(u32*)(XPAR_TOP_SWITCH_TST_BASEADDR + 4*REGW_READY_DLY) = 1000;
	*(u32*)(XPAR_TOP_SWITCH_RAW_BASEADDR + 4*REGW_ARBITRATE) = 0x03F;// 000000111111
//	*(u32*)(XPAR_TOP_SWITCH_TST_BASEADDR + 4*REGW_ARBITRATE) = 0x001;// 000000000001
	*(u32*)(XPAR_TOP_SWITCH_RAW_BASEADDR + 4*REGW_SW_CTRL) |= (1<<BIT_SW_START);
//	*(u32*)(XPAR_TOP_SWITCH_TST_BASEADDR + 4*REGW_SW_CTRL) |= (1<<BIT_SW_START);
}

int GetSWSMState()
{
	return *(u32*)(XPAR_TOP_SWITCH_RAW_BASEADDR + 4*REGR_SM_STATE);
}

//int GetPacketCounter(UINTPTR baseaddr)
//{
//	return *(u32*)(XPAR_TOP_SWITCH_TST_BASEADDR + 4*REGR_PACKET_CNT);
//}
