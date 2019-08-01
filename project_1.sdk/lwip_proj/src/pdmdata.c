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
#include "axis_flowctrl_d1.h"
#include "axis_flowctrl_d2.h"
#include "axi_spectral_core.h"
#include "pdmdp_err.h"
#include "data_provider.h"
#include "ftp_server.h"


XAxiDma dma_d1, dma_d2, dma_d3;//, data_tst_l1;//, dma_tst_l2;
XAxiDma_Config* CfgPtr_d1;

// this array contains only triggered D1 data
uint8_t  DataDMA_D1[N_ALT_BUFFERS][N_TRIG_BUFFERS_DMA_D1][N_FRAMES_DMA_D1][N_OF_PIXEL_PER_PDM] __attribute__ ((aligned (64)));
// Data is taken from this array every 5.24s

// this array contains all D2 data. Updated circullary
uint16_t DataDMA_D2[N_TRIG_BUFFERS_DMA_D2][N_FRAMES_DMA_D2][N_OF_PIXEL_PER_PDM] __attribute__ ((aligned (64)));
//Data is taken from this array on every trigger.

// this array contains all D3 data. Updated circullary
uint32_t DataDMA_D3[N_ALT_BUFFERS][N_TRIG_BUFFERS_DMA_D3][N_FRAMES_DMA_D3][N_OF_PIXEL_PER_PDM] __attribute__ ((aligned (64)));
// Data is taken from this array every 5.24s

// this array contains only triggered D2 data
uint16_t Data_L2[N_ALT_BUFFERS][MAX_TRIGGERS_PER_CYCLE][N_OF_FRAMES_L2_V0*N_OF_PIXEL_PER_PDM] __attribute__ ((aligned (64)));
// Data is taken from this array every 5.24s


volatile u32 dma_intr_counter_d1 = 0, dma_intr_counter_d2 = 0, dma_intr_counter_d3 = 0;
volatile u32 trig_counter__l1 = 0, trig_counter__l2 = 0;

volatile u32 prev_alt_buffer = 0, current_alt_buffer = 0;
//volatile u32 prev_alt_trig_buffer_l1 = 0, current_alt_trig_buffer_l1 = 0;
volatile u32 buffer_D3_changed;
volatile u32 buffer_D3_changed2;
volatile u32 current_trigbuf_d1  = 0;

int N1=4, N2=4, N3=1;

extern InstrumentState instrumentState;

DATA_TYPE_SCI_ALLTRG_V1 zynqPacket;
Z_DATA_TYPE_SCURVE_V1 scurvePacket;
DATA_TYPE_SCURVE_4MATLAB scurvePacket4MatLab;
SCurveStruct sCurveStruct;

TriggerInfo triggerInfoD1[2][MAX_TRIGGERS_PER_CYCLE];
TriggerInfo triggerInfoD2[2][MAX_TRIGGERS_PER_CYCLE];
TriggerInfo triggerInfoD3[2][1];

u32 scurve_memcpy_pos = 0;
/*
 *
 * The ZYNQ boards memory management.
 * MM cycle - 5.24 time interval
 *   even cycles - 0, 2, 4, 6, 8 ...
 *   odd cycles  - 1, 3, 5, 7, 9 ...
 *
 * DMA bank - memory area which currently is used for DMA transfer
 *   There are 8 banks. 4 banks for even and 4 banks for odd
 *   In the beginning of even cycle current banks = 0, in the beginning of odd cycle current banks = 4
 *   On any trigger current bank is changing to next one.
 *   Trigger events with their types are being sent from FlowControl IP cores.
 *   Trigger event has: trigger type, memory address, n_gtu, unix_timestamp
 *
 */

static enum  {
	l2_sm_idle = 10,
	l2_sm_cought=100,
	l2_sm_timer=110,
	l2_sm_copying=111,
	l2_sm_copied=115,
	l2_sm_max_riched=120
	} l2_sm_state = l2_sm_idle;


void PrintD1_1stElements()
{
	int i, j;
	Xil_DCacheInvalidateRange((INTPTR)&DataDMA_D1[0][0][0][0], N_ALT_BUFFERS*N_TRIG_BUFFERS_DMA_D1*N_FRAMES_DMA_D1*N_OF_PIXEL_PER_PDM);
	for(j=0;j<2;j++)
		for(i=0;i<4;i++)
			xil_printf("DataDMA__Raw[%d][%d][0][0]=0x%02x\n\r", j, i, DataDMA_D1[j][i][0][0]);
}

int current_bank_L1=0, current_bank_L2=0;

void Set_N1(int value)
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) &= 0xFFFF0000;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) |= value;
	N1 = value;
}

void Set_N2(int value)
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) &= 0xFFFF0000;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_NUM_OF_TRIGS_FLAGS2*4) |= value;
	N2 = value;
}


void PrintTriggerInfo()
{
	int i, j;
	print("Trigger info L1:\n\r");
	for(i=0;i<2;i++)
	{
		for(j=0;j<4;j++)
		{
			xil_printf("%d.%d\t%x\t%08d\t%08d\t%08d\t%06d\t%d\t%s\n\r",
					i,
					j,
					triggerInfoD1[i][j].trigger_type,
					triggerInfoD1[i][j].n_gtu,
					triggerInfoD1[i][j].unix_timestamp,
					triggerInfoD1[i][j].is_dma_error,
					triggerInfoD1[i][j].n_intr,
					triggerInfoD1[i][j].alt_trig_buffer,
					triggerInfoD1[i][j].is_sent ? "sent" : "pending");
		}
	}
	print("Trigger info L2:\n\r");
	for(i=0;i<2;i++)
	{
		for(j=0;j<4;j++)
		{
			xil_printf("%d.%d\t%x\t%08d\t%08d\t%06d\t%d\t%s\n\r",
					i,
					j,
					triggerInfoD2[i][j].trigger_type,
					triggerInfoD2[i][j].n_gtu,
					triggerInfoD2[i][j].unix_timestamp,
					triggerInfoD2[i][j].n_intr,
					triggerInfoD2[i][j].alt_trig_buffer,
					triggerInfoD2[i][j].is_sent ? "sent" : "pending");
		}
	}
	print("Trigger info L3:\n\r");
	for(i=0;i<2;i++)
	{
		for(j=0;j<1;j++)
		{
			xil_printf("%d.%d\t%x\t%08d\t%08d\t%06d\t%d\t%s\n\r",
					i,
					j,
					triggerInfoD3[i][j].trigger_type,
					triggerInfoD3[i][j].n_gtu,
					triggerInfoD3[i][j].unix_timestamp,
					triggerInfoD3[i][j].n_intr,
					triggerInfoD3[i][j].alt_trig_buffer,
					triggerInfoD3[i][j].is_sent ? "sent" : "pending");
		}
	}
	xil_printf("Next current_alt_buffer=%d\n\r", current_alt_buffer);
	xil_printf("XAxiDma_Busy returns %d\n\r", XAxiDma_Busy(&dma_d1, XAXIDMA_DEVICE_TO_DMA));
}


void ClearTriggerInfo(int half)
{
	int j;
	for(j=0;j<4;j++)
	{
		triggerInfoD1[half][j].trigger_type = 0;
		triggerInfoD1[half][j].is_sent = 0;
		triggerInfoD2[half][j].trigger_type = 0;
		triggerInfoD2[half][j].is_sent = 0;
	}
}

void printMMVars()
{
	xil_printf("trig_counter_l1=%d\n\r", trig_counter__l1);
	xil_printf("trig_counter_l2=%d\n\r", trig_counter__l2);
}

void SetTime(u32 param0)
{
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_UNIX_TIME*4) =
			*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_UNIX_TIME*4) = param0;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_EDGE_FLAGS*4) =
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_EDGE_FLAGS*4) = BIT_FC_SET_UNIX_TIME;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_EDGE_FLAGS*4) =
		*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_EDGE_FLAGS*4) = 0;

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

void* Get_ZYNQ_PACKET()
{
	return &zynqPacket;
}


void PrintFirstElementsL2(int section)
{
//	int i;
//	Xil_DCacheInvalidateRange((INTPTR)&DataDMA__L2[0][section][0], 2304*4);
//	for(i=0;i<2304;i++)
//	{
//		xil_printf("DataDMA__L2[0][0][%d]=0x%06x\n\r", i, DataDMA__L2[0][section][i]);
//	}
}

void PrintFirstElementsL1(int num)
{
	int i;
	static int alt_buffer = 0;
	Xil_DCacheInvalidateRange((INTPTR)&DataDMA_D2[num][0][0], 2304*sizeof(u16));
	for(i=0;i<2304;i++)
	{
		if(i%16 == 0) xil_printf("\n\r%04d: ", i);
		xil_printf("%02x  ", DataDMA_D2[num][0][i]);
	}
	alt_buffer++;
}

void memcpy_invalidate(void* p_dst, void* p_src, u32 len_bytes)
{
	Xil_DCacheInvalidateRange(p_src, len_bytes);
	memcpy(p_dst, p_src, len_bytes);
}

// returns 1 is all zeros, 0 otherwise
u32 CheckZeros(u8* p, u32 len_bytes)
{
	int i; u32 ret;
	for(i=0;i<len_bytes;i++)
		ret |= !(p[i] == 0);
	return !ret;
}

void CopyEventData_trig()
{
	int i;
	u32 gtu_addr, gtu_addr_cross, gtu_n_cross_l, gtu_n_cross_r;
	u32 alt_trig_buffer;
	print("c");
	//xil_printf("CopyEventData_trig: prev_alt_buffer=%d", prev_alt_buffer);
	//copy D1
	for(i=0;i<N1;i++)
	{
		// copy the metadata to zynqPacket
		zynqPacket.level1_data[i].payload.trig_type = triggerInfoD1[prev_alt_buffer][i].trigger_type;
		zynqPacket.level1_data[i].payload.ts.n_gtu = triggerInfoD1[prev_alt_buffer][i].n_gtu;
		zynqPacket.level1_data[i].payload.ts.unix_time = triggerInfoD1[prev_alt_buffer][i].unix_timestamp;

		/*
		 * If the data around trigger is not edge crossed by DMA page. In this case one pass copy is used.
		 */

		memcpy_invalidate(&zynqPacket.level1_data[i].payload.raw_data[0][0],
				&DataDMA_D1[prev_alt_buffer%2][i][0][0],
				N_OF_PIXEL_PER_PDM * N_OF_FRAMES_L1_V0);

		if(CheckZeros(&DataDMA_D1[prev_alt_buffer%2][i][0][0], N_OF_PIXEL_PER_PDM * N_OF_FRAMES_L1_V0))
			print("All zeros!\n\r");


		//xil_printf("--- i=%d gtu_addr=%d prev_alt_buffer=%d\n\r", i, gtu_addr, prev_alt_buffer);
		// Mark the trigger as copied (sent)
		triggerInfoD1[prev_alt_buffer][i].is_sent = 1;
	}
	//copy D2
	for(i=0;i<N2;i++)
	{
		zynqPacket.level2_data[i].payload.trig_type = triggerInfoD2[prev_alt_buffer][i].trigger_type;
		zynqPacket.level2_data[i].payload.ts.n_gtu = triggerInfoD2[prev_alt_buffer][i].n_gtu;
		zynqPacket.level2_data[i].payload.ts.unix_time = triggerInfoD2[prev_alt_buffer][i].unix_timestamp;
		memcpy(&zynqPacket.level2_data[i].payload.int16_data[0][0],
				//&DataDMA_D2[i][0][0],
				&Data_L2[prev_alt_buffer][i][0],
				N_OF_PIXEL_PER_PDM * N_OF_FRAMES_L1_V0*sizeof(uint16_t));
		// Mark the trigger as copied (sent)
		triggerInfoD2[prev_alt_buffer][i].is_sent = 1;
		//xil_printf("tt=%d.", zynqPacket.level2_data[i].payload.trig_type);
	}
	//copy D3
	for(i=0;i<N3;i++)
	{
		zynqPacket.level3_data[i].payload.trig_type = triggerInfoD3[prev_alt_buffer][i].trigger_type;
		zynqPacket.level3_data[i].payload.ts.n_gtu = triggerInfoD3[prev_alt_buffer][i].n_gtu;
		zynqPacket.level3_data[i].payload.ts.unix_time = triggerInfoD3[prev_alt_buffer][i].unix_timestamp;
		memcpy_invalidate(&zynqPacket.level3_data[i].payload.int32_data[0][0],
				&DataDMA_D3[prev_alt_buffer%2][0][0],
				N_OF_PIXEL_PER_PDM * N_OF_FRAMES_L1_V0*sizeof(uint32_t));
		// Mark the trigger as copied (sent)
		triggerInfoD3[prev_alt_buffer][i].is_sent = 1;
	}
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

void DmaResetN(int n) // 1 - D1, 2 - D2, 3 - D3
{
	if(n == 1)
		XAxiDma_Reset(&dma_d1);
	else if(n == 2)
		XAxiDma_Reset(&dma_d2);
	else if(n == 3)
		XAxiDma_Reset(&dma_d3);
}


void DmaStart(XAxiDma* pdma, UINTPTR addr, u32 length, u8 is_intr)
{
	u32 ret;
	if(is_intr) XAxiDma_IntrEnable(pdma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	ret=XAxiDma_SimpleTransfer(pdma, addr, length, XAXIDMA_DEVICE_TO_DMA); // in bytes
	if(ret != XST_SUCCESS)
	{
		//DmaReset(pdma);
		xil_printf("XAxiDma_SimpleTransfer returns %d! Reset DMA\n\r", ret);
	}
}



void DmaStartN(int n_dma, int n_trig_buffer) //1 - D1, 2 - D2, 3 - D3
{
	if(n_dma == 1)
		DmaStart(&dma_d1, (UINTPTR)&DataDMA_D1[current_alt_buffer][n_trig_buffer][0][0], 1 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_D1, 0);
	else if(n_dma == 2)
		DmaStart(&dma_d2, (UINTPTR)&DataDMA_D2[n_trig_buffer][0][0], 2 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_D2, 1);
	else if(n_dma == 3)
		DmaStart(&dma_d3, (UINTPTR)&DataDMA_D3[current_alt_buffer][n_trig_buffer][0][0], 4 * N_OF_PIXEL_PER_PDM * N_FRAMES_DMA_D3, 1);
}



void RxIntrHandler_L1(XAxiDma *AxiDmaInst)
{
	u32 IrqStatus;

	if(current_trigbuf_d1 < N1)
	{
		triggerInfoD1[current_alt_buffer][current_trigbuf_d1].is_sent = 0;
		triggerInfoD1[current_alt_buffer][current_trigbuf_d1].is_dma_error = IsD1DMA_error();
		triggerInfoD1[current_alt_buffer][current_trigbuf_d1].n_gtu = GetTrigNGTU_L1();
		triggerInfoD1[current_alt_buffer][current_trigbuf_d1].trigger_type = GetTrigType_L1();
		triggerInfoD1[current_alt_buffer][current_trigbuf_d1].unix_timestamp = GetUnixTimestamp_L1();
		triggerInfoD1[current_alt_buffer][current_trigbuf_d1].n_intr = dma_intr_counter_d1;
		// Change current trigger buffer to the next one

	}
	current_trigbuf_d1++;

	xil_printf("=%d", current_trigbuf_d1);

	trig_counter__l1++;

	dma_intr_counter_d1++;

	D1_release();

	DmaStartN(1, current_trigbuf_d1);

	return;
}

void L1_trigger_service()
{
	if(IsD1Triggered())
		RxIntrHandler_L1(&dma_d1);
}

static void RxIntrHandler_D2(void *Callback)
{


	u32 IrqStatus;
	//int TimeOut;
	XAxiDma *AxiDmaInst = (XAxiDma *)Callback;

	/* Read pending interrupts */
	IrqStatus = XAxiDma_IntrGetIrq(AxiDmaInst, XAXIDMA_DEVICE_TO_DMA);

	/* Acknowledge pending interrupts */
	XAxiDma_IntrAckIrq(AxiDmaInst, IrqStatus, XAXIDMA_DEVICE_TO_DMA);

	DmaReset(AxiDmaInst);
	// check whether trigger

	//Xil_DCacheInvalidateRange(&DataDMA_D2[dma_intr_counter_d2%N_TRIG_BUFFERS_DMA_D2][0][0], 16);
	//xil_printf("[%d]", DataDMA_D2[dma_intr_counter_d2%N_TRIG_BUFFERS_DMA_D2][0][0]);

	dma_intr_counter_d2++;

	DmaStartN(2, dma_intr_counter_d2%N_TRIG_BUFFERS_DMA_D2);

	FlowControlClrIntr_D2();	//print("y");




	return;

}

void L2_trigger_service()
{
	u32 addr_gtu, trig_gtu;
	switch(l2_sm_state)
	{
		case l2_sm_idle:
			if(CheckTrigger_L2())
			{
				//print("L2 trigger!\n\r");
				if(trig_counter__l2 < N2)
				{
					triggerInfoD2[current_alt_buffer][trig_counter__l2].is_sent = 0;
					triggerInfoD2[current_alt_buffer][trig_counter__l2].n_gtu = GetTrigNGTU_L2();
					triggerInfoD2[current_alt_buffer][trig_counter__l2].trigger_type = GetTrigType_L2();
					triggerInfoD2[current_alt_buffer][trig_counter__l2].unix_timestamp = GetUnixTimestamp_L2();

				}
				l2_sm_state = l2_sm_cought;
			}
			break;
		case l2_sm_cought:
			l2_sm_state = l2_sm_timer;
			break;
		case l2_sm_timer: // in order to do not copy data from a region under DMA transfer
			if(GetNGTU() - GetTrigNGTU_L2() > N_FRAMES_DMA_D2)
				l2_sm_state = l2_sm_copying;
			break;
		case l2_sm_copying:
			trig_gtu = GetTrigNGTU_L2();
			addr_gtu = (trig_gtu/128) % (N_TRIG_BUFFERS_DMA_D2*N_FRAMES_DMA_D2) - N_OF_FRAMES_L2_V0/2;
			//xil_printf("=%d$%d$%d=", trig_gtu, addr_gtu, trig_counter__l2);
			if((addr_gtu < (N_TRIG_BUFFERS_DMA_D2*N_FRAMES_DMA_D2) - N_OF_FRAMES_L2_V0) && (addr_gtu > 0))
			{
				memcpy_invalidate(&Data_L2[current_alt_buffer][trig_counter__l2][0],
					&DataDMA_D2[addr_gtu/N_FRAMES_DMA_D2][addr_gtu%N_FRAMES_DMA_D2][0],
					N_OF_FRAMES_L2_V0*N_OF_PIXEL_PER_PDM*sizeof(uint16_t));
				xil_printf("[%d]", DataDMA_D2[addr_gtu/N_FRAMES_DMA_D2][addr_gtu%N_FRAMES_DMA_D2][0]);
			}
			else
			{
				print("L2 data discarded\n\r");
			}
			l2_sm_state = l2_sm_copied;
			break;
		case l2_sm_copied:
			ReleaseTrigger_L2(2);
			trig_counter__l2++;
			l2_sm_state = l2_sm_idle;
			break;
	}
}

static void RxIntrHandler_D3(void *Callback)
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
		dma_intr_counter_d3++;

		triggerInfoD3[current_alt_buffer][0].is_sent = 0;
		triggerInfoD3[current_alt_buffer][0].n_gtu = GetNGTU();
		triggerInfoD3[current_alt_buffer][0].unix_timestamp = GetUnixTime();
		triggerInfoD3[current_alt_buffer][0].trigger_type = TRIG_PERIODIC;
		// change current_alt_buffer & prev_alt_buffer
		prev_alt_buffer = current_alt_buffer;
		current_alt_buffer = dma_intr_counter_d3%2;
		// Change DMA D1 pointer to zero
		DmaReset(&dma_d1);
		DmaStartN(1, 0);
		// Restart DMA D3
		DmaReset(AxiDmaInst);
		DmaStartN(3, 0);
		current_trigbuf_d1 = 0; trig_counter__l2 = 0;
		ClearTriggerInfo(current_alt_buffer);
		ResetTriggerService_D1(); // added in v1.8.1
		ResetTriggerService_D2();
		print("z");
		buffer_D3_changed = 1;
		buffer_D3_changed2 = 1;
		return;
	}
}


int IsBufferD3Changed()
{
	if(buffer_D3_changed)
	{
		buffer_D3_changed = 0;
		return 1;
	}
	else
	{
		return 0;
	}
}

int IsBufferD3Changed2()
{
	if(buffer_D3_changed2)
	{
		buffer_D3_changed2 = 0;
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


//	XScuGic_SetPriorityTriggerType(pIntc, XPAR_FABRIC_AXI_DMA_RAW_S2MM_INTROUT_INTR,
//					0x90, 0x3);
	XScuGic_SetPriorityTriggerType(pIntc, XPAR_FABRIC_AXI_DMA_L1_S2MM_INTROUT_INTR,
					0x98, 0x3);
	XScuGic_SetPriorityTriggerType(pIntc, XPAR_FABRIC_AXI_DMA_L2_S2MM_INTROUT_INTR,
					0xA0, 0x3);

	/*
	 * Connect the interrupt handler that will be called when an
	 * interrupt occurs for the device.
	 */
	/*Result = XScuGic_Connect(pIntc, XPAR_FABRIC_AXI_DMA_RAW_S2MM_INTROUT_INTR,
				 (Xil_ExceptionHandler)RxIntrHandlerRaw, &dma_raw);
	if (Result != XST_SUCCESS) {
		print("Error XScuGic_Connect\n\r");
	}*/
	Result = XScuGic_Connect(pIntc, XPAR_FABRIC_AXI_DMA_L1_S2MM_INTROUT_INTR,
				 (Xil_ExceptionHandler)RxIntrHandler_D2, &dma_d2);
	if (Result != XST_SUCCESS) {
		print("Error XScuGic_Connect\n\r");
	}
	Result = XScuGic_Connect(pIntc, XPAR_FABRIC_AXI_DMA_L2_S2MM_INTROUT_INTR,
				 (Xil_ExceptionHandler)RxIntrHandler_D3, &dma_d3);
	if (Result != XST_SUCCESS) {
		print("Error XScuGic_Connect\n\r");
	}

	/* Enable the interrupt for the GPIO device.*/
	/*XScuGic_Enable(pIntc, XPAR_FABRIC_AXI_DMA_RAW_S2MM_INTROUT_INTR);*/
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
	memset(DataDMA_D1, 0, sizeof(DataDMA_D1));
	memset(DataDMA_D2, 0, sizeof(DataDMA_D2));
	memset(DataDMA_D3, 0, sizeof(DataDMA_D3));
	xil_printf("sizeof(DataDMA_D1)=%d\n\r", sizeof(DataDMA_D1));
	xil_printf("sizeof(DataDMA_D2)=%d\n\r", sizeof(DataDMA_D2));
	xil_printf("sizeof(DataDMA_D3)=%d\n\r", sizeof(DataDMA_D3));

	memset(&zynqPacket, 0, sizeof(zynqPacket));

	for(i=0; i<MAX_PACKETS_L1; i++)
	{
		zynqPacket.level1_data[i].zbh.header = BuildHeader(DATA_TYPE_SCI_D1, 1);
		zynqPacket.level1_data[i].zbh.payload_size = sizeof(zynqPacket.level1_data[i].payload);
	}
	for(i=0; i<MAX_PACKETS_L2; i++)
	{
		zynqPacket.level2_data[i].zbh.header = BuildHeader(DATA_TYPE_SCI_D2, 1);
		zynqPacket.level2_data[i].zbh.payload_size = sizeof(zynqPacket.level2_data[i].payload);
	}
	zynqPacket.level3_data[0].zbh.header = BuildHeader(DATA_TYPE_SCI_D3, 1);
	zynqPacket.level3_data[0].zbh.payload_size = sizeof(zynqPacket.level3_data[0].payload);


	XStatus status = 0;
	XAxiDma_Config *CfgPtr;
	CfgPtr_d1 = XAxiDma_LookupConfig(XPAR_AXI_DMA_RAW_DEVICE_ID);
	if (!CfgPtr_d1) {
		xil_printf("No config found for %d\r\n", XPAR_AXI_DMA_RAW_DEVICE_ID);
	}
	status = XAxiDma_CfgInitialize(&dma_d1, CfgPtr_d1);
	//xil_printf("dma_raw.RegBase=0x%08x\n\r", dma_raw.RegBase);
	if(status)	print("Error in XAxiDma_CfgInitialize dma_raw !\n\r");
	DmaStartN(1, 0);

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_L1_DEVICE_ID);
	status = XAxiDma_CfgInitialize(&dma_d2, CfgPtr);
	if(status)	print("Error in XAxiDma_CfgInitialize dma_l1!\n\r");
	DmaStartN(2, 0);

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_L2_DEVICE_ID);
	status = XAxiDma_CfgInitialize(&dma_d3, CfgPtr);
	if(status)	print("Error in XAxiDma_CfgInitialize dma_l2!\n\r");
	DmaStartN(3, 0);

//	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_TST_L1_DEVICE_ID);
//	status = XAxiDma_CfgInitialize(&data_tst_l1, CfgPtr);
//	if(status)	print("Error in XAxiDma_CfgInitialize data_tst_l1!\n\r");


}





u32 GetDMAIntrCounterN(int n) // 1 - d1, 2 - d2, 3 - d3
{
	if(n==1)
		return dma_intr_counter_d1;
	else if(n==2)
		return dma_intr_counter_d2;
	else if(n==3)
		return dma_intr_counter_d3;
	else
		return 0;
}



//void ProvideTestDataL1()
//{
//	u32 i, ret;
//	u32 tst_data_size = Get_receive_buffer_offset();
//	u32 packet_size = N_OF_PIXEL_PER_PDM/3;
//	char * addr = Get_receive_buffer();
//	for (i=0; i<tst_data_size; i+=packet_size)
//	{
//		ret=XAxiDma_SimpleTransfer(&data_tst_l1, addr + i, packet_size, XAXIDMA_DMA_TO_DEVICE);
//		if(ret) print("!");
//		while (XAxiDma_Busy(&data_tst_l1, XAXIDMA_DMA_TO_DEVICE)) {
//				/* Wait */
//		}
//
//		//print("*-------->");
//	}
//}

//////////////////////
/// S-CURVE
//////////////////////

static void delay(int time)
{
	int i;
	for(i=0;i<70000*time;i++); // 100 thousands means 1 ms
}

int StartScurveGathering(u32 start_dac_value, u32 step_dac_value, u32 stop_dac_value, u32 accumulation)
{
	if (sCurveStruct.is_scurve_being_gathered) return ERR_SCURVE_IS_BEING_GATHERED;
	sCurveStruct.accumulation = accumulation;
	sCurveStruct.current_dac_value = start_dac_value;
	sCurveStruct.is_scurve_being_gathered = 1;
	sCurveStruct.step_dac_value = step_dac_value;
	sCurveStruct.start_dac_value = start_dac_value;
	sCurveStruct.stop_dac_value = stop_dac_value;
	sCurveStruct.scurve_counter = 0;
	memset(&scurvePacket.payload, 0xFF, sizeof(scurvePacket.payload));
	memset(&scurvePacket4MatLab, 0, sizeof(scurvePacket4MatLab));
	// set instrument mode in cores to zero (just 'started')
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D1_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED;
	*(u32*)(XPAR_AXIS_FLOW_CONTROL_D2_BASEADDR + REGW_FLAGS*4) = BIT_FC_IS_STARTED;
	scurve_memcpy_pos = 0;

	return ERR_OK;
}

SCurveStruct* GetSCurveStruct()
{
	return &sCurveStruct;
}



void ScurveService()
{
	char filename_str[20];int i;
	static u32 scurve_filename_counter = 0;
	if(sCurveStruct.is_scurve_being_gathered)
	{
		LoadSameDataToSlowControl2(sCurveStruct.current_dac_value);
		delay(5);
		//start acquisition for 128*128 GTUs
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N_OF_FRAMES_RAW_POLY_V0*N_OF_FRAMES_INT16_POLY_V0;
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
		*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
//		//TODO !!! большой костыль !!! Почему-то нужно дополнительно выдавать N_OF_FRAMES_RAW_POLY_V0 данных. Непонятно, почему...
//		if(sCurveStruct.scurve_counter == 0)
//		{
//			//wait for data_provider to be in idle_state
//			for(i=0;i<10000000;i++)
//				if(!(*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGR_STATUS) & 0x00000007))
//					break;
//			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_NFRAMES) = N_OF_FRAMES_RAW_POLY_V0;
//			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = (1<<CMD_START_BIT_OFFSET);
//			*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGW_CTRL) = 0;
//		}
		//wait for data_provider to be in idle_state
		for(i=0;i<10000000;i++)
			if(!(*(u32*)(XPAR_AXI_DATA_PROVIDER_0_BASEADDR + 4*REGR_STATUS) & 0x00000007))
				break;
		if(i==10000000)
			print("Data_provider is stalled\n\r");
		delay(50);
		//Print in order to delay for a short time
		print("-->");
		// Copying data to
		if((sCurveStruct.scurve_counter+1)%128 == 0)
		{
			xil_printf("\n\rCopying data to the scurve array to pos. %d. current_alt_buffer=%d\n\r", scurve_memcpy_pos, current_alt_buffer);
			//Invalidate DCache Range
			Xil_DCacheInvalidateRange((INTPTR)&DataDMA_D3[!current_alt_buffer][0][0][0], sizeof(DataDMA_D3));
			//now we are expecting 1 double integrated GTU in L3 array
			if(sCurveStruct.step_dac_value == 1)
			{
				memcpy(&scurvePacket.payload.int32_data[scurve_memcpy_pos][0],
						&DataDMA_D3[!current_alt_buffer][0][0][0],
						sizeof(uint32_t)*N_OF_PIXEL_PER_PDM*N_FRAMES_DMA_D3);
			}
			else if(sCurveStruct.step_dac_value == 8)
			{
				for(i=0;i<N_FRAMES_DMA_D3;i++)
					memcpy(&scurvePacket.payload.int32_data[scurve_memcpy_pos+sCurveStruct.step_dac_value*i][0],
						&DataDMA_D3[!current_alt_buffer][0][i][0],
						sizeof(uint32_t)*N_OF_PIXEL_PER_PDM);
			}
			scurve_memcpy_pos += N_FRAMES_DMA_D3;
		}
		sCurveStruct.current_dac_value += sCurveStruct.step_dac_value;
		sCurveStruct.scurve_counter++;
		if(sCurveStruct.current_dac_value > sCurveStruct.stop_dac_value)
		{
			xil_printf("Stop gathering S-Curve. current_dac_value=%d\n\r", sCurveStruct.current_dac_value);
			sCurveStruct.is_scurve_being_gathered = 0;
			sprintf(filename_str, FILENAME_SCURVE, scurve_filename_counter++);
			//SendSpectrum2FTP((char*)&scurvePacket, sizeof(Z_DATA_TYPE_SCURVE_V1), filename_str);
			CreateFile(filename_str, (char*)&scurvePacket, sizeof(Z_DATA_TYPE_SCURVE_V1), 0, file_regular);
		}
	}
}


void ScurveDataInit()
{
	scurvePacket.zbh.header = BuildHeader(DATA_TYPE_SCURVE, 1);
	scurvePacket.zbh.payload_size = sizeof(DATA_TYPE_SCURVE_V1);
	memset(&sCurveStruct, 0, sizeof(sCurveStruct));
}

