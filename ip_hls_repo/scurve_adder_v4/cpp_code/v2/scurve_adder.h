#ifndef __SCURVEADDER_H__
#define __SCURVEADDER_H__

#include <stdlib.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <inttypes.h>

#define HW_COSIM

#define N_PIXELS 6
#define N_CH 2

typedef ap_axis<16,2,5,6> AXI_DATA_16;
typedef ap_axis<32,2,5,6> AXI_DATA_32;
typedef hls::stream<AXI_DATA_16> STREAM_16;
typedef hls::stream<AXI_DATA_32> STREAM_32;

void scurve_adder(STREAM_16 &in_stream0, STREAM_16 &in_stream1, STREAM_32 &out_stream, uint8_t N_ADDS);

#endif


