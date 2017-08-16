#ifndef __L2TRIGGER_H__
#define __L2TRIGGER_H__

#include <stdlib.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

#define HW_COSIM

#define N_ADDS 128
#define N_PIXELS 2304
#define P 8
#define N_SIGMA 6
#define LOW_THRESH 0

typedef ap_axis<16,2,5,6> AXI_DATA_16;
typedef ap_axis<32,2,5,6> AXI_DATA_32;
typedef ap_axis<64,2,5,6> AXI_DATA_64;
typedef hls::stream<AXI_DATA_32> STREAM_32;
typedef hls::stream<AXI_DATA_64> STREAM_64;

void L2triggerv5(STREAM_32 &in_data, STREAM_64 &out_data, uint16_t n_pixels_in_bus, volatile unsigned int *trig_data);

#endif
