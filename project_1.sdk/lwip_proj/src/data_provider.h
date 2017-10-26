/*
 * data_provider.h
 *
 *  Created on: Oct 19, 2017
 *      Author: alx
 */

#ifndef SRC_DATA_PROVIDER_H_
#define SRC_DATA_PROVIDER_H_

// data provider register description
#define REGW_CTRL					0
#define REGW_TESTGEN				2
#define REGW_NFRAMES				3
#define REGW_CLR					4
#define REGW_PATTERN_TRANS_STEP		7
#define REGW_PATTERN_STEPS_MAX		8


#define REGW_TESTMODE				9
#define REGW_INFINITE				10

#define REGW_PATTERN_CLR_0R0L		11
#define REGW_PATTERN_CLR_1R1L		12
#define REGW_PATTERN_CLR_2R2L		13

#define REGR_STATUS					16
#define REGR_TST_DATA_VERIFICATOR	18

#define CMD_START_BIT_OFFSET		0
#define CMD_START_INT_BIT_OFFSET	1
#define CMD_RESET_TIMESTAMP2		8
#define CMD_CLR_ALARM				9

#define CFG_BIT_RUN_TIMESTAMP2		8

#define BIT_TESTMODE_0				0

#endif /* SRC_DATA_PROVIDER_H_ */
