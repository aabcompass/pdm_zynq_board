/*
Scurve adder IP March 2017
Francesca Capel
capel.francesca@gmail.com

Scurve adder IP for the Mini-EUSO instrument. Used to generate S-curves on chip to reduce file size and data processing.
Takes a 16-bit input stream (2 8-bit pixels) and outputs a 32-bit stream (2 16-bit pixels).
Number of iterations is controlled by the input port N (AXI4Lite slave)
*/

#include "scurve_adder.h"

void scurve_adder(STREAM_16 &in_stream0, STREAM_16 &in_stream1, STREAM_32 &out_stream, uint8_t N_ADDS) {

	//Define the interfaces
	#pragma HLS INTERFACE axis port=in_stream0
	#pragma HLS INTERFACE axis port=in_stream1
	#pragma HLS INTERFACE axis port=out_stream
	#pragma HLS INTERFACE s_axilite port=N_ADDS bundle=CTRL_BUS
	#pragma HLS INTERFACE s_axilite port=return bundle=CTRL_BUS

	int i, j, k;
	uint8_t in_pix1_ch0[N_PIXELS/2], in_pix2_ch0[N_PIXELS/2];
	uint8_t in_pix1_ch1[N_PIXELS/2], in_pix2_ch1[N_PIXELS/2];
	int sum_pix1_ch0[N_PIXELS/2], sum_pix2_ch0[N_PIXELS/2];
	int sum_pix1_ch1[N_PIXELS/2], sum_pix2_ch1[N_PIXELS/2];
	 
	AXI_DATA_16 dub_pix_ch0[N_PIXELS/2];
	AXI_DATA_16 dub_pix_ch1[N_PIXELS/2];
	AXI_DATA_32 sum_pix_tot;

	static int packet_cnt = 0;

	//initialise sum_pix
	for (i = 0; i < N_PIXELS/2; i++) {
	#pragma HLS PIPELINE
		sum_pix1_ch0[i] = 0;
		sum_pix2_ch0[i] = 0;
		sum_pix1_ch1[i] = 0;
		sum_pix2_ch1[i] = 0;
	}

	//Read data and perform addition for N iterations
	for (k = 0; k < N_ADDS; k++) {
	  
	    //Make a loop over all pixels
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			//Read the input pixel values for 1 GTU and add to accumulator
			dub_pix_ch0[i] = in_stream0.read();
			dub_pix_ch1[i] = in_stream1.read();

			//Split input into 2 separate pixels
			// pixel2 | pixel1
			in_pix1_ch0[i] = (dub_pix_ch0[i].data & 0xFF);
			in_pix2_ch0[i] = dub_pix_ch0[i].data  >> 8;
			in_pix1_ch1[i] = (dub_pix_ch1[i].data & 0xFF);
			in_pix2_ch1[i] = dub_pix_ch1[i].data  >> 8;

			//Perform accumulation for each pixel
			sum_pix1_ch0[i] += in_pix1_ch0[i];
			sum_pix2_ch0[i] += in_pix2_ch0[i];
			sum_pix1_ch1[i] += in_pix1_ch1[i];
 			sum_pix2_ch1[i] += in_pix2_ch1[i];

		}
	}
	
	for (i = 0; i < N_PIXELS/2; i++) {
	#pragma HLS PIPELINE
		//Populate the output stream
		sum_pix_tot.data = sum_pix2_ch0[i]<<16 | sum_pix1_ch0[i];
		sum_pix_tot.keep = 15;
		sum_pix_tot.strb = 15;
		sum_pix_tot.user = dub_pix_ch0[0].user;
		sum_pix_tot.id = dub_pix_ch0[0].id;
		sum_pix_tot.dest = dub_pix_ch0[0].dest;
		out_stream.write(sum_pix_tot);
	}

	for (i = 0; i < N_PIXELS/2; i++) {
	#pragma HLS PIPELINE
		//Populate the output stream
		sum_pix_tot.data = sum_pix2_ch1[i]<<16 | sum_pix1_ch1[i];
		sum_pix_tot.keep = 15;
		sum_pix_tot.strb = 15;
		sum_pix_tot.user = dub_pix_ch1[0].user;
		if(i == N_PIXELS/2 - 1) {
			sum_pix_tot.last = 1;
		}
		else {
			sum_pix_tot.last = 0;
		}
		sum_pix_tot.id = dub_pix_ch1[0].id;
		sum_pix_tot.dest = dub_pix_ch1[0].dest;
		out_stream.write(sum_pix_tot);
	}



}
