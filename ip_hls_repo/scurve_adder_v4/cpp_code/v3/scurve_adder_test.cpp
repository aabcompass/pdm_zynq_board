#include <stdio.h>
#include "scurve_adder.h"

void scurve_adder(STREAM_16 &in_stream0, STREAM_16 &in_stream1, STREAM_32 &out_stream);

int main() {

	/* DEFINITIONS */
	STREAM_16 inputStream_SW_0, inputStream_HW_0; 
	STREAM_16 inputStream_SW_1, inputStream_HW_1;
	STREAM_32 outputStream_SW, outputStream_HW;

	uint8_t N_ADDS = 3;

	uint16_t concat;
	int error_count;

	int i, j, k;
	uint8_t in_pix1[N_CH][N_PIXELS/2], in_pix2[N_CH][N_PIXELS/2];
	uint32_t sum_pix1[N_CH][N_PIXELS/2], sum_pix2[N_CH][N_PIXELS/2];

	AXI_DATA_16 A;
	AXI_DATA_16 dub_pix[N_CH][N_PIXELS/2];
	AXI_DATA_32 sum_pix_tot;


	/* SCURVE ADDER TESTBENCH */
	printf("Starting scurve_adder test...\n");

	//Populate the input streams
	for (i = 0; i < N_PIXELS*N_ADDS; i+=2) {
		concat = ((i & 0xff) << 8) | ((i+1) & 0xff);
		A.data = concat;
		A.keep = 1;
		A.strb = 1;
		A.user = 1;
		A.id = 0;
		A.dest = 0;
		inputStream_SW_0 << A;
		inputStream_HW_0 << A;
		inputStream_SW_1 << A;
		inputStream_HW_1 << A;
		//printf("Input is %d | %d \n", (concat & 0xFF), (concat >> 8));
		//printf("Input in stream is %d | %d\n", ((int)A.data & 0xFF), ((int)A.data >> 8));
	}

	/* SOFTWARE IMPLEMENTATION */
	//initialise sum_pix
	for (j = 0; j < N_CH; j++) {
		for (i = 0; i < N_PIXELS/2; i++) {
			sum_pix1[j][i] = 0;
			sum_pix2[j][i] = 0;
		}
	}

	//Read data and perform addition for N_ADDS iterations
	for (k = 0; k < N_ADDS; k++) {

		for(j = 0; j < N_CH; j++) {
			//Make a loop over 16 different pixels for now
			for (i = 0; i < N_PIXELS/2; i++) {

				//Read the input pixel values for 1 GTU and add to accumulator
				if (j == 0) {
					dub_pix[j][i] = inputStream_SW_0.read();
				}
				else if (j == 1) {
					dub_pix[j][i] = inputStream_SW_1.read();
				}

				//Split input into 2 separate pixels
				in_pix1[j][i] = dub_pix[j][i].data & 0xFF;
				in_pix2[j][i] = (dub_pix[j][i].data >> 8);


				//Perform accumulation for each pixel
				sum_pix1[j][i] += in_pix1[j][i];
				sum_pix2[j][i] += in_pix2[j][i];

			}
		}
	}

	for (j = 0; j < N_CH; j++) {
		for (i = 0; i < N_PIXELS/2; i++){

			//Populate the output stream
				sum_pix_tot.data = sum_pix2[j][i]<<16 | sum_pix1[j][i];
			sum_pix_tot.keep = dub_pix[j][i].keep;
			sum_pix_tot.strb = dub_pix[j][i].strb;
			sum_pix_tot.user = dub_pix[j][i].user;
			if(i == N_PIXELS/2 - 1 && j == N_CH - 1)
				sum_pix_tot.last = 1;
			else
				sum_pix_tot.last = 0;
			sum_pix_tot.id = dub_pix[j][i].id;
			sum_pix_tot.dest = dub_pix[j][i].dest;
			outputStream_SW.write(sum_pix_tot);
		}
	}


	/* HARDWARE IMPLEMENTATION */
	scurve_adder(inputStream_HW_0, inputStream_HW_1, outputStream_HW, N_ADDS);

	//Read the output and test
	for (i = 0; i < (N_PIXELS/2)*N_CH; i++) {
		AXI_DATA_32 B_HW;
		AXI_DATA_32 B_SW;
		outputStream_HW.read(B_HW);
		outputStream_SW.read(B_SW);
		printf("SW: %u HW: %u \n", (int)B_SW.data, (int)B_HW.data);

		if (B_HW.data != B_SW.data) {
			error_count++;
		}
		else {

		}
	}

	if (error_count == 0) {
		printf("TEST PASSED!\n");
	}
	else {
		printf("TEST FAILED!\n");
	}

	return error_count;
}
