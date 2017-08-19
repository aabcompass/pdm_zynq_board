/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
* some change for git test
git change 5
******************************************************************************/

#include <stdio.h>

#include "xparameters.h"

#include "netif/xadapter.h"

#include "platform.h"
#include "platform_config.h"
#if defined (__arm__) || defined(__aarch64__)
#include "xil_printf.h"
#endif

#include "lwip/tcp.h"
#include "xil_cache.h"

#if LWIP_DHCP==1
#include "lwip/dhcp.h"
#endif

#include "xuartps_hw.h"

#include "axi_spectral_core.h"
#include "swap.h"
#include "xllfifo.h"

#include "hv.h"

//Z_DATA_TYPE_SCI_POLY_V4 packet_sci_poly __attribute__ ((aligned (256)));
InstrumentState instrumentState;
SystemSettings systemSettings;
SCurveStruct sCurveStruct;


/* defined by each RAW mode application */
void print_app_header();
int start_application();
int transfer_data();
void tcp_fasttmr(void);
void tcp_slowtmr(void);

/* missing declaration in lwIP */
void lwip_init();

#if LWIP_DHCP==1
extern volatile int dhcp_timoutcntr;
err_t dhcp_start(struct netif *netif);
#endif

extern volatile int TcpFastTmrFlag;
extern volatile int TcpSlowTmrFlag;
static struct netif server_netif;
struct netif *echo_netif;



void
print_ip(char *msg, struct ip_addr *ip) 
{
	print(msg);
	xil_printf("%d.%d.%d.%d\n\r", ip4_addr1(ip), ip4_addr2(ip), 
			ip4_addr3(ip), ip4_addr4(ip));
}

void
print_ip_settings(struct ip_addr *ip, struct ip_addr *mask, struct ip_addr *gw)
{

	print_ip("Board IP: ", ip);
	print_ip("Netmask : ", mask);
	print_ip("Gateway : ", gw);
}

#if defined (__arm__) || defined(__aarch64__)
#if XPAR_GIGE_PCS_PMA_SGMII_CORE_PRESENT == 1 || XPAR_GIGE_PCS_PMA_1000BASEX_CORE_PRESENT == 1
int ProgramSi5324(void);
int ProgramSfpPhy(void);
#endif
#endif



int LoadArtix()
{
	int err;
	char artixBitstream[10000000]; // 10 MBytes
	int artixBitstream_size;
	print("Loading bitstream to the cross board\n\r");
	PrepareArtixConfiguration();
	err = ReadArtixBitstream(&artixBitstream, &artixBitstream_size);
	if(!err) {
		SetBitstreamPtr(&artixBitstream, artixBitstream_size);
		init_loadbit_spi();
		upload_bit();
		print("Cross board has been loaded\n\r");
	} else {
		print("Cross board NOT loaded\n\r");
	}
	instrumentState.artix_locked = *(u32*)(XPAR_AXI_GPIO_0_BASEADDR);
	xil_printf("artix_locked = %x\n\r", instrumentState.artix_locked);
	//FfsSdClose();
}

//int LoadSpaciroc1()
//{
//	int err, i;
//	u32 tmp_array[1000];
//	char* spacConfPtr; // 10 MBytes
//	int spacConf_size;
//	print("Loading slow control data to SPACIROCs\n\r");
//	err = ReadSpacirocConfiguration(tmp_array, &spacConf_size);
//	if(!err)
//	{
//		for(i=0;i<spacConf_size/4;i++)
//			tmp_array[i] = __bswap_constant_32(tmp_array[i]);
//		spacConfPtr = GetSpacirocConfPtr();
//		memcpy(spacConfPtr, tmp_array, spacConf_size);
//		PrintSpacirocConfVector();
//		LoadSpacirocConfigurationVector();
//		ConfigReload();
//		SpacirocReset();
//	} else {
//		print("SPACIROC slow control NOT loaded\n\r");
//	}
//
//}

int main()
{
	//while(1)
#if __aarch64__
	Xil_DCacheDisable();
#endif

	struct ip_addr ipaddr, netmask, gw;
	char c_uart[] = {0, 0};

	/* the mac address of the board. this should be unique per board */
	unsigned char mac_ethernet_address[] =
	{ 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

	echo_netif = &server_netif;
#if defined (__arm__) || defined(__aarch64__)
#if XPAR_GIGE_PCS_PMA_SGMII_CORE_PRESENT == 1 || XPAR_GIGE_PCS_PMA_1000BASEX_CORE_PRESENT == 1
	ProgramSi5324();
	ProgramSfpPhy();
#endif
#endif

	init_platform();

#if LWIP_DHCP==1
    ipaddr.addr = 0;
	gw.addr = 0;
	netmask.addr = 0;
#else
	/* initliaze IP addresses to be used */
	IP4_ADDR(&ipaddr,  192, 168,   7, 10);
	IP4_ADDR(&netmask, 255, 255, 255,  0);
	IP4_ADDR(&gw,      192, 168,   7,  254);
#endif	

	print("Starting TCP/IP stack...\n\r");
	lwip_init();

	//low_level_init(echo_netif);

  	/* Add network interface to the netif_list, and set it as default */
	if (!xemac_add(echo_netif, &ipaddr, &netmask,
						&gw, mac_ethernet_address,
						PLATFORM_EMAC_BASEADDR)) {
		xil_printf("Error adding N/W interface\n\r");
		return -1;
	}
	netif_set_default(echo_netif);

	/* now enable interrupts */
	platform_enable_interrupts();

	/* specify that the network if is up */
	netif_set_up(echo_netif);

	SetDefaultParameters();
	//print("Starting interrupt controller...\n\r");
	//SetupIntrSystem();
	print("HVPS expander initialization...\n\r");
	expIni(); //init hv
	print("SD card file system initialization...\n\r");
	FfsSdPolledInit();
	print("SPACIROC FIFO initialization...\n\r");
	XLlFifoPollingInit();
	LoadArtix();
	//instrumentState.artix_locked = 7;
	//xil_printf("artix_locked is forced to %d due to testing!\n\r", instrumentState.artix_locked);
	print("Reset SPACIROCs...\n\r");
	ResetSPACIROC3();
	print("Starting TCP client on port 50001 (unused)...\n\r");
	start_application();
	print("HLS peripherals initialization...\n\r");
	InitHLS_peripherals();
//	//start_updatefw();
	print("Starting TCP client Telnet server on port 23 ...\n\r");
	start_telnet_cmd();
	print("Starting FTP client ...\n\r");
	StartFTP_data();
	StartFTP_config();
	print("Switch initialization...\n\r");
	AXISSW_conf();
	print("Flow control initialization...\n\r");
	FlowControlInit();
	print("Starting test data provider\n\r");
	start_test_data_provider();
	print("DMA initialization...\n\r");
	DMA_init();
	print("Event FIFO initialization...\n\r");
	XLlFifoEventsInit();

	/* receive and process packets */
	while (1) {

		if (TcpFastTmrFlag) {
			tcp_fasttmr();
			TcpFastTmrFlag = 0;
		}
		if (TcpSlowTmrFlag) {
			tcp_slowtmr();
			TcpSlowTmrFlag = 0;
		}
		xemacif_input(echo_netif);
		transfer_data();
		ftp_data_sm();
		ftp_config_sm();
		TriggerService();
		//xil_printf("Intr: %d\n\r", *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR));
		//HVInterruptService();
		if(XUartPs_IsReceiveData(XPAR_PS7_UART_0_BASEADDR/*STDOUT_BASEADDRESS*/))
		{
			c_uart[0] = XUartPs_RecvByte (XPAR_PS7_UART_0_BASEADDR/*STDOUT_BASEADDRESS*/);
			print(c_uart);
			ProcessUartCommands(echo_netif, c_uart[0]);
		}
	}
  
	/* never reached */
	cleanup_platform();

	return 0;
}
