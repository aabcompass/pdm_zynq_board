/*
L2 trigger IP May 2017
Francesca Capel
capel.francesca@gmail.com


L2 Trigger IP for the Mini-EUSO instrument, implemented as part of the Zynq board firmware
Test version currently under development 
Only one trigger per 128 packets
Key parameters can be changed in the header file "L2trigger.h"
The mask is not yet implemented
*/

#include "l2_trigger.h"


void l2_trigger(STREAM_32 &in_stream, STREAM_64 &out_stream, uint16_t n_pixels_in_bus, volatile unsigned int *trig_data){

	//Define the interfaces
	#pragma HLS INTERFACE axis port = in_stream
	#pragma HLS INTERFACE ap_ovld port = trig_data
	#pragma HLS INTERFACE axis port = out_stream
	#pragma HLS INTERFACE s_axilite port=n_pixels_in_bus bundle=CTRL_BUS
	#pragma HLS INTERFACE s_axilite port = return bundle = CTRL_BUS

  	AXI_DATA_16 l2_data1[N_PIXELS/2], l2_data2[N_PIXELS/2];
	AXI_DATA_32 l2_data_concat[N_PIXELS/2];
  	AXI_DATA_64 l3_data;
	
	//k and kk for GTU index, i for pixel index
	int i, k, kk, itrig;
	uint32_t sum_pixP1, sum_pixP2;
	uint32_t sum_overP1[N_PIXELS/2];
	uint32_t sum_overP2[N_PIXELS/2];
	uint32_t sum_pix1[N_PIXELS/2], data_shift1[P][N_PIXELS/2], thresh1[N_PIXELS/2];
	uint32_t sum_pix2[N_PIXELS/2], data_shift2[P][N_PIXELS/2], thresh2[N_PIXELS/2];

	//Initialisation
	*trig_data = 0;
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

	//Read data in and loop over 128 packets performing triggering
	for(k = 0; k < N_ADDS; k++) {

		//1 trigger per 128 packets
		itrig = 0;

		//Loop over 1 packet
		for(i = 0; i < n_pixels_in_bus/2; i++) {

			l2_data_concat[i] = in_stream.read();

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

				if(itrig == 0) {
					//Pulse trigger wire for 1 clock
					*trig_data = 0x00000001;
					*trig_data = 0x00000000;
					itrig = 1;
				}


			}
		}
	}

	//Write to the output stream and set the threshold
	for(i = 0; i < n_pixels_in_bus/2; i++) {

		//Pixel ordering: pixel2 | pixel1
		l3_data.data = ((uint64_t) sum_pix2[i]<< 32) | sum_pix1[i];
		l3_data.keep = 255;
		l3_data.strb = 255;
		l3_data.last = (i == n_pixels_in_bus/2 - 1)? 1:0;
		out_stream << l3_data;

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
