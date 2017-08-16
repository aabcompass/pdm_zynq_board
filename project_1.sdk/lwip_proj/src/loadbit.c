/*
 * loadbit.c
 *
 *  Created on: 13 ��� 2016 �.
 *      Author: XILINX
 */


#include "xparameters.h"
#include "xspi.h"

XSpi spi;
u8 * bitstream;
int bitsize;

#define REG_OUTDATA 	0
#define REG_TRIDATA		1
#define REG_INDATA		3

#define BIT_PROGRAMB	0
#define BIT_INITB		1
#define BIT_DONE		2

#define LINE_ACTIVE		1

void PrepareArtixConfiguration()
{
	*(u32*)(XPAR_AXI_ARTIX_CONF_V1_0_0_BASEADDR + 4*REG_OUTDATA) = 0;
	*(u32*)(XPAR_AXI_ARTIX_CONF_V1_0_0_BASEADDR + 4*REG_TRIDATA) = 0;
}

void StartArtixConfiguration()
{
	*(u32*)(XPAR_AXI_ARTIX_CONF_V1_0_0_BASEADDR + 4*REG_TRIDATA) = (LINE_ACTIVE<<BIT_PROGRAMB);
	*(u32*)(XPAR_AXI_ARTIX_CONF_V1_0_0_BASEADDR + 4*REG_TRIDATA) = (LINE_ACTIVE<<BIT_PROGRAMB) | (LINE_ACTIVE<<BIT_INITB);
	*(u32*)(XPAR_AXI_ARTIX_CONF_V1_0_0_BASEADDR + 4*REG_TRIDATA) = (LINE_ACTIVE<<BIT_INITB);
	*(u32*)(XPAR_AXI_ARTIX_CONF_V1_0_0_BASEADDR + 4*REG_TRIDATA) = 0;
}

void init_loadbit_spi()
{
	XStatus Status;
	XSpi_Initialize(&spi, XPAR_AXI_QUAD_SPI_0_DEVICE_ID);

	Status = XSpi_SetOptions(&spi, XSP_MASTER_OPTION);
	if (Status != XST_SUCCESS) {
		xil_printf("XSpi_SetOptions returns %d\n\r", Status);
		return;
	}
	XSpi_SetSlaveSelect(&spi, 1);
	XSpi_Start(&spi);
	XSpi_IntrGlobalDisable(&spi);
}

void upload_bit()
{
	int ret;
	print("Start transfer...\n\r");
	ret = XSpi_Transfer(&spi, bitstream, NULL, bitsize);
	xil_printf("XSpi_Transfer returns %d\n\r", ret);
}


void reset_spi()
{
	XSpi_Reset(&spi);
	init_loadbit_spi();
}

u8* SetBitstreamPtr(char* ptr, int size)
{
	bitstream = ptr;
	bitsize = size;
}

u32 GetArtixLoadState()
{
	return *(u32*)(XPAR_AXI_ARTIX_CONF_V1_0_0_BASEADDR + 4*REG_INDATA);
}
