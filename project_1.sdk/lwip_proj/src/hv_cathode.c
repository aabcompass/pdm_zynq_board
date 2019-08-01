/*
 * hv_cathode.c
 *
 *  Created on: Aug 1, 2019
 *      Author: alx
 */
#include "xparameters.h"
#include "hv_cathode.h"
#include "xil_types.h"



void TestEC_sig()
{
	*(u32*)(XPAR_AXI_CATHODE_CTRL_0_BASEADDR + 4*REGW_HVCATH_STIM_EC_SIG) = 0x12345;
	*(u32*)(XPAR_AXI_CATHODE_CTRL_0_BASEADDR + 4*REGW_HVCATH_STIM_EC_SIG) = 0;
}
