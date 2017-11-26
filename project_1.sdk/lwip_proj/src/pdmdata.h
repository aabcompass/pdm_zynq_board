/*
 * pdmdata.h
 *
 *  Created on: Dec 3, 2016
 *      Author: alexander
 */

#ifndef SRC_PDMDATA_H_
#define SRC_PDMDATA_H_

#include <stdint.h>
#include "pdmdata.h"

// Constants

#define N_OF_PIXELS_PER_PMT		64 /* number of pixel on PMT */
#define N_OF_PMT_PER_ECASIC 	6	/* number of PMT on EC ASIC board */
#define N_OF_ECASIC_PER_PDM		6  /* number of EC ASIC boards in PDM */

#define N_OF_PIXEL_PER_PDM		(N_OF_PIXELS_PER_PMT * N_OF_PMT_PER_ECASIC * N_OF_ECASIC_PER_PDM)

#define N_OF_SCURVE_THRS		1024

#pragma pack(push, 1) /* force no padding in structs */

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
#define DATA_TYPE_SCI_L3		12	/* Scientific data attached with L3 event*/
#define DATA_TYPE_SCURVE		20  /* S-curve data */
#define DATA_TYPE_SC_COMMON		40 	/* Slow control data (common loading) */
#define DATA_TYPE_SC_INDIV		41  /* Slow control data (individual loading)  */
#define DATA_TYPE_HV_DACS		60  /* HV DACs values*/
#define DATA_TYPE_HV_STATUS		61  /* HV status */

//-----------------------------------------------------------------------------
// Timestamp structure in binary format
// Year 0=2017, 1=2018, 2=2019, 3=...
//typedef struct
//{
//	uint32_t TS_dword; // year(31:26) | month(25:22) | date(21:17) | hour(16:12) | min(11:6) | sec(5:0)
//	uint32_t gtu_cnt; // reserv(31:20) | gtu_cnt(19:0)
//} TimeStamp_natural;

// Macros for a timestamp build
//#define BuildTimeStamp_TS_dword(year, month, date, hour, min, sec) \
//	(((year)<<26) | ((month)<<22) | ((date)<<17) | ((hour)<<12) | ((min)<<6) | (sec))

//typedef struct
//{
//	uint64_t n_gtu;
//} TimeStamp_symplified;


typedef struct
{
	uint32_t n_gtu;
	uint32_t unix_time;
} TimeStamp_dual;

//-----------------------------------------------------------------------------
// Scientific data types
#define N_OF_FRAMES_RAW_POLY_V0		128
#define N_OF_FRAMES_INT16_POLY_V0	128
#define N_OF_FRAMES_INT32_POLY_V0	128

//
//typedef struct
//{
//	// symplified timestamp
//	TimeStamp_dual ts;
//	// HVPS status
//	uint32_t hv_status;
//	// raw data (2.5 us GTU)
//	uint8_t raw_data [N_OF_FRAMES_RAW_POLY_V0][N_OF_PIXEL_PER_PDM];
//	// integrated data (320 us GTU)
//	uint16_t int16_data [N_OF_FRAMES_INT16_POLY_V0][N_OF_PIXEL_PER_PDM];
//	// double integrated data (~40 ms GTU)
//	uint32_t int32_data [N_OF_FRAMES_INT32_POLY_V0][N_OF_PIXEL_PER_PDM];
//} DATA_TYPE_SCI_POLY_V5;
//
//typedef struct
//{
//	ZynqBoardHeader zbh;
//	DATA_TYPE_SCI_POLY_V5 payload;
//} Z_DATA_TYPE_SCI_POLY_V5;

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
#define N_FRAMES_PER_LIFECYCLE	(SCALE_GTU_SMALL_PER_BIG * SCALE_GTU_BIG_PER_HUGE * SCALE_GTU_HUGE_PER_LIFECYCLE)

// Zynq board sends L1 frames, L2 frames and L3 frames separately

// If L1 occurred, Zynq makes:
// 1) the timestamp for this event,
// 2) gathers the HVPS status,
// 3) gathers the (N_OF_FRAMES_L1 / 2) raw data frames preserved before L1 event
// 4) records the (N_OF_FRAMES_L1 / 2) raw data frames preserved after L1 event
// Then Zynq collects this data in the DATA_TYPE_SCI_L1 structure and holds it until the end of current lifecycle

// Trigger types
#define TRIG_TYPE_PERIODIC	1 /* Occurred every 5.24 s */
#define TRIG_TYPE_SELF		2 /* Issued by Trigger block*/
#define TRIG_TYPE_AUTO		4 /**/


typedef struct
{
	// Unix timestamp
	TimeStamp_dual ts;
	// Flags
	uint32_t trig_type;
	// Cathode status
	uint8_t cathode_status[12];
	// raw data (2.5 us GTU)
	uint8_t raw_data [N_OF_FRAMES_L1_V0][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCI_L1_V2;

// At the end of lifecycle Zynq packs DATA_TYPE_SCI_L1 structures in the structure Z_DATA_TYPE_SCI_L1 (with header)
// and sends it to DP

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCI_L1_V2 payload;
} Z_DATA_TYPE_SCI_L1_V2;


// If L2 occurred, Zynq makes:
// 1) the timestamp for this event,
// 2) gathers the HVPS status,
// 3) gathers the (N_OF_FRAMES_L2 / 2) int16 data frames preserved before L2 event
// 4) records the (N_OF_FRAMES_L2 / 2) int16 data frames preserved after L2 event
// Then Zynq collects this data in the DATA_TYPE_SCI_L2 structure and holds it until the end of current lifecycle

typedef struct
{
	// Unix timestamp
	TimeStamp_dual ts;
	// Flags
	uint32_t trig_type;
	// Cathode status
	uint8_t cathode_status[12];
	// intergrated data
	uint16_t int16_data[N_OF_FRAMES_L2_V0][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCI_L2_V2;

// At the end of lifecycle Zynq packs DATA_TYPE_SCI_L2 structures in the structure Z_DATA_TYPE_SCI_L2 (with header)
// and sends it to DP

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCI_L2_V2 payload;
} Z_DATA_TYPE_SCI_L2_V2;

// L3 events are automatically generated at the end of lifecycle.  Zynq makes:
// 1) the timestamp for this event,
// 2) gathers the HVPS status,
// 3) gathers the N_OF_FRAMES_L3 int32 data frames preserved before L2 event

// Then Zynq packs DATA_TYPE_SCI_L3 structure in the structure Z_DATA_TYPE_SCI_L3 (with header)
// and sends it to DP

typedef struct
{
	// Unix timestamp
	TimeStamp_dual ts;
	// Flags
	uint32_t trig_type;
	// Cathode status
	uint8_t cathode_status[12];
	// HVPS status
	uint32_t hv_status;
	// double integrated data
	uint32_t int32_data[N_OF_FRAMES_L3_V0][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCI_L3_V2;

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCI_L3_V2 payload;
} Z_DATA_TYPE_SCI_L3_V2;

/* zynq packet passed to the CPU every 5.24 s */
/* 4718772 bytes */
#define MAX_PACKETS_L1 4
#define MAX_PACKETS_L2 4
#define MAX_PACKETS_L3 1
typedef struct
{
  Z_DATA_TYPE_SCI_L1_V2 level1_data[MAX_PACKETS_L1]; /* 294932 * 4 bytes */
  Z_DATA_TYPE_SCI_L2_V2 level2_data[MAX_PACKETS_L2]; /* 589844 * 4 bytes */
  Z_DATA_TYPE_SCI_L3_V2 level3_data[MAX_PACKETS_L3]; /* 1179668 bytes */
} ZYNQ_PACKET;


//Trigger types:
#define TRIG_AUTO		0 /* Auto triggered data (in absence of others triggers)*/
#define TRIG_SELF		1 /* Data triggered on trigger algorithm*/
#define TRIG_EXT		2 /* Data triggered on external signal */


#define INSTRUMENT_MODE_NONE			0
#define INSTRUMENT_MODE_OLD_PROTOCOL	1
#define INSTRUMENT_MODE_FREERUN			2
#define INSTRUMENT_MODE_TRIGGERS		3

#define INSTRUMENT_FTPFILES_CONCAT		0
#define INSTRUMENT_FTPFILES_SEPARATED	1

#define FILENAME_MODE_TRIGGER1 	"frm_tr1_%08d.dat"
#define FILENAME_MODE_TRIGGER2 	"frm_tr2_%08d.dat"
#define FILENAME_MODE_TRIGGER3 	"frm_tr3_%08d.dat"
#define FILENAME_SCURVE	 		"scurve_%08d.dat"
#define FILENAME_CONCATED		"frm_cc_%08d.dat"
#define FILENAME_HVLOG			"hv_%08d.dat"

//========================================
//  S-curve structures
//========================================

#define NMAX_OF_THESHOLDS	1024

typedef struct
{
	uint32_t int32_data[NMAX_OF_THESHOLDS][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCURVE_V1;

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_SCURVE_V1 payload;
} Z_DATA_TYPE_SCURVE_V1;

//If not all 1024 DACs thresholds was requested, but only 200 (for example),
// the array in DATA_TYPE_SCURVE_V1 will have corresponding number of thresholds.

// Symplified S-curve format for matlab

#define NMAX_OF_THESHOLDS_4MATLAB	128

typedef struct
{
	uint32_t int32_data[NMAX_OF_THESHOLDS_4MATLAB][N_OF_PIXEL_PER_PDM];
} DATA_TYPE_SCURVE_4MATLAB;

//========================================
//  HVPS log structure
//========================================

// The structure DATA_TYPE_HVPS_LOG is intended for logging various events which might be occurred with HVPS subsystem.
// Z_DATA_TYPE_HVPS_LOG_V0 is to written to the FTP server within certain time (eg. 5.24s, TBD)

// The maximum number of records in the log array
#define HVPS_LOG_SIZE_NRECORDS	100000

// The list of possible types of records
#define HVPS_TURN_ON			0x00 // turn on
#define HVPS_TURN_OFF			0x01 // turn off
#define HVPS_DACS_LOADED		0x02 // DAC loaded by user
#define HVPS_SR_LOADED			0x03 // Shift register loaded by user
#define HVPS_INTR				0x04 // Interrupt
#define HVPS_SANITY_RELEASE		0x08 // HVPS channel has been turned off because of too many tries to turn on this HV
#define HVPS_SANITY_INTR		0x09 // HVPS channel has been turned off because of too many interrupts from its HVOK line
#define HVPS_AGC_UP_3_to_1		0x0C // Automatic gain control: HVPS automatically switched from "3" to "1". Shift register reloaded.
#define HVPS_AGC_UP_1_to_0		0x0D // Automatic gain control: HVPS automatically switched from "1" to "0". Shift register reloaded.
#define HVPS_AGC_UP_0_to_1		0x0E // Automatic gain control: HVPS automatically switched from "0" to "1". Shift register reloaded.
#define HVPS_AGC_UP_1_to_3		0x0F // Automatic gain control: HVPS automatically switched from "1" to "3". Shift register reloaded.

#define HVPS_TURN_ON_STR			 "TURN_ON" // turn on
#define HVPS_TURN_OFF_STR			 "TURN_OFF"// turn off
#define HVPS_DACS_LOADED_STR		 "DACS_LOADED"// DAC loaded by user
#define HVPS_SR_LOADED_STR			 "SR_LOADED"// Shift register loaded by user
#define HVPS_INTR_STR				 "INTR"// Interrupt
#define HVPS_SANITY_RELEASE_STR		 "SANITY_RELEASE"// HVPS channel has been turned off because of too many tries to turn on this HV
#define HVPS_SANITY_INTR_STR		 "SANITY_INTR"// HVPS channel has been turned off because of too many interrupts from its HVOK line
#define HVPS_AGC_UP_3_to_1_STR		 "AGC_UP_3_to_1"// Automatic gain control: HVPS automatically switched from "3" to "1". Shift register reloaded.
#define HVPS_AGC_UP_1_to_0_STR		 "AGC_UP_1_to_0"// Automatic gain control: HVPS automatically switched from "1" to "0". Shift register reloaded.
#define HVPS_AGC_UP_0_to_1_STR		 "AGC_UP_0_to_1"// Automatic gain control: HVPS automatically switched from "0" to "1". Shift register reloaded.
#define HVPS_AGC_UP_1_to_3_STR		 "AGC_UP_1_to_3"// Automatic gain control: HVPS automatically switched from "1" to "3". Shift register reloaded.


typedef struct
{
	TimeStamp_dual ts; //
	uint32_t record_type;
	uint32_t channels; // bit0,1 - ch0, bit2,3 - ch1, ..., bit16,17 - ch8
} DATA_TYPE_HVPS_LOG_V1;

typedef struct
{
	ZynqBoardHeader zbh;
	DATA_TYPE_HVPS_LOG_V1 payload[HVPS_LOG_SIZE_NRECORDS];
} Z_DATA_TYPE_HVPS_LOG_V1;

#pragma pack(pop) /* return to normal packing */

#endif /* SRC_PDMDATA_H_ */
