/*
 * hv.h
 *
 *  Created on: Nov 30, 2016
 *      Author: alexander
 */

#ifndef SRC_HV_H_
#define SRC_HV_H_

// Note:
// This module contains acronym HK which means that earlier this functionality was performing by HK subsystem

// RW: register of read/write
// RO: register is only for read

#include "xil_types.h"

#define REGW_HVHK_CMD						0 /*RW: bit0  - start transfer to or from HVPS HK part */
#define REGW_HVHK_STATUS 					1 /*RO: bit0 indicates that transfer is completed*/
#define REGW_CONFIG							2 /*RW: bit0 == 1 if transfer to expander. == 0 if transfer to DAC*/
#define REGW_INTR							3 /*RO: bit0 == 1 if interrupt line == 0. And vice versa.*/
#define DATAIN								4 /*RW:  register for sending data to Expander or DAC*/
#define DATAOUT								5 /*RO:  register for receiving data from Expander or DAC*/
#define DATAIN2								6 /*RW:  register for sending data to DAC*/
#define DATAIN3								7 /*RW:  register for sending data to DAC*/

// This register contains bit2 which clears GTU counter
#define REGW_HVHK_CLR_FLAGS					8 /*RW: */
// IP Core contains 2 timers in order to facilitate the time interval measurements
//  which are needed for HVPS HK expander interrupt handling
// Timers are registers  which are decremented every 1 us by 1.
// Timers are stopped if their values reach zero
// On start (restart) the REGW_HVHK_TIMERx_RESTART_VALUE to register is loaded
// Timers are registers 28 bit width

#define REGW_HVHK_TIMER0_RESTART_VALUE		10 /*RW:  Start value for Timer 0*/
#define REGW_HVHK_TIMER1_RESTART_VALUE		11 /*RW:  Start value for Timer 1*/
#define REGW_HVHK_TIMER0					12 /*RO: Timer 0 current value*/
#define REGW_HVHK_TIMER1					13 /*RO: Timer 1 current value*/
#define REGW_HVHK_TIMER0_STOPPED			14 /*RO: bit0 == 1 => timer0 is stopped*/
#define REGW_HVHK_TIMER1_STOPPED			15 /*RO: bit0 == 1 => timer1 is stopped*/
#define REGW_HVHK_TIMER0_START				16 /*RW: bit0 == 1 => timer0 is restarting. Register must be manually returned to zero*/
#define REGW_HVHK_TIMER1_START				17 /*RW: bit0 == 1 => timer1 is restarting. Register must be manually returned to zero*/


// These registers contains number of small GTU
// from the device start or from CLR command
#define REGR_HVHK_GTU_CNT_H					28 /*RO: */
#define REGR_HVHK_GTU_CNT_L					27 /*RO: */



#define BIT_HVHK_START		0
#define BIT_HVHK_READY		0
//#define BIT_POLAR_CLK		1
//#define BIT_IS_CS			2
#define BIT_EXP_NOT_DAC		0

#define MASK_RD				1

#define IS_CS				1
#define NO_CS				0

// HV CATHODE regs
#define REGW_HVCATH_SW		0
#define REGW_HVCATH_CTRL	2

#define BIT_TRANSMIT		0


#define  IODIR    0x00  //direction register: 1-input, 0-output
#define  IPOL     0x01  //input polarity port register: 1-GPIO opposite, 0-GPIO the same as pins
#define  GPINTEN  0x02  //interrupt-on-change-pins: 1-enable, 0-disable
#define  DEFVAL   0x03                //default value register:
#define  INTCON   0x04                //interrupt-on-change control register: 1-pin vs. defval, 0-pin change
#define  IOCON    0x05                //I/O expander configuration (see below)
#define  GPPU     0x06                //GPIO pull-up resistor register: 1-enable (pull-up), 0-disable (no pull-up)
#define  INTF     0x07                //interrupt flag register: 1-pin caused interrupt, 0-interrupt not pending
#define  INTCAP   0x08                //interrupt captured value for port register: 1-logic-high, 0-logic-low
#define  GPIO     0x09                //general purpose I/O port register: 1-logic-high, 0-logic-low
#define  OLAT     0x0A                //output latch register: 1-logic-high, 0-logic-low (before interruption)

#define SREAD		5   //SEQOP //Operation mode bit. 1 = Sequential operation disabled,
#define DISSLW		4   //Slew Rate control bit for SDA output. 1 = Slew rate disabled.
#define HAEN		3  //Hardware Address Enable bit (MCP23S08 only).
#define ODR			2  //This bit configures the INT pin as an open-drain output.
#define INTPOL		1  // This bit sets the polarity of the INT output pin.  //1 = Active-high

      // additional information:
      // IOCON   only active bits:
      //         5 - SEQOP: 1-sequential operation disabled (no change in address pointer),
      //                    0-sequential operation enables (address pointer automatically increments)
      //         4 - DISSLW: 1-slew rate disabled, 0-slew rate enabled
      //         3 - HAEN: 1-enables address pins (A0, A1 here pins #4, #5), 0 disables address pins
      //         2 - ODR: 1-open drain output INT pin (here pin#8) and inactive INTPOL
      //                  0-octive output driver, polarity set by INTPOL
      //         1 - INTPOL: 1 active-high, 0-active-low
      //  e.g.: 0x2C = B0010 1100  (during operation:
      //                            automatic register pointer increment disabled
      //                            + slew rate enable
      //                            + enables address pins A0, A1
      //                            + open drain for INT pin)
      //        0x34 = B0011 0100  (during initial configuration, only:
      //                            automatic register pointer increment disabled
      //                            + slew rate disable
      //                            + disables address pins A0, A1 - each command goes to all expanders
      //                            + open drain for INT pin)


#define  EXP1     0x40                // expander 0 address (HVPS_CW #0, #1, #2)
#define  EXP2     0x42                // expander 1 address (HVPS_CW #3, #4, #5)
#define  EXP3     0x44                // expander 2 address (HVPS_CW #6, #7, #8)

#define  HV_1     0x01
#define  HV_2     0x02
#define  HV_3     0x03
#define  HV_4     0x04
#define  HV_5     0x05
#define  HV_6     0x06
#define  HV_7     0x07
#define  HV_8     0x08
#define  HV_9     0x09

#define NUM_OF_HV	9

#define  STATUSES_PL 0x2A

void HV_turnOFF(char kHV);
void HV_turnOFF_all(void);
unsigned char HV_ON_test(char kHV); // 0 - kHV is not working, related_GPIO - kHV is ON
unsigned char HV_turnON(char kHV);  // turns ON kHV HVPS_CW (10 attempts max)
unsigned char HV_setINT(char kHV);  // sets INTerruption when HVPS no kHV is ON (also for
                                    //  Polish_Status when it is==1)
void setRegister(u32 opcode, u32 reg_addr, u32 reg_data);
u32 getRegister(u32 opcode, u32 reg_addr/*, u32* reg_data*/);
void HV_addLog(u32 record_type, u32 channels);
void HVInterruptService();
void HV_getStatus(int list[NUM_OF_HV]);

#define HV_MIN_DAC_VALUE	0
#define HV_MAX_DAC_VALUE	4095

#define HVHK_TIMER_RESTART_VALUE_US		10000 /* 10 ms*/
#define HVHK_N_TRIES_INTR_RELEASE_MAX	100 /* 1 sec*/
#define HVHK_MAX_INTERRUPTS				1000

#endif /* SRC_HV_H_ */
