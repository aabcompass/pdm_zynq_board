/*
 * Copyright (c) 2007 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include <stdio.h>
#include <string.h>

#include "lwip/err.h"
#include "lwip/tcp.h"
#ifdef __arm__
#include "xil_printf.h"
#endif

#include "xaxidma_hw.h"
#include "pdmdata_hw.h"

static unsigned rxperf_port = 5001;	/* iperf default port */
static unsigned rxperf_server_running = 0;

//static char * receive_buffer;
static u32 receive_buffer_offset = 0;

//#define DMA_TRIGGER_TEST	XPAR_HIER_INT_AXI_DMA_TST_BASEADDR


char test_data[DMA_TST_BUF_SIZE] __attribute__ ((aligned (64)));

void TestData_DMA_init()
{
	print("Starting Trigger Test DMA\n\r");
//	*(u32*)(DMA_TRIGGER_TEST + XAXIDMA_TX_OFFSET + XAXIDMA_CR_OFFSET) |= XAXIDMA_CR_RUNSTOP_MASK;
//	*(u32*)(DMA_TRIGGER_TEST + XAXIDMA_TX_OFFSET + XAXIDMA_SRCADDR_OFFSET) = (UINTPTR)TRIGGER_TEST_DATA_BASE;
}

void ProvideTestData()
{
//	*(u32*)(DMA_TRIGGER_TEST + XAXIDMA_TX_OFFSET + XAXIDMA_BUFFLEN_OFFSET) = receive_buffer_offset;
	receive_buffer_offset = 0;
}

u32 TestData_GetStatus()
{
//	return *(u32*)(DMA_TRIGGER_TEST + XAXIDMA_TX_OFFSET + XAXIDMA_SR_OFFSET);
}

static err_t
test_data_provider_recv_callback(void *arg, struct tcp_pcb *tpcb, struct pbuf *p, err_t err)
{
    /* close socket if the peer has sent the FIN packet  */
    if (p == NULL) {
        tcp_close(tpcb);
        return ERR_OK;
    }

	memcpy(test_data+receive_buffer_offset, p->payload, p->len);
	receive_buffer_offset += p->len;
	print(".");

    /* all we do is say we've received the packet */

    /* we don't actually make use of it */
	//print("1111");
    tcp_recved(tpcb, p->tot_len);
	//print("2222");

    pbuf_free(p);
	//print("3333");
    return ERR_OK;
}

err_t
test_data_provider_accept_callback(void *arg, struct tcp_pcb *newpcb, err_t err)
{
    xil_printf("rxperf: Connection Accepted\r\n");
    tcp_recv(newpcb, test_data_provider_recv_callback);
    receive_buffer_offset = 0;
    return ERR_OK;
}

int
start_test_data_provider()
{
    struct tcp_pcb *pcb;
    err_t err;

    /* create new TCP PCB structure */
    pcb = tcp_new();
    if (!pcb) {
    	xil_printf("rxperf: Error creating PCB. Out of Memory\r\n");
    	return -1;
    }

    /* bind to iperf @port */
    err = tcp_bind(pcb, IP_ADDR_ANY, rxperf_port);
    if (err != ERR_OK) {
    	xil_printf("rxperf: Unable to bind to port %d: err = %d\r\n", rxperf_port, err);
    	return -2;
    }

    /* we do not need any arguments to callback functions :) */
    tcp_arg(pcb, NULL);

    /* listen for connections */
    pcb = tcp_listen(pcb);
    if (!pcb) {
    	xil_printf("rxperf: Out of memory while tcp_listen\r\n");
    	return -3;
    }

    /* specify callback to use for incoming connections */
    tcp_accept(pcb, test_data_provider_accept_callback);

    rxperf_server_running = 1;

    //receive_buffer = TRIGGER_TEST_DATA_BASE;
    print("Test data provider has been started on TCP port 5001\n\r");
    return 0;
}

u32 Get_receive_buffer_offset()
{
	return receive_buffer_offset;
}

char* Get_receive_buffer()
{
	return test_data;
}
