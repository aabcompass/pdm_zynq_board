/*
 * fifo_log.c
 *
 *  Created on: Nov 13, 2019
 *      Author: alx
 */

#include "xparameters.h"
#include "xil_exception.h"
#include "xstreamer.h"
#include "xil_cache.h"
#include "xllfifo.h"
#include "xstatus.h"

XLlFifo fifo4log;

int XLlFifoEventsInit()
{
	XLlFifo_Config *Config;
	int Status;
	int i;
	int Error;
	Status = XST_SUCCESS;

	/* Initial setup for Uart16550 */

	/* Initialize the Device Configuration Interface driver */
	Config = XLlFfio_LookupConfig(XPAR_AXI_FIFO4ADCV_DEVICE_ID);
	if (!Config) {
		xil_printf("No config found for %d\r\n", XPAR_AXI_FIFO4ADCV_DEVICE_ID);
		return XST_FAILURE;
	}

	/*
	 * This is where the virtual address would be used, this example
	 * uses physical address.
	 */
	Status = XLlFifo_CfgInitialize(&fifo4log, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed\n\r");
		return Status;
	}

	/* Check for the Reset value */
	Status = XLlFifo_Status(&fifo4log);
	XLlFifo_IntClear(&fifo4log,0xffffffff);
	Status = XLlFifo_Status(&fifo4log);
	if(Status != 0x0) {
		xil_printf("\n ERROR : Reset value of ISR0 : 0x%x\t"
			    "Expected : 0x0\n\r",
			    XLlFifo_Status(&fifo4log));
		return XST_FAILURE;
	}
	xil_printf("fifoEvents.BaseAddress=0x%08x\n\r", fifo4log.BaseAddress);
	return Status;
}


u32 GetLogFifoOcc()
{
	return XLlFifo_RxOccupancy(&fifo4log);
}
