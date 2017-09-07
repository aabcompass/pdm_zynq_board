/*
 * hv.h
 *
 *  Created on: Nov 30, 2016
 *      Author: alexander
 */

#ifndef SRC_HV_H_
#define SRC_HV_H_

#include "xil_types.h"

#define REGW_HVHK_CMD		0
#define REGW_HVHK_STATUS 	1
#define REGW_CONFIG			2
#define REGW_INTR			3
#define DATAIN				4
#define DATAOUT				5
#define DATAIN2				6
#define DATAIN3				7
#define REGW_CLR_FLAGS		8
#define REGR_GTU_CNT_H		27
#define REGR_GTU_CNT_L		28



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

void HVInterruptService();

#define HV_MIN_DAC_VALUE	0
#define HV_MAX_DAC_VALUE	4095


#endif /* SRC_HV_H_ */
