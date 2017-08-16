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
	uint8_t in_pix1[N_CH][N_PIXELS/2], in_pix2[N_CH][N_PIXELS/2];
	int sum_pix1[N_CH][N_PIXELS/2], sum_pix2[N_CH][N_PIXELS/2];
	 
	AXI_DATA_16 dub_pix[N_CH][N_PIXELS/2];
	AXI_DATA_32 sum_pix_tot;

	//initialise sum_pix
	for (j = 0; j < N_CH; j++) {
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			sum_pix1[j][i] = 0;
			sum_pix2[j][i] = 0;
		}
	}

	//Read data and perform addition for N iterations
	for (k = 0; k < N_ADDS; k++) {

		//Loop over all input channels
		for(j = 0; j < N_CH; j++) {

			//Loop over all pixels
			for (i = 0; i < N_PIXELS/2; i++) {
			#pragma HLS PIPELINE
				//Read the input pixel values for 1 GTU and add to accumulator
				if (j == 0) {
					dub_pix[j][i] = in_stream0.read();
				}
				else if (j == 1) {
					dub_pix[j][i] = in_stream1.read();
				}

				//Split input into 2 separate pixels
				// pixel2 | pixel1
				in_pix1[j][i] = (dub_pix[j][i].data & 0xFF);
				in_pix2[j][i] = dub_pix[j][i].data  >> 8;

				//Perform accumulation for each pixel
				sum_pix1[j][i] += in_pix1[j][i];
				sum_pix2[j][i] += in_pix2[j][i];

			}
		}
	}
	
	for (j = 0; j <  N_CH; j++) {
		for (i = 0; i < N_PIXELS/2; i++) {
		#pragma HLS PIPELINE
			//Populate the output stream
			sum_pix_tot.data = sum_pix2[j][i]<<16 | sum_pix1[j][i];
			sum_pix_tot.keep = 15;
			sum_pix_tot.strb = 15;
			sum_pix_tot.user = dub_pix[j][i].user;
			if(i == N_PIXELS/2 - 1 && j == N_CH -1) {
				sum_pix_tot.last = 1;
			}
			else {
				sum_pix_tot.last = 0;
			}
			sum_pix_tot.id = dub_pix[j][i].id;
			sum_pix_tot.dest = dub_pix[j][i].dest;
			out_stream.write(sum_pix_tot);
		}
	}

}
