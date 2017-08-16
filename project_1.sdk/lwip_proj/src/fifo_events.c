/*
 * fifo_events.c
 *
 *  Created on: Jun 20, 2017
 *      Author: alx
 */

#include "xparameters.h"
#include "xil_exception.h"
#include "xstreamer.h"
#include "xil_cache.h"
#include "xllfifo.h"
#include "xstatus.h"

XLlFifo fifoEvents;

#define  EVENTS_FIFO_DEVICE_ID XPAR_AXI_FIFO_MM_S_TRIGGER_EV_DEVICE_ID
#define WORD_SIZE	4

int XLlFifoEventsInit()
{
	XLlFifo_Config *Config;
	int Status;
	int i;
	int Error;
	Status = XST_SUCCESS;

	/* Initial setup for Uart16550 */

	/* Initialize the Device Configuration Interface driver */
	Config = XLlFfio_LookupConfig(EVENTS_FIFO_DEVICE_ID);
	if (!Config) {
		xil_printf("No config found for %d\r\n", EVENTS_FIFO_DEVICE_ID);
		return XST_FAILURE;
	}

	/*
	 * This is where the virtual address would be used, this example
	 * uses physical address.
	 */
	Status = XLlFifo_CfgInitialize(&fifoEvents, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed\n\r");
		return Status;
	}

	/* Check for the Reset value */
	Status = XLlFifo_Status(&fifoEvents);
	XLlFifo_IntClear(&fifoEvents,0xffffffff);
	Status = XLlFifo_Status(&fifoEvents);
	if(Status != 0x0) {
		xil_printf("\n ERROR : Reset value of ISR0 : 0x%x\t"
			    "Expected : 0x0\n\r",
			    XLlFifo_Status(&fifoEvents));
		return XST_FAILURE;
	}
	xil_printf("fifoEvents.BaseAddress=0x%08x\n\r", fifoEvents.BaseAddress);
	return Status;
}

int RxNEvents()
{
	xil_printf("XLlFifo_iRxOccupancy = %d\n\r", XLlFifo_iRxOccupancy(&fifoEvents));
}

int RxReceiveAndPrint()
{

	int i;
	int Status;
	u32 RxWord;
	static u32 ReceiveLength;

	while(1)
	{
		if(XLlFifo_iRxOccupancy(&fifoEvents) == 0)
			return 0;

		//xil_printf(" Receiving data ....\n\r");
		/* Read Receive Length */
		ReceiveLength = (XLlFifo_iRxGetLen(&fifoEvents))/WORD_SIZE;
		//xil_printf("ReceiveLength=%d\n\r", ReceiveLength);

		/* Start Receiving */
		for ( i=0; i < ReceiveLength; i++){
			RxWord = 0;
			RxWord = XLlFifo_RxGetWord(&fifoEvents);

			//if(XLlFifo_iRxOccupancy(&fifoEvents)){
			//	RxWord = XLlFifo_RxGetWord(&fifoEvents);
			//}
			xil_printf("%d\n\r", RxWord);
		}

		Status = XLlFifo_IsRxDone(&fifoEvents);
		if(Status != TRUE){
			xil_printf("Failing in receive complete ... \r\n");
			return XST_FAILURE;
		}
	}
	return XST_SUCCESS;
}
