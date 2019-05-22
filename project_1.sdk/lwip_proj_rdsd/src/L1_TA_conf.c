/*
 * L1_TA_cong.c
 *
 *  Created on: Nov 27, 2018
 *      Author: alx
 */

#include "xbasic_types.h"
#include "xparameters.h"

#define ADDR_TA_TRIG_L1 	XPAR_AXI_GPIO_TA_EV_BASEADDR

void SetL1TAthresholds(u32 pmt_trig1, u32 pmt_trig2, u32 ec_trig1, u32 ec_trig2, u32 pdm_trig1, u32 pdm_trig2)
{
	//Group 0
	*(u32*)ADDR_TA_TRIG_L1 = 0<<30 | pmt_trig1<<0 | pmt_trig2<<7 | ec_trig1<<15;
	//Group 1
	*(u32*)ADDR_TA_TRIG_L1 = 1<<30 | ec_trig2<<0 | pdm_trig1<<10;
	//Group 2
	*(u32*)ADDR_TA_TRIG_L1 = 2<<30 | pdm_trig2<<0;
}
