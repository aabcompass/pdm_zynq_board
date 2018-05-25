/*
 * pdmdata_hw.h
 *
 *  Created on: Jan 30, 2017
 *      Author: alx
 */
#include "xil_types.h"


#ifndef SRC_PDMDATA_HW_H_
#define SRC_PDMDATA_HW_H_

#include "minieuso_pdmdata.h"

#define DATA_TYPE_L1	1
#define DATA_TYPE_L2	2
#define DATA_TYPE_L3	3

#define N_FRAMES_DMA_RAW		 N_OF_FRAMES_L1_V0
#define N_FRAMES_DMA_L1			(N_OF_FRAMES_L2_V0*2)
#define N_FRAMES_DMA_L2			(N_OF_FRAMES_L3_V0*1)

#define TRIGGER_DATA_OFFSET			64 /*in GTU*/

#define N_ALT_BUFFERS				2

#define N_TRIG_BUFFERS_DMA_RAW		16
#define N_TRIG_BUFFERS_DMA_L1		8
#define N_TRIG_BUFFERS_DMA_L2		1

#define N_ALT_TRIG_BUFFERS			2

#define N_EVENTS_L1		524288			/*Number of events registered with L1 trigger*/

#define DMA_TST_BUF_SIZE	60000000 /*60 Meg*/

//void InvalidateCacheRanges(int data_type); // 1 - L1, 2 - L2, 3 - L3
//void* GetZ_DATA_TYPE_SCI_ptr(int data_type); // 1 - L1, 2 - L2, 3 - L3
int IsBufferL2Changed();

typedef struct
{
	u32 trigger_type;
	u32 n_gtu;
	u32 unix_timestamp;
	u8 is_sent;
	u8 is_dma_error;
	u32 n_intr;
	u32 alt_trig_buffer;
} TriggerInfo;

#define MAX_TRIGGERS_PER_CYCLE		4

#endif /* SRC_PDMDATA_HW_H_ */
