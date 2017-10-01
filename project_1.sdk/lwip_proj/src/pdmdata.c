/*
 * pdmdata.c
 *
 *  Created on: May 22, 2017
 *      Author: alx
 */
#include "pdmdata_hw.h"
#include "xaxidma.h"
#include "xscugic.h"
#include "xparameters.h"
#include "axis_flowctrl.h"


XAxiDma dma_raw, dma_l1, dma_l2, data_tst_l1;//, dma_tst_l2;
XAxiDma_Config* CfgPtr_raw;
uint8_t DataDMA__Raw[N_BUFFERS_DMA_RAW][N_FRAMES_DMA_RAW][N_OF_PIXEL_PER_PDM] __attribute__ ((aligned (64)));
uint16_t DataDMA__L1[N_BUFFERS_DMA_L1][N_FRAMES_DMA_L1][N_OF_PIXEL_PER_PDM] __attribute__ ((aligned (64)));
uint32_t DataDMA__L2[N_BUFFERS_DMA_L2][N_FRAMES_DMA_L2][N_OF_PIXEL_PER_PDM] __attribute__ ((aligned (64)));
//uint8_t DataDMA_tst_L1[DMA_CYCLIC_BUF_SIZE] __attribute__ ((aligned (64)));
//uint16_t DataDMA_tst_L2[DMA_CYCLIC_BUF_SIZE] __attribute__ ((aligned (64)));

volatile u32 dma_intr_counter_raw = 0, dma_intr_counter_l1 = 0, dma_intr_counter_l2 = 0;
volatile u32 current_buffer_L2 = 0;
volatile u32 buffer_L2_changed;

//Z_DATA_TYPE_SCI_L1_V1 Z_DATA_TYPE_SCI_L1;
//Z_DATA_TYPE_SCI_L2_V1 Z_DATA_TYPE_SCI_L2;
//Z_DATA_TYPE_SCI_L3_V1 Z_DATA_TYPE_SCI_L3;
ZYNQ_PACKET zynqPacket;

void InvalidateCacheRanges(int data_type) // 1 - L1, 2 - L2, 3 - L3
{
	if(data_type == DATA_TYPE_L1)
		Xil_DCacheInvalidateRange((INTPTR)&DataDMA__Raw[0][0][0], sizeof(DataDMA__Raw));
	else if(data_type == DATA_TYPE_L2)
		Xil_DCacheInvalidateRange((INTPTR)&DataDMA__L1[0][0][0], sizeof(DataDMA__L1));
	else if(data_type == DATA_TYPE_L3)
		Xil_DCacheInvalidateRange((INTPTR)&DataDMA__L2[0][0][0], sizeof(DataDMA__L2));
}

void* GetZ_DATA_TYPE_SCI_ptr(int data_type) // 1 - L1, 2 - L2, 3 - L3
{
	if(data_type == DATA_TYPE_L1)
		return &zynqPacket.level1_data[0];
	else if(data_type == DATA_TYPE_L2)
		return &zynqPacket.level2_data[0];
	else if(data_type == DATA_TYPE_L3)
		return &zynqPacket.level3_data[0];
}

void PrintFrame(int frame_num)
{
	int i;
	Xil_DCacheInvalidateRange((INTPTR)&DataDMA__Raw[0][0][0], sizeof(DataDMA__Raw));
	for(i=0;i<N_OF_PIXEL_PER_PDM;i++)
	{
		xil_printf("i=%d\t[frame_num][i]=0x%02x\n\r", i, DataDMA__Raw[0][frame_num][i]);
	}
}

void PrintFirstElementsL1()
{
	int i;
	Xil_DCacheInvalidateRange((INTPTR)&DataDMA__L1[0][0][0], sizeof(DataDMA__L1));
	for(i=0;i<2304/2;i++)
	{
		xil_printf("DataDMA__L1[0][0][%d]=0x%04x\n\r", i, DataDMA__L1[0][0][i]);
	}
}

void PrintFirstElementsRaw()
{
	int i;
	Xil_DCacheInvalidateRange((INTPTR)&DataDMA__Raw[0][0][0], sizeof(DataDMA__Raw));
	for(i=0;i<2304/2;i++)
	{
		xil_printf("DataDMA__Raw[0][0][%d]=0x%04x\n\r", i, DataDMA__Raw[0][0][i]);
	}
}

// This function copies the data from DMA memory to ethernet structure
// data_type is the data source type (L1, L2 or L3)
void CopyEventData(int data_type) // 1 - L1, 2 - L2, 3 - L3
{
	print("\n\rCopyEventData: ");
	if(data_type == DATA_TYPE_L1)
	{
		print("L1:");
		// copy the timestamp
		memcpy(&zynqPacket.level1_data[0].payload.ts, XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GTU_TIMEST_H*4, 8);
		print("T");
		// copy data
		u32 gtu_offset = *(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GTU_CNT_4DMA*4) % N_FRAMES_DMA_RAW;
		xil_printf(":%d:", gtu_offset);
//		// just for test
//		void* addr2 = &DataDMA__Raw[0][0][0];
//		memcpy(&Z_DATA_TYPE_SCI_L1.payload.raw_data, addr2, N_OF_FRAMES_L1_V0*N_OF_PIXEL_PER_PDM);
		if(gtu_offset>=N_OF_FRAMES_L1_V0)
		{
			// calc address to copy from
			void* addr = &DataDMA__Raw[0][gtu_offset-N_OF_FRAMES_L1_V0][0];
			// copy the sci data
			memcpy(&zynqPacket.level1_data[0].payload.raw_data[0][0], addr, N_OF_FRAMES_L1_V0*N_OF_PIXEL_PER_PDM);
			print("S");
		}
		else
		{
			// calc address to copy from
			void* addr = &DataDMA__Raw[0][N_FRAMES_DMA_RAW+gtu_offset-N_OF_FRAMES_L1_V0][0];
			void* addr2 = &DataDMA__Raw[0][0][0];
			// copy the sci data
			memcpy(&zynqPacket.level1_data[0].payload.raw_data[0][0] + (N_OF_FRAMES_L1_V0-gtu_offset)*N_OF_PIXEL_PER_PDM, addr2, gtu_offset*N_OF_PIXEL_PER_PDM);
			print("D2");
			memcpy(&zynqPacket.level1_data[0].payload.raw_data[0][0], addr, (N_OF_FRAMES_L1_V0 - gtu_offset)*N_OF_PIXEL_PER_PDM);
			print("D1");
		}
	}
	else if(data_type == DATA_TYPE_L2)
	{
		print("L2: ");
		// copy the timestamp
		memcpy(&zynqPacket.level2_data[0].payload.ts, XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_GTU_TIMEST_H*4, 8);
		print("T");
		// copy data
		u32 gtu_offset = *(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_GTU_CNT_4DMA*4) % N_FRAMES_DMA_L1;
		xil_printf(":%d:", gtu_offset);
		if(gtu_offset>=N_OF_FRAMES_L2_V0)
		{
			// calc address to copy from
			void* addr = &DataDMA__L1[0][gtu_offset-N_OF_FRAMES_L2_V0][0];
			// copy the sci data
			memcpy(&zynqPacket.level2_data[0].payload.int16_data[0][0], addr, 2*N_OF_FRAMES_L2_V0*N_OF_PIXEL_PER_PDM);
			print("S");
		}
		else
		{
			// calc address to copy from
			void* addr = &DataDMA__L1[0][N_FRAMES_DMA_L1+gtu_offset-N_OF_FRAMES_L1_V0][0];
			void* addr2 = &DataDMA__L1[0][0][0];
			// copy the sci data
			memcpy(&zynqPacket.level2_data[0].payload.int16_data[0][0], addr, 2*(N_OF_FRAMES_L2_V0-gtu_offset)*N_OF_PIXEL_PER_PDM);
			print("D1");
			memcpy((char*)&zynqPacket.level2_data[0].payload.int16_data[0][0] + 2*(N_OF_FRAMES_L2_V0-gtu_offset)*N_OF_PIXEL_PER_PDM, addr2, 2*(gtu_offset)*N_OF_PIXEL_PER_PDM);
			print("D2");
		}
	}
	else if(data_type == DATA_TYPE_L3)
	{
		print("L3: ");
		// copy the timestamp
		memcpy(&zynqPacket.level3_data[0].payload.ts, XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_GTU_CNT_H_RND*4, 8);
		print("T");
		memcpy(&zynqPacket.level3_data[0].payload.int32_data[0][0], &DataDMA__L2[!current_buffer_L2][0][0], 4*N_OF_FRAMES_L3_V0*N_OF_PIXEL_PER_PDM);
		print("S");
	}
	print("\n\r");
}



void DmaReset(XAxiDma* pdma)
{
	XAxiDma_Reset(pdma);
	while(1)
	{
		if(XAxiDma_ResetIsDone(pdma))
			return;
		else
			print("*");
	}
}

void DmaResetN(int n) // 1 - L1, 2 - L2, 3 - L3
{
	if(n == 1)
		XAxiDma_Reset(&dma_raw);
	else if(n == 2)
		XAxiDma_Reset(&dma_l1);
	else if(n == 3)
		XAxiDma_Reset(&dma_l2);
}


void DmaStart(XAxiDma* pdma, UINTPTR addr, u32 length )
{
	//int status;
	//XAxiDma_Reset(&dma_raw);
	XAxiDma_IntrEnable(pdma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_SimpleTransfer(pdma, addr, length, XAXIDMA_DEVICE_TO_DMA); // in bytes
	//if(status)	print("Error in XAxiDma_SimpleTransfer dma_raw!\n\r");
}


void DmaStartN(int n) //1 - L1, 2 - L2, 3 - L3
{
	if(n == 1)
		DmaStart(&dma_raw, (UINTPTR)&DataDMA__Raw[0][0][0], 1 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_RAW);
	else if(n == 2)
		DmaStart(&dma_l1, (UINTPTR)&DataDMA__L1[0][0][0], 2 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_L1);
}
//void DmaAllStart()
//{
//}


static void RxIntrHandlerRaw(void *Callback)
{
	u32 IrqStatus;
	//int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	/*Interrupt on Error because we are using overflow*/
	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK))
	{
		DmaReset(AxiDmaInst);

		DmaStart(AxiDmaInst, (UINTPTR)&DataDMA__Raw[0][0][0], 1 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_RAW);
		dma_intr_counter_raw++;
		//print("x");

		return;
	}
}

static void RxIntrHandlerL1(void *Callback)
{
	u32 IrqStatus;
	//int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK))
	{
		DmaReset(AxiDmaInst);
		DmaStart(AxiDmaInst, (UINTPTR)&DataDMA__L1[0][0][0], 2 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_L1);
		dma_intr_counter_l1++;
		//print("y");

		return;
	}
}

static void RxIntrHandlerL2(void *Callback)
{
	u32 IrqStatus;
	//int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	if ((IrqStatus & XAXIDMA_IRQ_ERROR_MASK) || (IrqStatus & XAXIDMA_IRQ_IOC_MASK))
	{
		dma_intr_counter_l2++;
		current_buffer_L2 = dma_intr_counter_l2%2;

		DmaReset(AxiDmaInst);
		DmaStart(AxiDmaInst, (UINTPTR)&DataDMA__L2[current_buffer_L2][0][0], 4 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_L2);
		buffer_L2_changed = 1;
		//print("z");

		return;
	}
}


int IsBufferL2Changed()
{
	if(buffer_L2_changed)
	{
		buffer_L2_changed = 0;
		return 1;
	}
	else
	{
		return 0;
	}
}

void SetupDMAIntrSystem(XScuGic* pIntc)
{
	int Result;


	XScuGic_SetPriorityTriggerType(pIntc, XPAR_FABRIC_AXI_DMA_RAW_S2MM_INTROUT_INTR,
					0x90, 0x3);
	XScuGic_SetPriorityTriggerType(pIntc, XPAR_FABRIC_AXI_DMA_L1_S2MM_INTROUT_INTR,
					0x98, 0x3);
	XScuGic_SetPriorityTriggerType(pIntc, XPAR_FABRIC_AXI_DMA_L2_S2MM_INTROUT_INTR,
					0xA0, 0x3);

	/*
	 * Connect the interrupt handler that will be called when an
	 * interrupt occurs for the device.
	 */
	Result = XScuGic_Connect(pIntc, XPAR_FABRIC_AXI_DMA_RAW_S2MM_INTROUT_INTR,
				 (Xil_ExceptionHandler)RxIntrHandlerRaw, &dma_raw);
	if (Result != XST_SUCCESS) {
		print("Error XScuGic_Connect\n\r");
	}
	Result = XScuGic_Connect(pIntc, XPAR_FABRIC_AXI_DMA_L1_S2MM_INTROUT_INTR,
				 (Xil_ExceptionHandler)RxIntrHandlerL1, &dma_l1);
	if (Result != XST_SUCCESS) {
		print("Error XScuGic_Connect\n\r");
	}
	Result = XScuGic_Connect(pIntc, XPAR_FABRIC_AXI_DMA_L2_S2MM_INTROUT_INTR,
				 (Xil_ExceptionHandler)RxIntrHandlerL2, &dma_l2);
	if (Result != XST_SUCCESS) {
		print("Error XScuGic_Connect\n\r");
	}

	/* Enable the interrupt for the GPIO device.*/
	XScuGic_Enable(pIntc, XPAR_FABRIC_AXI_DMA_RAW_S2MM_INTROUT_INTR);
	XScuGic_Enable(pIntc, XPAR_FABRIC_AXI_DMA_L1_S2MM_INTROUT_INTR);
	XScuGic_Enable(pIntc, XPAR_FABRIC_AXI_DMA_L2_S2MM_INTROUT_INTR);


	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			 (Xil_ExceptionHandler)XScuGic_InterruptHandler, pIntc);

	/* Enable non-critical exceptions */
	Xil_ExceptionEnable();

	return;

}

void DMA_init()
{
	int i;
	memset(DataDMA__Raw, 0, sizeof(DataDMA__Raw));
	memset(DataDMA__L1, 0, sizeof(DataDMA__L1));
	memset(DataDMA__L2, 0, sizeof(DataDMA__L2));
	xil_printf("sizeof(DataDMA_Raw)=%d\n\r", sizeof(DataDMA__Raw));
	xil_printf("sizeof(DataDMA_L1)=%d\n\r", sizeof(DataDMA__L1));
	xil_printf("sizeof(DataDMA_L2)=%d\n\r", sizeof(DataDMA__L2));

	memset(&zynqPacket, 0, sizeof(zynqPacket));

	for(i=0; i<MAX_PACKETS_L1; i++)
	{
		zynqPacket.level1_data[i].zbh.header = BuildHeader(DATA_TYPE_SCI_L1, 1);
		zynqPacket.level1_data[i].zbh.payload_size = sizeof(zynqPacket.level1_data[i].payload);
	}
	for(i=0; i<MAX_PACKETS_L2; i++)
	{
		zynqPacket.level2_data[i].zbh.header = BuildHeader(DATA_TYPE_SCI_L2, 1);
		zynqPacket.level2_data[i].zbh.payload_size = sizeof(zynqPacket.level2_data[i].payload);
	}
	zynqPacket.level3_data[0].zbh.header = BuildHeader(DATA_TYPE_SCI_L3, 1);
	zynqPacket.level3_data[0].zbh.payload_size = sizeof(zynqPacket.level3_data[0].payload);


	XStatus status = 0;
	XAxiDma_Config *CfgPtr;
	//print("DMA_init\n\r");
	CfgPtr_raw = XAxiDma_LookupConfig(XPAR_AXI_DMA_RAW_DEVICE_ID);
	if (!CfgPtr_raw) {
		xil_printf("No config found for %d\r\n", XPAR_AXI_DMA_RAW_DEVICE_ID);
	}
	status = XAxiDma_CfgInitialize(&dma_raw, CfgPtr_raw);
	//xil_printf("dma_raw.RegBase=0x%08x\n\r", dma_raw.RegBase);
	if(status)	print("Error in XAxiDma_CfgInitialize dma_raw !\n\r");
	DmaStart(&dma_raw, (UINTPTR)&DataDMA__Raw[0][0][0], 1 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_RAW);
	//status = XAxiDma_SelectCyclicMode(&dma_raw, XAXIDMA_DEVICE_TO_DMA, TRUE);
	//if(status)	print("Error in XAxiDma_SelectCyclicMode dma_raw!\n\r");

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_L1_DEVICE_ID);
	status = XAxiDma_CfgInitialize(&dma_l1, CfgPtr);
	if(status)	print("Error in XAxiDma_CfgInitialize dma_l1!\n\r");
	DmaStart(&dma_l1, (UINTPTR)&DataDMA__L1[0][0][0], 2 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_L1);

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_L2_DEVICE_ID);
	status = XAxiDma_CfgInitialize(&dma_l2, CfgPtr);
	if(status)	print("Error in XAxiDma_CfgInitialize dma_l2!\n\r");
	DmaStart(&dma_l2, (UINTPTR)&DataDMA__L2[0][0][0], 4 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_L2);

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_TST_L1_DEVICE_ID);
	status = XAxiDma_CfgInitialize(&data_tst_l1, CfgPtr);
	if(status)	print("Error in XAxiDma_CfgInitialize data_tst_l1!\n\r");



//	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_TST_L2_DEVICE_ID);
//	status = XAxiDma_CfgInitialize(&dma_tst_l2, CfgPtr);
//	if(status)	print("Error in XAxiDma_CfgInitialize dma_tst_l2!\n\r");
}


u32 GetDMAIntrCounterN(int n)
{
	if(n==0)
		return dma_intr_counter_raw;
	else if(n==1)
		return dma_intr_counter_l1;
	else if(n==2)
		return dma_intr_counter_l2;
	else
		return 0;
}



void ProvideTestDataL1()
{
	u32 i, ret;
	u32 tst_data_size = Get_receive_buffer_offset();
	u32 packet_size = N_OF_PIXEL_PER_PDM/3;
	char * addr = Get_receive_buffer();
	for (i=0; i<tst_data_size; i+=packet_size)
	{
		ret=XAxiDma_SimpleTransfer(&data_tst_l1, addr + i, packet_size, XAXIDMA_DMA_TO_DEVICE);
		if(ret) print("!");
		while (XAxiDma_Busy(&data_tst_l1, XAXIDMA_DMA_TO_DEVICE)) {
				/* Wait */
		}

		//print("*-------->");
	}
}
