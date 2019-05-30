/*
 * hv_cathode.h
 *
 *  Created on: May 29, 2019
 *      Author: alx
 */

#ifndef SRC_HV_CATHODE_H_
#define SRC_HV_CATHODE_H_

// HV CATHODE regs
#define REGW_HVCATH_SW				0
#define REGW_HVCATH_OPT				1
#define REGW_HVCATH_CTRL			2
#define REGW_HVCATH_EN_EC			4
#define REGW_HVCATH_RELEASE_TIME	5
#define REGW_HVCATH_GTU_LEN0		6
#define REGW_HVCATH_GTU_LEN1		7
#define REGW_HVCATH_BIG_PULSES_NUM	8
#define REGW_HVCATH_EM_MAPPING		10



//REGW_HVCATH_CTRL
#define BIT_TRANSMIT		0
#define BIT_ADCV_RESET		1


#endif /* SRC_HV_CATHODE_H_ */
