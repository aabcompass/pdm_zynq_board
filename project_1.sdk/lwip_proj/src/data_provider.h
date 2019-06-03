/*
 * data_provider.h
 *
 *  Created on: Oct 19, 2017
 *      Author: alx
 */

#ifndef SRC_DATA_PROVIDER_H_
#define SRC_DATA_PROVIDER_H_

/*
 * DATA PROVIDER TEST MODES
 *
 * If data provider test mode != 0, another data patterns will be places instead of data from front-end.
 * There is data pattern generator which generates different pattern types which can be used for data corruption, loss,
 * or data shifting detection in a different stages of the data path chain.
 *
 * DATA_PROV_TEST_MODE_NONE -- Normal operation. Data provider test generator is switched OFF.
 *
 * DATA_PROV_TEST_MODE_ECASIC - all pixels are 0 in EC ESIC board #0,
 *                              all pixels =  6  in EC ESIC board #1,
 *                              all pixels =  12 in EC ESIC board #2,
 *                              all pixels =  18 in EC ESIC board #3,
 *                              all pixels =  24 in EC ESIC board #4,
 *                              all pixels =  30 in EC ESIC board #5
 *
 *                                All frames are the same.
 *
 * DATA_PROV_TEST_MODE_PMT  -   all pixels = 0 in PMT #0,
 *                              all pixels = 1 in PMT #1,
 *                              all pixels = 2 in PMT #2
 *                              ...
 *                              all pixels = 35 in PMT #35,
 *
 *                                All frames are the same.
 *
 * DATA_PROV_TEST_MODE_PDM  -   all pixels = 0 in 1st frame,
 *                              all pixels = 1 in 2nd frame,
 *                              all pixels = 2 in 3rd frame,
 *                              ...
 *                              all pixels = 127 in 128th frame,
 *
 *                              after 128 frames counter resets to 0
 *                              i.e.
 *                              all pixels = 0 in 129th frame,
 *                              all pixels = 1 in 130th frame,
 *                              all pixels = 2 in 131th frame,
 *                              ...
 *
 *
 * DATA_PROV_TEST_MODE_L1    -    all pixels = 0 in 1st 128 frames,
 *                                all pixels = 1 in 2nd 128 frames,
 *                                ...
 *                                after 128*128 frames counter resets to 0
 *
 * DATA_PROV_TEST_MODE_L2   -     all pixels = 0 in 1st 128*128 frames,
 *                                all pixels = 1 in 2nd 128*128 frames,
 *                                ...
 *                                after 128*128*128 frames counter resets to 0
 *
 * DATA_PROV_TEST_MODE_L3    -    all pixels = 0 in 1st 128*128*128 frames,
 *                                all pixels = 1 in 2nd 128*128*128 frames,
 *                                ...
 *                                after 128*128*128*128 frames counter resets to 0
 *
 *
 */

#define DATA_PROV_TEST_MODE_NONE	0
#define DATA_PROV_TEST_MODE_ECASIC	1
#define DATA_PROV_TEST_MODE_PMT		2
#define DATA_PROV_TEST_MODE_PDM		3
#define DATA_PROV_TEST_MODE_L1		4
#define DATA_PROV_TEST_MODE_L2		5
#define DATA_PROV_TEST_MODE_L3		6
#define DATA_PROV_TEST_MODE_DBG1	7

// Data provider AXI4lite register definition
#define REGW_CTRL					0
#define REGW_TESTGEN				2
#define REGW_NFRAMES				3
#define REGW_CLR					4
#define REGW_LOAD_PIX_MASK			6
#define REGW_PATTERN_TRANS_STEP		7
#define REGW_PATTERN_STEPS_MAX		8
#define REGW_TESTMODE				9
#define REGW_INFINITE				10

#define REGW_PATTERN_CLR_0R0L		11
#define REGW_PATTERN_CLR_1R1L		12
#define REGW_PATTERN_CLR_2R2L		13

#define REGW_ADCV_CONF				14

#define REGR_STATUS					16
#define REGR_TST_DATA_VERIFICATOR	18

#define CMD_START_BIT_OFFSET		0
#define CMD_START_INT_BIT_OFFSET	1
#define CMD_RESET_TIMESTAMP2		8
#define CMD_CLR_TEST_MODE			0
#define CMD_CLR_ALARM				9

#define CFG_BIT_RUN_TIMESTAMP2		8

#define BIT_TESTMODE_0				0
#define BIT_TESTMODE_ALL_ONES		1

//REGW_LOAD_PIX_MASK
#define BIT_PIX_DISCARD				(1<<0)
#define BIT_PIX_NUM					(1<<8)
#define BIT_ECASIC_LINE				(1<<20)
#define BIT_PIX_WR					(1<<24)

//REGW_ADCV_CONF
#define BIT_ADCV_MAX_PIXEL_NUM		(1<<0)
#define BIT_ADCV_ASIC_CNT			(1<<16)




#endif /* SRC_DATA_PROVIDER_H_ */
