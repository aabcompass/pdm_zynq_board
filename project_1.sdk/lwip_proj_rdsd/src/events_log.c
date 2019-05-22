/*
 * events_log.c
 *
 *  Created on: Mar 10, 2018
 *      Author: alx
 */

#include "xaxidma.h"
#include "xparameters.h"
#include "pdmdata_hw.h"

XAxiDma dma_events_l1;

DATA_TYPE_EVENTS_LOG DataDMA_events_L1[N_EVENTS_L1] __attribute__ ((aligned (64)));

void ResetDMATrigEventLog()
{
	u32 i;
	XAxiDma_Reset(&dma_events_l1);
	for(i=0;i<1000000;i++)
	{
		if(XAxiDma_ResetIsDone(&dma_events_l1)) return;
	}
	print("XAxiDma_Reset(&dma_events_l1)) Error!\n\r");
}

//void DMA_events_log_init()
//{
//	XStatus status;
//	XAxiDma_Config *CfgPtr;
//	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_EVENTS_L1_DEVICE_ID);
//	status = XAxiDma_CfgInitialize(&dma_events_l1, CfgPtr);
//	if(status)	print("Error in XAxiDma_CfgInitialize dma_events_l1!\n\r");
//}

void DMA_events_log_start()
{
	u32 ret;
	XAxiDma_IntrEnable(&dma_events_l1, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	ret=XAxiDma_SimpleTransfer(&dma_events_l1, (UINTPTR)&DataDMA_events_L1[0], N_EVENTS_L1*sizeof(DATA_TYPE_EVENTS_LOG), XAXIDMA_DEVICE_TO_DMA); // in bytes
	if(ret != XST_SUCCESS)
		print("XAxiDma_SimpleTransfer returns nonzero!\n\r");

}


char* Get_DataDMA_events_L1_ptr_and_invalidate(u32 num_records)
{
	Xil_DCacheInvalidateRange((INTPTR)&DataDMA_events_L1[0], num_records*sizeof(u32));
	return (char*)&DataDMA_events_L1[0];
}

void Print_DataDMA_events_L1(u32 num)
{
	int i;
	Xil_DCacheInvalidateRange(&DataDMA_events_L1[0], sizeof(DataDMA_events_L1)/*num*sizeof(u32)*/);
	for(i=0; i<num; i++)
		xil_printf("0x%08x\n\r", DataDMA_events_L1[i].trig_level, DataDMA_events_L1[i].trig_type, DataDMA_events_L1[i].timestamp_gtu);
}
