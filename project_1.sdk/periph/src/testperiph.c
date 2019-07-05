/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "scugic_header.h"
#include "axidma_header.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "xspi.h"
#include "spi_header.h"
#include "xdevcfg.h"
#include "devcfg_header.h"
#include "xdmaps.h"
#include "dmaps_header.h"
#include "xemacps.h"
#include "xemacps_example.h"
#include "emacps_header.h"
#include "xqspips.h"
#include "qspips_header.h"
#include "xscutimer.h"
#include "scutimer_header.h"
#include "xscuwdt.h"
#include "scuwdt_header.h"
#include "xuartps.h"
#include "uartps_header.h"
#include "uartps_intr_header.h"
int main() 
{
   static XScuGic intc;
   static XEmacPs ps7_ethernet_0;
   static XScuTimer ps7_scutimer_0;
   static XScuWdt ps7_scuwdt_0;
   static XUartPs ps7_uart_1;
   Xil_ICacheEnable();
   Xil_DCacheEnable();
   print("---Entering main---\n\r");
   

	   {
	      int Status;

	      print("\r\n Running ScuGicSelfTestExample() for ps7_scugic_0...\r\n");

	      Status = ScuGicSelfTestExample(XPAR_PS7_SCUGIC_0_DEVICE_ID);

	      if (Status == 0) {
	         print("ScuGicSelfTestExample PASSED\r\n");
	      }
	      else {
	         print("ScuGicSelfTestExample FAILED\r\n");
	      }
	   }

	   {
	       int Status;

	       Status = ScuGicInterruptSetup(&intc, XPAR_PS7_SCUGIC_0_DEVICE_ID);
	       if (Status == 0) {
	          print("ScuGic Interrupt Setup PASSED\r\n");
	       }
	       else {
	         print("ScuGic Interrupt Setup FAILED\r\n");
	      }
	   }
   

   {
      int status;


      print("\r\n Running AxiDMASelfTestExample() for axi_dma_L2...\r\n");

      status = AxiDMASelfTestExample(XPAR_AXI_DMA_L2_DEVICE_ID);

      if (status == 0) {
         print("AxiDMASelfTestExample PASSED\r\n");
      }
      else {
         print("AxiDMASelfTestExample FAILED\r\n");
      }
   }
   

   {
      int status;


      print("\r\n Running AxiDMASelfTestExample() for axi_dma_raw...\r\n");

      status = AxiDMASelfTestExample(XPAR_AXI_DMA_RAW_DEVICE_ID);

      if (status == 0) {
         print("AxiDMASelfTestExample PASSED\r\n");
      }
      else {
         print("AxiDMASelfTestExample FAILED\r\n");
      }
   }
   

   {
      u32 status;
      
      print("\r\nRunning GpioInputExample() for axi_gpio_0...\r\n");

      u32 DataRead;
      
      status = GpioInputExample(XPAR_AXI_GPIO_0_DEVICE_ID, &DataRead);
      
      if (status == 0) {
         xil_printf("GpioInputExample PASSED. Read data:0x%X\r\n", DataRead);
      }
      else {
         print("GpioInputExample FAILED.\r\n");
      }
   }
   

   {
      u32 status;
      
      print("\r\nRunning GpioOutputExample() for axi_gpio_TA_ev...\r\n");

      status = GpioOutputExample(XPAR_AXI_GPIO_TA_EV_DEVICE_ID,32);
      
      if (status == 0) {
         print("GpioOutputExample PASSED.\r\n");
      }
      else {
         print("GpioOutputExample FAILED.\r\n");
      }
   }
   

   {
      XStatus status;
      
      print("\r\n Runnning SpiSelfTestExample() for axi_quad_spi_0...\r\n");
      
      status = SpiSelfTestExample(XPAR_AXI_QUAD_SPI_0_DEVICE_ID);
      
      if (status == 0) {
         print("SpiSelfTestExample PASSED\r\n");
      }
      else {
         print("SpiSelfTestExample FAILED\r\n");
      }
   }
   

   {
      int Status;

      print("\r\n Running DcfgSelfTestExample() for ps7_dev_cfg_0...\r\n");

      Status = DcfgSelfTestExample(XPAR_PS7_DEV_CFG_0_DEVICE_ID);

      if (Status == 0) {
         print("DcfgSelfTestExample PASSED\r\n");
      }
      else {
         print("DcfgSelfTestExample FAILED\r\n");
      }
   }
   

   {
      int Status;
      
      print("\r\n Running XDmaPs_Example_W_Intr() for ps7_dma_s...\r\n");
      
      Status = XDmaPs_Example_W_Intr(&intc,XPAR_PS7_DMA_S_DEVICE_ID);
      
      if (Status == 0) {
         print("XDmaPs_Example_W_Intr PASSED\r\n");
      }
      else {
         print("XDmaPs_Example_W_Intr FAILED\r\n");
      }
   }
   
   {
      int Status;

      print("\r\n Running Interrupt Test  for ps7_ethernet_0...\r\n");

      Status = EmacPsDmaIntrExample(&intc, &ps7_ethernet_0, \
                                 XPAR_PS7_ETHERNET_0_DEVICE_ID, \
                                 XPAR_PS7_ETHERNET_0_INTR);

      if (Status == 0) {
         print("EmacPsDmaIntrExample PASSED\r\n");
      }
      else {
         print("EmacPsDmaIntrExample FAILED\r\n");
      }

   }
   

   {
      int Status;

      print("\r\n Running QspiSelfTestExample() for ps7_qspi_0...\r\n");

      Status = QspiPsSelfTestExample(XPAR_PS7_QSPI_0_DEVICE_ID);

      if (Status == 0) {
         print("QspiPsSelfTestExample PASSED\r\n");
      }
      else {
         print("QspiPsSelfTestExample FAILED\r\n");
      }
   }
   

   {
      int status;


      print("\r\n Running AxiDMASelfTestExample() for axi_dma_L1...\r\n");

      status = AxiDMASelfTestExample(XPAR_AXI_DMA_L1_DEVICE_ID);

      if (status == 0) {
         print("AxiDMASelfTestExample PASSED\r\n");
      }
      else {
         print("AxiDMASelfTestExample FAILED\r\n");
      }
   }
   

   {
      int Status;

      print("\r\n Running ScuTimerPolledExample() for ps7_scutimer_0...\r\n");

      Status = ScuTimerPolledExample(XPAR_PS7_SCUTIMER_0_DEVICE_ID);

      if (Status == 0) {
         print("ScuTimerPolledExample PASSED\r\n");
      }
      else {
         print("ScuTimerPolledExample FAILED\r\n");
      }
   }
   {
      int Status;

      print("\r\n Running Interrupt Test  for ps7_scutimer_0...\r\n");

      Status = ScuTimerIntrExample(&intc, &ps7_scutimer_0, \
                                 XPAR_PS7_SCUTIMER_0_DEVICE_ID, \
                                 XPAR_PS7_SCUTIMER_0_INTR);

      if (Status == 0) {
         print("ScuTimerIntrExample PASSED\r\n");
      }
      else {
         print("ScuTimerIntrExample FAILED\r\n");
      }

   }
   
   {
      int Status;

      print("\r\n Running Interrupt Test  for ps7_scuwdt_0...\r\n");

      Status = ScuWdtIntrExample(&intc, &ps7_scuwdt_0, \
                                 XPAR_PS7_SCUWDT_0_DEVICE_ID, \
                                 XPAR_PS7_SCUWDT_0_INTR);

      if (Status == 0) {
         print("ScuWdtIntrExample PASSED\r\n");
      }
      else {
         print("ScuWdtIntrExample FAILED\r\n");
      }

   }
   
   /*
    * Peripheral Test will not be run for ps7_uart_0
    * because it has been selected as the STDOUT device
    */

   

   {
      int Status;

      print("\r\nRunning UartPsPolledExample() for ps7_uart_1...\r\n");
      Status = UartPsPolledExample(XPAR_PS7_UART_1_DEVICE_ID);
      if (Status == 0) {
         print("UartPsPolledExample PASSED\r\n");
      }
      else {
         print("UartPsPolledExample FAILED\r\n");
      }
   }
   {
      int Status;

      print("\r\n Running Interrupt Test for ps7_uart_1...\r\n");

      Status = UartPsIntrExample(&intc, &ps7_uart_1, \
                                  XPAR_PS7_UART_1_DEVICE_ID, \
                                  XPAR_PS7_UART_1_INTR);

      if (Status == 0) {
         print("UartPsIntrExample PASSED\r\n");
      }
      else {
         print("UartPsIntrExample FAILED\r\n");
      }

   }
   print("---Exiting main---\n\r");
   Xil_DCacheDisable();
   Xil_ICacheDisable();
   return 0;
}
