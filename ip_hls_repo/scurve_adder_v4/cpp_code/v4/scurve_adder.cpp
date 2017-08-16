/*
Scurve adder IP April 2017
Francesca Capel
capel.francesca@gmail.com

Version 4
---------
Scurve adder IP for the Mini-EUSO instrument. Used to generate S-curves on chip to reduce file size and data processing.
Takes 6 x 16-bit input stream (2 8-bit pixels) and outputs a 32-bit stream (2 16-bit pixels).
Number of iterations is controlled by the input port N (AXI4Lite slave).
Channels are output sequentially and the number of channels processed can be specified on the input port CH_INFO (AXI4Lite slave)
	//Decision on which channels to process:
	//'111111' -> 0x3F all channels
	//'001111' -> 0x0F on channels #2 to #5 etc.
*/

#include "scurve_adder.h"

void scurve_adder(STREAM_16 &in_stream0, STREAM_16 &in_stream1,
		STREAM_16 &in_stream2, STREAM_16 &in_stream3,
		STREAM_16 &in_stream4, STREAM_16 &in_stream5,
		STREAM_32 &out_stream, uint8_t N_ADDS, uint8_t CH_INFO) {

	//Define the interfaces
	#pragma HLS INTERFACE axis port=in_stream0
	#pragma HLS INTERFACE axis port=in_stream1
	#pragma HLS INTERFACE axis port=in_stream2
	#pragma HLS INTERFACE axis port=in_stream3
	#pragma HLS INTERFACE axis port=in_stream4
	#pragma HLS INTERFACE axis port=in_stream5
	#pragma HLS INTERFACE axis port=out_stream
	#pragma HLS INTERFACE s_axilite port=N_ADDS bundle=CTRL_BUS
	#pragma HLS INTERFACE s_axilite port=CH_INFO bundle=CTRL_BUS
	#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS

	int i, k, l;
	int N, N_check;
	uint8_t in_pix1_ch0[N_PIXELS/2], in_pix2_ch0[N_PIXELS/2];
	uint8_t in_pix1_ch1[N_PIXELS/2], in_pix2_ch1[N_PIXELS/2];
	uint8_t in_pix1_ch2[N_PIXELS/2], in_pix2_ch2[N_PIXELS/2];
	uint8_t in_pix1_ch3[N_PIXELS/2], in_pix2_ch3[N_PIXELS/2];
	uint8_t in_pix1_ch4[N_PIXELS/2], in_pix2_ch4[N_PIXELS/2];
	uint8_t in_pix1_ch5[N_PIXELS/2], in_pix2_ch5[N_PIXELS/2];

	int sum_pix1_ch0[N_PIXELS/2], sum_pix2_ch0[N_PIXELS/2];
	int sum_pix1_ch1[N_PIXELS/2], sum_pix2_ch1[N_PIXELS/2];
	int sum_pix1_ch2[N_PIXELS/2], sum_pix2_ch2[N_PIXELS/2];
	int sum_pix1_ch3[N_PIXELS/2], sum_pix2_ch3[N_PIXELS/2];
	int sum_pix1_ch4[N_PIXELS/2], sum_pix2_ch4[N_PIXELS/2];
	int sum_pix1_ch5[N_PIXELS/2], sum_pix2_ch5[N_PIXELS/2];
	 
	AXI_DATA_16 dub_pix_ch0[N_PIXELS/2];
	AXI_DATA_16 dub_pix_ch1[N_PIXELS/2];
	AXI_DATA_16 dub_pix_ch2[N_PIXELS/2];
	AXI_DATA_16 dub_pix_ch3[N_PIXELS/2];
	AXI_DATA_16 dub_pix_ch4[N_PIXELS/2];
	AXI_DATA_16 dub_pix_ch5[N_PIXELS/2];

	AXI_DATA_32 sum_pix_tot;

	//Check last channel to read out
	N = 0;
	for (l = 6 - 1; l >= 0; l--) {
		if (CHECK_BIT(CH_INFO, l)) {
			N = l;
			break;
		}
		else {
			//No channel is set
		}
	}


	//initialise sum_pix
	for (i = 0; i < N_PIXELS/2; i++) {
	#pragma HLS PIPELINE
		sum_pix1_ch0[i] = 0;
		sum_pix2_ch0[i] = 0;

		sum_pix1_ch1[i] = 0;
		sum_pix2_ch1[i] = 0;

		sum_pix1_ch2[i] = 0;
		sum_pix2_ch2[i] = 0;

		sum_pix1_ch3[i] = 0;
		sum_pix2_ch3[i] = 0;

		sum_pix1_ch4[i] = 0;
		sum_pix2_ch4[i] = 0;

		sum_pix1_ch5[i] = 0;
		sum_pix2_ch5[i] = 0;
	}

	//Read data and perform addition for N iterations
	for (k = 0; k < N_ADDS; k++) {
	  
	    //Make a loop over all pixels
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE


			//Select channels to process by checking CH_INFO
			//Read the input pixel values for 1 GTU and add to accumulator
			//Split input into 2 separate pixels
			// pixel2 | pixel1
			//Perform accumulation for each pixel

			if (CHECK_BIT(CH_INFO, 0)) {
				dub_pix_ch0[i] = in_stream0.read();
				in_pix1_ch0[i] = (dub_pix_ch0[i].data & 0xFF);
				in_pix2_ch0[i] = dub_pix_ch0[i].data  >> 8;
				sum_pix1_ch0[i] += in_pix1_ch0[i];
				sum_pix2_ch0[i] += in_pix2_ch0[i];
			}
			else {}

			if (CHECK_BIT(CH_INFO, 1)) {
				dub_pix_ch1[i] = in_stream1.read();
				in_pix1_ch1[i] = (dub_pix_ch1[i].data & 0xFF);
				in_pix2_ch1[i] = dub_pix_ch1[i].data  >> 8;
				sum_pix1_ch1[i] += in_pix1_ch1[i];
				sum_pix2_ch1[i] += in_pix2_ch1[i];
			}
			else {}

			if (CHECK_BIT(CH_INFO, 2)) {
				dub_pix_ch2[i] = in_stream2.read();
				in_pix1_ch2[i] = (dub_pix_ch2[i].data & 0xFF);
				in_pix2_ch2[i] = dub_pix_ch2[i].data  >> 8;
				sum_pix1_ch2[i] += in_pix1_ch2[i];
				sum_pix2_ch2[i] += in_pix2_ch2[i];
			}
			else {}

			if (CHECK_BIT(CH_INFO, 3)) {
				dub_pix_ch3[i] = in_stream3.read();
				in_pix1_ch3[i] = (dub_pix_ch3[i].data & 0xFF);
				in_pix2_ch3[i] = dub_pix_ch3[i].data  >> 8;
				sum_pix1_ch3[i] += in_pix1_ch3[i];
				sum_pix2_ch3[i] += in_pix2_ch3[i];
			}
			else {}

			if (CHECK_BIT(CH_INFO, 4)) {
				dub_pix_ch4[i] = in_stream4.read();
				in_pix1_ch4[i] = (dub_pix_ch4[i].data & 0xFF);
				in_pix2_ch4[i] = dub_pix_ch4[i].data  >> 8;
				sum_pix1_ch4[i] += in_pix1_ch4[i];
				sum_pix2_ch4[i] += in_pix2_ch4[i];
			}
			else {}

			if (CHECK_BIT(CH_INFO, 5)) {
			dub_pix_ch5[i] = in_stream5.read();
			in_pix1_ch5[i] = (dub_pix_ch5[i].data & 0xFF);
			in_pix2_ch5[i] = dub_pix_ch5[i].data  >> 8;
			sum_pix1_ch5[i] += in_pix1_ch5[i];
 			sum_pix2_ch5[i] += in_pix2_ch5[i];
			}
			else {}

		}
	}
	
	//Populate the output stream for processed channels only
	//TLAST signal is output for channel # = highest set bit in CH_INFO
	if (CHECK_BIT(CH_INFO, 0)) {
		N_check = 0;
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE

			sum_pix_tot.data = sum_pix2_ch0[i]<<16 | sum_pix1_ch0[i];
			sum_pix_tot.keep = 15;
			sum_pix_tot.strb = 15;
			sum_pix_tot.user = dub_pix_ch0[0].user;
			sum_pix_tot.id = dub_pix_ch0[0].id;
			sum_pix_tot.dest = dub_pix_ch0[0].dest;
			if (N_check == N) {
				if(i == N_PIXELS/2 - 1) {
					sum_pix_tot.last = 1;
				}
				else {
					sum_pix_tot.last = 0;
				}
			}
			else {
				sum_pix_tot.last = 0;
			}
			out_stream.write(sum_pix_tot);
		}
	}
	else {}

	if (CHECK_BIT(CH_INFO, 1)) {
		N_check = 1;
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			sum_pix_tot.data = sum_pix2_ch1[i]<<16 | sum_pix1_ch1[i];
			sum_pix_tot.keep = 15;
			sum_pix_tot.strb = 15;
			sum_pix_tot.user = dub_pix_ch1[0].user;
			sum_pix_tot.id = dub_pix_ch1[0].id;
			sum_pix_tot.dest = dub_pix_ch1[0].dest;
			if (N_check == N) {
				if(i == N_PIXELS/2 - 1) {
					sum_pix_tot.last = 1;
				}
				else {
					sum_pix_tot.last = 0;
				}
			}
			else {
				sum_pix_tot.last = 0;
			}
			out_stream.write(sum_pix_tot);
		}
	}
	else {}

	if (CHECK_BIT(CH_INFO, 2)) {
		N_check = 2;
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			sum_pix_tot.data = sum_pix2_ch2[i]<<16 | sum_pix1_ch2[i];
			sum_pix_tot.keep = 15;
			sum_pix_tot.strb = 15;
			sum_pix_tot.user = dub_pix_ch2[0].user;
			sum_pix_tot.id = dub_pix_ch2[0].id;
			sum_pix_tot.dest = dub_pix_ch2[0].dest;
			if (N_check == N) {
				if(i == N_PIXELS/2 - 1) {
					sum_pix_tot.last = 1;
				}
				else {
					sum_pix_tot.last = 0;
				}
			}
			else {
				sum_pix_tot.last = 0;
			}
			out_stream.write(sum_pix_tot);
		}
	}
	else {}

	if (CHECK_BIT(CH_INFO, 3)) {
		N_check = 3;
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			sum_pix_tot.data = sum_pix2_ch3[i]<<16 | sum_pix1_ch3[i];
			sum_pix_tot.keep = 15;
			sum_pix_tot.strb = 15;
			sum_pix_tot.user = dub_pix_ch3[0].user;
			sum_pix_tot.id = dub_pix_ch3[0].id;
			sum_pix_tot.dest = dub_pix_ch3[0].dest;
			if (N_check == N) {
				if(i == N_PIXELS/2 - 1) {
					sum_pix_tot.last = 1;
				}
				else {
					sum_pix_tot.last = 0;
				}
			}
			else {
				sum_pix_tot.last = 0;
			}
			out_stream.write(sum_pix_tot);
		}
	}
	else {}

	if (CHECK_BIT(CH_INFO, 4)) {
		N_check = 4;
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			sum_pix_tot.data = sum_pix2_ch4[i]<<16 | sum_pix1_ch4[i];
			sum_pix_tot.keep = 15;
			sum_pix_tot.strb = 15;
			sum_pix_tot.user = dub_pix_ch4[0].user;
			sum_pix_tot.id = dub_pix_ch4[0].id;
			sum_pix_tot.dest = dub_pix_ch4[0].dest;
			if (N_check == N) {
				if(i == N_PIXELS/2 - 1) {
					sum_pix_tot.last = 1;
				}
				else {
					sum_pix_tot.last = 0;
				}
			}
			else {
				sum_pix_tot.last = 0;
			}
			out_stream.write(sum_pix_tot);
		}
	}
	else {}


	if (CHECK_BIT(CH_INFO, 5)) {
		N_check = 5;
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			sum_pix_tot.data = sum_pix2_ch5[i]<<16 | sum_pix1_ch5[i];
			sum_pix_tot.keep = 15;
			sum_pix_tot.strb = 15;
			sum_pix_tot.user = dub_pix_ch5[0].user;
			sum_pix_tot.id = dub_pix_ch5[0].id;
			sum_pix_tot.dest = dub_pix_ch5[0].dest;
			if (N_check == N) {
				if(i == N_PIXELS/2 - 1) {
					sum_pix_tot.last = 1;
				}
				else {
					sum_pix_tot.last = 0;
				}
			}
			else {
				sum_pix_tot.last = 0;
			}
			out_stream.write(sum_pix_tot);
		}
	}
	else {}



}
