/*
L2 TRIGGER TESTBENCH
February 2017
Francesca Capel (capel.francesca@gmail.com)

HLS testbench for the Mini-EUSO L2 trigger IP, implemented on the Zedboard Zynq chip
Test version currently under development
Key parameters can be changed in the header file "L2trigger.h"
*/

#include <stdio.h>
#include "L2triggerv5.h"

int main() {
  	
  	/* DEFINTIIONS */
  	STREAM_32 in_stream_SW, in_stream_HW;
	STREAM_64 out_stream_SW, out_stream_HW;
	AXI_DATA_16 l2_data1[N_PIXELS/2], l2_data2[N_PIXELS/2];
	AXI_DATA_32 l2_data_concat[N_PIXELS/2];
	AXI_DATA_32 in_data_SW, in_data_HW;
	AXI_DATA_64 l3_data, out_data_SW, out_data_HW;

	int i, k, kk, q;
	uint32_t in;
	uint64_t a;

	uint32_t sum_pixP1, sum_pixP2;
	uint32_t sum_overP1[N_PIXELS/2];
	uint32_t sum_overP2[N_PIXELS/2];
	uint32_t sum_pix1[N_PIXELS/2], data_shift1[P][N_PIXELS/2], thresh1[N_PIXELS/2];
	uint32_t sum_pix2[N_PIXELS/2], data_shift2[P][N_PIXELS/2], thresh2[N_PIXELS/2];

	int trig_data_SW;
	int error_count = 0;

	volatile unsigned int *trig_data_HW;
	volatile unsigned int val;
	trig_data_HW = &val;
	val = 0;


	uint16_t n_pixels_in_bus = N_PIXELS/6*4;

	printf("trig_data_HW: %u\n", *trig_data_HW);

	/* TRIGGER TESTBENCH */
	printf("Starting trigger test...\n");

	//Populate the input stream
	for (i = 0; i < n_pixels_in_bus*N_ADDS; i+=2) {
	  	in = (((uint16_t)(i) << 16) | ((uint16_t)(i) + 1));
	  	in_data_SW.data = in;
		in_data_HW.data = in;
        in_stream_SW << in_data_SW;
		in_stream_HW << in_data_HW;
		//printf("%s %i %i\n", "Input SW: ", (in & 0x0000FFFF), (in >> 16));
	}

	/* SOFTWARE IMPLEMENTATION */
	//Initialisation
	trig_data_SW = 0;
	for(i = 0; i < n_pixels_in_bus/2; i++) {
		sum_pix1[i] = 0;
		sum_pix2[i] = 0;
		thresh1[i] = 255;
		thresh2[i] = 255;
	}

	for(kk = 0; kk < P; kk++) {
		for(i = 0; i < n_pixels_in_bus/2; i++) {
			data_shift1[kk][i] = 0;
			data_shift2[kk][i] = 0;
		}
	}

	while(!in_stream_SW.empty()) {
		//Read data in and loop over N_ADDS packets
		for(k = 0; k < N_ADDS; k++) {

			//Loop over one packet of N_PIXELS
			for(i = 0; i < n_pixels_in_bus/2; i++) {
				l2_data_concat[i] = in_stream_SW.read();

				//Pixel ordering: pixel2 | pixel1
				l2_data1[i].data = (l2_data_concat[i].data & 0x0000FFFF);
				l2_data2[i].data = (l2_data_concat[i].data >> 16);

				//Make sum
				sum_pix1[i] += l2_data1[i].data;
				sum_pix2[i] += l2_data2[i].data;

				//Make moving average
				sum_overP1[i] = 0;
				sum_overP2[i] = 0;

				for (kk = P-2; kk >= 0; kk--) {
					data_shift1[kk + 1][i] = data_shift1[kk][i];
					data_shift2[kk + 1][i] = data_shift2[kk][i];
					sum_overP1[i] += data_shift1[kk+1][i];
					sum_overP2[i] += data_shift2[kk+1][i];
				}


				data_shift1[0][i] = l2_data1[i].data;
				data_shift2[0][i] = l2_data2[i].data;
				sum_overP1[i] += data_shift1[0][i];
				sum_overP2[i] += data_shift2[0][i];

				//Trigger decision
				if(sum_overP1[i] > thresh1[i] || sum_overP2[i] > thresh2[i] ) {
					trig_data_SW = 1;
					printf("trigger!\n");
				}
			}
		}

		//Write to the output stream and set the threshold
		for(i = 0; i < n_pixels_in_bus/2; i++) {

			//Pixel ordering: pixel2 | pixel1
			l3_data.data = ((uint64_t) sum_pix2[i] << 32) | sum_pix1[i];
			l3_data.keep = 15;
			l3_data.strb = 15;
			l3_data.last = (i == n_pixels_in_bus/2 - 1)? 1:0;
			out_stream_SW << l3_data;

			sum_pixP1 = P*(sum_pix1[i]/N_ADDS);
			sum_pixP2 = P*(sum_pix2[i]/N_ADDS);
			thresh1[i] = sum_pixP1 + (N_SIGMA*sqrt(sum_pixP1));
			thresh2[i] = sum_pixP2 + (N_SIGMA*sqrt(sum_pixP2));

			if (thresh1[i] < LOW_THRESH) {
				thresh1[i] = LOW_THRESH;
			}
			if (thresh2[i] < LOW_THRESH) {
					thresh2[i] = LOW_THRESH;
			}
		}
	}
	
	/* HARDWARE IMPLEMENTATION */
#ifdef HW_COSIM
	//Run the Vivado HLS trigger
	L2triggerv5(in_stream_HW, out_stream_HW, n_pixels_in_bus, trig_data_HW);
#endif


	/* CHECK HARDWARE AGAINST SOFTWARE */
	for(i = 0; i < n_pixels_in_bus/2; i++) {
#ifdef HW_COSIM 
		//Read out into axi data
		out_data_SW = out_stream_SW.read();
		out_data_HW = out_stream_HW.read();
		if (out_data_HW.data != out_data_SW.data) {
			error_count++;
		}

#else
		printf("No cosimulation with hardware\n");
#endif   
	}

#ifdef HW_COSIM
	if (error_count){
		printf("TEST FAILED\n");
	}
	else {
		printf("TEST PASSED\n");
	}
#endif 

	printf("error_count = %i\n", error_count);
	return error_count;
}
