/*
 * pdmdata_hw.h
 *
 *  Created on: Jan 30, 2017
 *      Author: alx
 */

#ifndef SRC_PDMDATA_HW_H_
#define SRC_PDMDATA_HW_H_

#include "pdmdata.h"

#define DATA_TYPE_L1	1
#define DATA_TYPE_L2	2
#define DATA_TYPE_L3	3

#define N_FRAMES_DMA_RAW		(N_OF_FRAMES_L1_V0*16)
#define N_FRAMES_DMA_L1			(N_OF_FRAMES_L2_V0*2)
#define N_FRAMES_DMA_L2			(N_OF_FRAMES_L3_V0*1)

#define N_BUFFERS_DMA_RAW		1
#define N_BUFFERS_DMA_L1		1
#define N_BUFFERS_DMA_L2		2

//#define N_FRAMES_TST_DMA_L1		1
//#define N_FRAMES_TST_DMA_L2		1

//#define N_SECTIONS				16

#define DMA_TST_BUF_SIZE	60000000 /*60 Meg*/

void CopyEventData(int data_type); // 1 - L1, 2 - L2, 3 - L3
void InvalidateCacheRanges(int data_type); // 1 - L1, 2 - L2, 3 - L3
void* GetZ_DATA_TYPE_SCI_ptr(int data_type); // 1 - L1, 2 - L2, 3 - L3
int IsBufferL2Changed();


#endif /* SRC_PDMDATA_HW_H_ */
