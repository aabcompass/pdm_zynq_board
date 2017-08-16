/*
 * pdmdata.h
 *
 *  Created on: Dec 3, 2016
 *      Author: alexander
 */

#ifndef SRC_PDMDATA_H_
#define SRC_PDMDATA_H_

#include <stdint.h>

// Constants

#define N_OF_PIXELS_PER_PMT		64 /* number of pixel on PMT */
#define N_OF_PMT_PER_ECASIC 	6	/* number of PMT on EC ASIC board */
#define N_OF_ECASIC_PER_PDM		6  /* number of EC ASIC boards in PDM */

#define N_OF_PIXEL_PER_PDM		(N_OF_PIXELS_PER_PMT * N_OF_PMT_PER_ECASIC * N_OF_ECASIC_PER_PDM)

#define N_OF_SCURVE_THRS		1024


//-----------------------------------------------------------------------------

// Common Zynq board header
// for all packets with scientific and configuration data
typedef struct
{
	uint32_t header; // 'Z'(31:24) | instrument_id(23:16) | data_type(15:8) | packet_ver(7:0)
	uint32_t payload_size;
} ZynqBoardHeader; //

#define INSTRUMENT_ME_PDM		1 	/* Instrument Mini-EUSO PDM*/


// Macros for a header build
#define BuildHeader(data_type, packet_ver) \
	(('Z'<<24) | (INSTRUMENT_ME_PDM<<16) | ((data_type)<<8) | (packet_ver))

//-----------------------------------------------------------------------------
// Data types

#define DATA_TYPE_SCI_RAW		1 	/* Scientific raw data */
#define DATA_TYPE_SCI_INT16		2 	/* Scientific integrated data with 16 bit pixels*/
#define DATA_TYPE_SCI_INT32		3 	/* Scientific integrated data with 32 bit pixels */
#define DATA_TYPE_SCI_POLY		4   /* Scientific polytypic data*/
#define DATA_TYPE_SCI_L1		10	/* Scientific data attached with L1 event*/
#define DATA_TYPE_SCI_L2		11	/* Scientific data attached with L2 event*/
#define DATA_TYPE_SCI_L3		11	/* Scientific data attached with L3 event*/
#define DATA_TYPE_SC_COMMON		40 	/* Slow control data (common loading) */
#define DATA_TYPE_SC_INDIV		41  /* Slow control data (individual loading)  */
#define DATA_TYPE_HV_DACS		60  /* HV DACs values*/
#define DATA_TYPE_HV_STATUS		61  /* HV status */

//-----------------------------------------------------------------------------
// Timestamp structure in binary format
// Year 0=2017, 1=2018, 2=2019, 3=...
typedef struct
{
	uint32_t TS_dword; // year(31:26) | month(25:22) | date(21:17) | hour(16:12) | min(11:6) | sec(5:0)
	uint32_t gtu_cnt; // reserv(31:20) | gtu_cnt(19:0)
} TimeStamp_natural;

// Macros for a timestamp build
#define BuildTimeStamp_TS_dword(year, month, date, hour, min, sec) \
	(((year)<<26) | ((month)<<22) | ((date)<<17) | ((hour)<<12) | ((min)<<6) | (sec))

typedef struct
{
	uint64_t n_gtu;
} TimeStamp_symplified;

//typedef struct
//{
//	uint64_t n_us;
//} TimeStamp_Unix;

// Structure for adjust/get time on/from Zynq
//typedef struct
//{
//	ZynqBoardHeader zbh;
//	TimeStamp_Unix ts;
//} Z_TimeStamp_Unix;

//-----------------------------------------------------------------------------
// Scientific data types
#define N_OF_FRAMES_RAW_POLY_V0		128
#define N_OF_FRAMES_INT16_POLY_V0	128
#define N_OF_FRAMES_INT32_POLY_V0	128

typedef struct
{
	// symplified timestamp
	TimeStamp_symplified ts;
	// HVPS status
	uint32_t hv_status;
	// raw data (2.5 us GTU)
	uint8_t raw_data [N_OF_FRAMES_RAW_POLY_V0][N_OF_PIXEL_PER_PDM];
	// integrated data (320 us GTU)
	uint16_t int16_data [N_OF_FRAMES_INT16_POLY_V0][N_OF_PIXEL_PER_PDM];
	// double integrated data (~40 ms GTU)
	uint32_t int32_data [N_OF_FRAMES_INT32_POLY_V0][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCI_POLY_V5;

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCI_POLY_V5 payload;
} Z_DATA_TYPE_SCI_POLY_V5;

//========================================
//  Multievents triggering mode structures
//========================================

//// Absolute maximum number of registered L1 events.
//// Also maximum number of registered events can be limited via parameters.
//#define NMAX_OF_L1_EVENTS_PER_LIFECYCLE		4
//// Absolute maximum number of registered L2 events.
//// Also maximum number of registered events can be limited via parameters.
//#define NMAX_OF_L2_EVENTS_PER_LIFECYCLE		4
//// Absolute maximum number of registered L3 events. Always = 1.
//#define NMAX_OF_L3_EVENTS_PER_LIFECYCLE		1

// Number of small GTU frames recorded with L1 event
#define N_OF_FRAMES_L1_V0	128
// Number of big GTU frames recorded with L2 event
#define N_OF_FRAMES_L2_V0	128
// Number of huge GTU frames recorded with L3 event
#define N_OF_FRAMES_L3_V0	128

// Small/Big/Huge GTU scale factors
// Small GTU = 2.5 us
#define SCALE_GTU_SMALL_PER_BIG			128
// Big GTU = Small GTU * SCALE_GTU_SMALL_PER_BIG = 320 us
#define SCALE_GTU_BIG_PER_HUGE			128
// Huge GTU = Big GTU * SCALE_GTU_BIG_PER_HUGE = 40.96 ms
#define SCALE_GTU_HUGE_PER_LIFECYCLE	128
// LifeCycle = Huge GTU * SCALE_GTU_HUGE_PER_LIFECYCLE = 5.24288 s

// Zynq board sends L1 frames, L2 frames and L3 frames separately

// If L1 occurred, Zynq makes:
// 1) the timestamp for this event,
// 2) gathers the HVPS status,
// 3) gathers the (N_OF_FRAMES_L1 / 2) raw data frames preserved before L1 event
// 4) records the (N_OF_FRAMES_L1 / 2) raw data frames preserved after L1 event
// Then Zynq collects this data in the DATA_TYPE_SCI_L1 structure and holds it until the end of current lifecycle

typedef struct
{
	// Unix timestamp
	TimeStamp_symplified ts;
	// HVPS status
	uint32_t hv_status;
	// raw data (2.5 us GTU)
	uint8_t raw_data [N_OF_FRAMES_L1_V0][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCI_L1_V1;

// At the end of lifecycle Zynq packs DATA_TYPE_SCI_L1 structures in the structure Z_DATA_TYPE_SCI_L1 (with header)
// and sends it to DP

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCI_L1_V1 payload;
} Z_DATA_TYPE_SCI_L1_V1;

// If L2 occurred, Zynq makes:
// 1) the timestamp for this event,
// 2) gathers the HVPS status,
// 3) gathers the (N_OF_FRAMES_L2 / 2) int16 data frames preserved before L2 event
// 4) records the (N_OF_FRAMES_L2 / 2) int16 data frames preserved after L2 event
// Then Zynq collects this data in the DATA_TYPE_SCI_L2 structure and holds it until the end of current lifecycle

typedef struct
{
	// Unix timestamp
	TimeStamp_symplified ts;
	// HVPS status
	uint32_t hv_status;
	// raw data (2.5 us GTU)
	uint16_t int16_data[N_OF_FRAMES_L2_V0][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCI_L2_V1;

// At the end of lifecycle Zynq packs DATA_TYPE_SCI_L2 structures in the structure Z_DATA_TYPE_SCI_L2 (with header)
// and sends it to DP

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCI_L2_V1 payload;
} Z_DATA_TYPE_SCI_L2_V1;

// L3 events are automatically generated at the end of lifecycle.  Zynq makes:
// 1) the timestamp for this event,
// 2) gathers the HVPS status,
// 3) gathers the N_OF_FRAMES_L3 int32 data frames preserved before L2 event

// Then Zynq packs DATA_TYPE_SCI_L3 structure in the structure Z_DATA_TYPE_SCI_L3 (with header)
// and sends it to DP

typedef struct
{
	// Unix timestamp
	TimeStamp_symplified ts;
	// HVPS status
	uint32_t hv_status;
	// raw data (2.5 us GTU)
	uint32_t int32_data[N_OF_FRAMES_L3_V0][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCI_L3_V1;

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCI_L3_V1 payload;
} Z_DATA_TYPE_SCI_L3_V1;

#define INSTRUMENT_MODE_NONE		0
#define INSTRUMENT_MODE_FREERUN		1
#define INSTRUMENT_MODE_TRIGGERS	2


#define FILENAME_MODE_TRIGGER1 	"frm_tr1_%08d.dat"
#define FILENAME_MODE_TRIGGER2 	"frm_tr2_%08d.dat"
#define FILENAME_MODE_TRIGGER3 	"frm_tr3_%08d.dat"

#endif /* SRC_PDMDATA_H_ */
