/*
 * pixel_mask.c
 *
 *  Created on: Jun 14, 2019
 *      Author: alx
 */
#include "xil_types.h"
#include "xparameters.h"
#include "pixel_mask.h"

void LoadPixMaskL1(u32 pixel, u32 ec, u32 msk)
{
	int i;
	u32 val;
	val = msk*BIT_PIXELMASK_L1_DISCARD | pixel*BIT_PIXELMASK_L1_PIXEL | ec*BIT_PIXELMASK_L1_ECASIC | BIT_PIXELMASK_L1_WR;
	*(u32*)(XPAR_AXI_PIXEL_MASK_0_BASEADDR + 4*REGW_PIXELMASK_L1_CTRL) = val;
}
