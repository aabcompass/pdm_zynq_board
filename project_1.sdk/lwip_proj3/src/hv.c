/*
 * hv.c
 *
 *  Created on: Dec 1, 2016
 *      Author: alexander
 */
#include "hv.h"
#include "xparameters.h"
#include "xil_types.h"
#include "xil_printf.h"
#include "pdmdp_err.h"
#include "xscugic.h"
#include "minieuso_pdmdata.h"

// hv_turned_on_user - represents for each HV channel is it switched on by user or not.
// LSB bit represents channel0, etc...
int hv_turned_on_user = 0;

// hv_working_successful - represents for each HV channel is it successful.
// bit of hv_turned_successful is set if both HVon and HVok of corresponding channel were set to HIGH during the last turn on.
// bit of hv_turned_successful is cleared if:
// 1. HVPS channel is turned off by user.
// 2. Both HVon and HVok were not gone back to HIGH state after interrupt event in 1 sec.(??)
// 3. HVPS channel has produced more than specified number of interrupts  = 1000.
// LSB bit represents channel0, etc...
int hv_working_successful = 0;

// hv_n_interrupts - number of interrupts for each HVPS channel.
// The values in this array are cleared if corresponding HVPS channels are turned off by user
int hv_n_interrupts[NUM_OF_HV*2] = {0, 0, 0, 0, 0, 0, 0, 0, 0,    0, 0, 0, 0, 0, 0, 0, 0, 0};

// hv_n_tries_to_release - number of tries to turn on interrupt
// try is fail if corresponding HVok or HVon line is in LOW state
int hv_n_tries_to_release[NUM_OF_HV*2] = {0, 0, 0, 0, 0, 0, 0, 0, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0};

// is_interrupt_pending - represents, is interrupt event post-processed or not for each HVok and HVon
volatile int is_interrupt_pending = 0;

//hvps_log - the database for events related to HVPS
Z_DATA_TYPE_HVPS_LOG_V1 hvps_log;//[HVPS_LOG_SIZE_NRECORDS];
volatile u32 hvps_log_current_record = 0;


//enum hvps_log_records {
#define		HVPS_TURN_ON		0  		/* turn on */
#define		HVPS_TURN_OFF		1		/* turn off */
#define		HVPS_DACS_LOADED	2		/* DAC loaded by user */
#define		HVPS_SR_LOADED		3		/* Shift register loaded by user */
#define		HVPS_INTR			4			/* Interrupt */
#define		HVPS_BLOCK_ECUNIT	5	/* HVPS channel has been turned as its HVOK line was deasserted at least on 1 second */
#define		HVPS_BLOCK_INTR		6		/* HVPS channel (EC) has been turned off because of too many interrupts from its lines */
#define		HVPS_AGC_UP_3_to_1	7	/* Automatic gain control: HVPS automatically switched from "3" to "1". Shift register reloaded. */
#define		HVPS_AGC_UP_1_to_0	8	/* Automatic gain control: HVPS automatically switched from "1" to "0". Shift register reloaded. */
#define		HVPS_AGC_UP_0_to_1	9	/* Automatic gain control: HVPS automatically switched from "0" to "1". Shift register reloaded. */
#define		HVPS_AGC_UP_1_to_3	10	/* Automatic gain control: HVPS automatically switched from "1" to "3". Shift register reloaded. */
#define		HVPS_STATUS         11 /* POLISH STATUS */
//};

const char* hvps_log_records_txt[] = {
		"TURN_ON",
		"TURN_OFF",
		"DACS_LOADED",
		"SR_LOADED",
		"INTR",
		"BLOCK_RELEASE",
		"BLOCK_INTR",
		"AGC_3->1",
		"AGC_1->0",
		"AGC_0->1",
		"AGC_1->3",
		"STATUS"};


static void delay(int time)
{
	int i;
	for(i=0;i<70000*time;i++); // 100 thousands means 1 ms
}


// Set the register in the expander.
// Expanders are connected to the processor via logic part of Zynq.
// Special IP core was designed for access expander.
// Core name is "HV_HK" because in the other EUSO experiments
// the HVPS expanders and DACs are under HK control
// This IP core works like SPI peripheral in microcontrollers
// opcode - EXP1, 2, or 3
// reg_addr - register number inside expander
// reg_data - data to be written
void setRegister(u32 opcode, u32 reg_addr, u32 reg_data)
{
	int i;
	//xil_printf("status=0x%08x\n\r", *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_STATUS));
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*DATAIN) = opcode<<16 | reg_addr<<8 | reg_data;//0x123456;
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_CONFIG) = /*(1<<BIT_POLAR_CLK) | */(1<<BIT_EXP_NOT_DAC);
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_CMD) = (1<<BIT_HVHK_START);
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_CMD) = 0;
	for(i=0;i<10000000;i++)
		if(*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_STATUS) & 1) break;
	//xil_printf("status=0x%08x\n\r", *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_STATUS));
}

// Get the register in the expander.
// Expanders are connected to the processor via logic part of Zynq.
// Special IP core was designed for access expander.  This IP core works like SPI peripheral
// opcode - EXP1, 2, or 3
// reg_addr - register number inside expander
// return - data was read
u32 getRegister(u32 opcode, u32 reg_addr/*, u32* reg_data*/)
{
	int i;
	//xil_printf("status=0x%08x\n\r", *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_STATUS));
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*DATAIN) = ((opcode | MASK_RD)<<16) | (reg_addr<<8) | 0xFF;//0x123456;
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_CONFIG) = /*(1<<BIT_POLAR_CLK) | */(1<<BIT_EXP_NOT_DAC);
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_CMD) = (1<<BIT_HVHK_START);
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_CMD) = 0;
	for(i=0;i<10000000;i++)
		if(*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_STATUS) & 1) break;
	//xil_printf("status=0x%08x\n\r", *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_STATUS));
	return *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*DATAOUT);
}

// Set DAC value for DAC which determine voltage of HVPS
// DACs are connected to the processor via logic part of Zynq.
// Access to DAC is performed via IP core for expander
// reg, reg2, reg3 - registers of all 3 DACs
u32 setDacReg(u32 reg, u32 reg2, u32 reg3)
{
	int i;
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*DATAIN) = reg;
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*DATAIN2) = reg2;
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*DATAIN3) = reg3;
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_CONFIG) = 0;//(1<<BIT_POLAR_CLK) | (is_cs << BIT_IS_CS);
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_CMD) = (1<<BIT_HVHK_START);
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_CMD) = 0;
	for(i=0;i<10000000;i++)
		if(*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_STATUS) & 1) break;
	xil_printf("DAC loaded, i=%d\n\r", i);
}

u32 setAllDacRegs(u32 reg)
{
	setDacReg(reg, reg, reg);
}

void initDac()
{
	setAllDacRegs((3<<16) | (1<<7));

	setAllDacRegs((5<<16) | (1<<9));

	setAllDacRegs((2<<16));
}

void setDacSameValue(int value)
{
	setAllDacRegs(0x3F0000 | value<<4);
}

// Special function for set all 9 DACs
// dac - array with 9 values
void setDacValue_list(int dac[NUM_OF_HV])
{
	int i;
	setDacReg(0x310000 | (dac[0] & HV_MAX_DAC_VALUE)<<4,
			  0x310000 | (dac[3] & HV_MAX_DAC_VALUE)<<4,
			  0x310000 | (dac[6] & HV_MAX_DAC_VALUE)<<4);
	setDacReg(0x320000 | (dac[0+1] & HV_MAX_DAC_VALUE)<<4,
			  0x320000 | (dac[3+1] & HV_MAX_DAC_VALUE)<<4,
			  0x320000 | (dac[6+1] & HV_MAX_DAC_VALUE)<<4);
	setDacReg(0x340000 | (dac[0+2] & HV_MAX_DAC_VALUE)<<4,
			  0x340000 | (dac[3+2] & HV_MAX_DAC_VALUE)<<4,
			  0x340000 | (dac[6+2] & HV_MAX_DAC_VALUE)<<4);
	for(i=0;i<NUM_OF_HV;i++)
		HV_addLog(HVPS_DACS_LOADED, i<<16 | dac[i]);
}

// Expander initialization
int expIni(void){
	u32 reg;
	setRegister(EXP1, IOCON,    (1<<SREAD) | (1<<DISSLW) | (1<<ODR) /*0x34*/);  //
	setRegister(EXP2, IOCON,   (1<<SREAD) | (1<<DISSLW) | (1<<ODR)  /*0x34*/);  //
	setRegister(EXP3, IOCON,    (1<<SREAD) | (1<<DISSLW) | (1<<ODR) /*0x34*/);  //
	setRegister(EXP1, IPOL,    0x00);  //set to normal polarity
	setRegister(EXP1, GPINTEN, 0x00);  //disable intr
	setRegister(EXP1, DEFVAL,  0x00);  //default values
	setRegister(EXP1, INTCON,  0x00);  //pin change interrupt
  //setRegister(0x40, INTF,    0x00);  // The register is read only
  //setRegister(0x40, INTCAP,   0x00);  // The register is read only
	setRegister(EXP1, GPIO,    0x00);  //gpio data
	setRegister(EXP1, OLAT,    0x00);  //output latch register:  (before interruption)
	setRegister(EXP1, IODIR,   0x2A);  //
	setRegister(EXP1, GPPU,    0x00);  // GPIO pull-up resistor register: no pullup
	setRegister(EXP1, IOCON,    (1<<SREAD) | (1<<DISSLW) | (1<<HAEN) | (1<<ODR) /*0x3c*/);  //
	// check whether HVPS connected and powered
	reg = getRegister(EXP1, IODIR);
	//xil_printf("expIni: IODIR=0x%02X", reg);
	if(reg == 0x2A)
		return 1;
	else
		return 0;
}


// ****************
// Turn off selected HV
// kHV - HVPS_CW id = 0,1,2,3,4,5,6,7,8
// This function was imported from the Mexican code
void HV_turnOFF(char kHV) {   // kHV - HVPS_CW id = 0,1,2,3,4,5,6,7,8
  unsigned char expAddress = kHV/3;   // expander number: 0, 1, 2
  unsigned char kHVCWinEXP = kHV - 3 * expAddress; // C-W id within expander (0, 1, 2)
  unsigned char expAddressW = expAddress * 2 + 0x40; // expander address for write (0x40, 0x42, 0x44)
  unsigned char expAddressR = expAddressW + 0x01; // expander address for read (0x41, 0x43, 0x45)
  unsigned char datIODIR   = getRegister(expAddressR, IODIR);
  unsigned char datGPIO    = getRegister(expAddressR, GPIO);
  unsigned char datGPINTEN = getRegister(expAddressR, GPINTEN);

  // disable interrupts for kHV (for ON/OFF and Status bits):
  unsigned char int_bits = 0x3f - ( 0x03 << (2*kHVCWinEXP)); // 0x3c, 0x33, 0x0f  (2 bits at 0, others at 1)
  unsigned char kGPINTEN = datGPINTEN & int_bits;
  setRegister(expAddressW, GPINTEN, kGPINTEN); // disable interrupts for 2 bits

  // turn OFF HVPS_C-W:
  unsigned char kGPIO_CWoff = 0x3f - ( 0x01 << (2*kHVCWinEXP)); // 0x3e, 0x3b, 0x2f (1 bit at 0, others at 1)
  unsigned char kGPIO = datGPIO & kGPIO_CWoff;
  setRegister(expAddressW, GPIO, kGPIO); // at the position of ON/OFF HVPS_C-W bit = 0
  unsigned char kIODIR = (datIODIR & kGPIO_CWoff)|STATUSES_PL; // "Polish status" always input (1)
  setRegister(expAddressW, IODIR, kIODIR);

  delay(10);  // 10 millisec delay

  //HV_addLog(HVPS_TURN_OFF, kHV);

// this procedure leaves:
//     *  interupts disable for ON/OFF and Status pins,
//     *  IODIR open for outut for ON/OFF pin,
//     *  GPIO = 0 for ON/OFF pin
//   ------------------------


// ? :    setRegister(Exp, DEFVAL, data2);
// ? :   setRegister(Exp, INTCON, data2);
 }


// ****************
// Turn off all HV
// This function was imported from the Mexican code
void HV_turnOFF_all(void)  {
	unsigned char iExp = 0;
	//unsigned char int_bits = 0x00;
  unsigned char kGPIO_CWoff = 0x2a;
  for (iExp = 0; iExp <3; iExp++) {
    unsigned char expAddressW = iExp * 2 + 0x40; // expander address for write (0x40, 0x42, 0x44)
    unsigned char expAddressR = expAddressW + 0x01; // expander address for read (0x41, 0x43, 0x45)

    // disable interrupts for kHV (for ON/OFF and Status bits):
    setRegister(expAddressW, GPINTEN, 0x00);

    // turn OFF HVPS_C-W:
    unsigned char datIODIR   = getRegister(expAddressR, IODIR);
    unsigned char datGPIO    = getRegister(expAddressR, GPIO);
    unsigned char kGPIO = datGPIO & kGPIO_CWoff;
    setRegister(expAddressW, GPIO, kGPIO);
    unsigned char kIODIR = (datIODIR & kGPIO_CWoff)|STATUSES_PL; // "Polish status" always input
    setRegister(expAddressW, IODIR, kIODIR);
    delay(10);  // 10 millisec delay
   }

// for how long "0" level ?  (no load anyway)

 }

// This function was imported from the Mexican code
// I don't know why this function is needed for.
// ****************
unsigned char HV_ON_test(char kHV) {  // kHV - HVPS_CW id = 0,1,2,3,4,5,6,7,8
  unsigned char expAddress = kHV/3;   // expander number: 0, 1, 2
  unsigned char kHVCWinEXP = kHV - 3 * expAddress; // C-W id within expander (0, 1, 2)
  unsigned char expAddressW = expAddress * 2 + 0x40; // expander address for write (0x40, 0x42, 0x44)
  unsigned char expAddressR = expAddressW + 0x01; // expander address for read (0x41, 0x43, 0x45)
  unsigned char datIODIR   = getRegister(expAddressR, IODIR);
  unsigned char datGPIO    = getRegister(expAddressR, GPIO);
  unsigned char datGPINTEN = getRegister(expAddressR, GPINTEN);

  unsigned char kStatus = 0x03 << (2*kHVCWinEXP); // 0x03, 0x0C, 0x30 (bits of statuses)
  unsigned char kON_OFF = 0x01 << (2*kHVCWinEXP); // 0x01, 0x04, 0x10 (bits of ON/OFF)

  unsigned char ret = 0x00;

  if ((datIODIR & kStatus) == kStatus ) { // if both status pins are input lines
    if ((datGPIO & kON_OFF) == kON_OFF ) { // if ON/OFF status is OK, then HVPS_C-W is ON

      unsigned char antyKStatus = 0xff - kStatus;
      kStatus = kStatus & datGPIO;  // it might be = kON_OFF ("Polish status" is not necessary = 1)


       // interupt setting: when signal drops from "1" to "0":
      unsigned char datDEFVAL = getRegister(expAddressR, DEFVAL);   // read reference INT for 3 HVPSs
      unsigned char datINTCON = getRegister(expAddressR, INTCON);   // read control register (to compare with DEFVAL)
      unsigned char kDEFVAL = (datDEFVAL & antyKStatus) | kStatus;  // sets DEFVAL value
      unsigned char kINTCON = (datINTCON & antyKStatus) | kStatus;  // sets INTCON value
      setRegister(expAddressW, DEFVAL, kDEFVAL);   // sets DEFVAL
      setRegister(expAddressW, INTCON, kINTCON);   // sets INTCON
      unsigned char kGPINTEN = (datGPINTEN & antyKStatus) | kStatus;  // set active interrupt pins
      setRegister(expAddressW, GPINTEN, kGPINTEN);   // set interrupts

      ret = datGPIO;  // HVPS_C-W is ON, and status is ON
     }
   }


  return ret; // =  0 if HVPS_CW is not working or not properly configured
              // = GPIO when IODIR for status and ON/OFF are properly configured
              //         and HVPS_CW nr kHV is ON (but not necessary with Polish status=1)
              //         interruptions are configured properly (when GPIO is returned).
 }

// ****************
// ****************
// Turn on selected HV
// kHV - HVPS_CW id = 0,1,2,3,4,5,6,7,8
// This function was imported from the Mexican code
unsigned char HV_turnON(char kHV) {  // kHV - HVPS_CW id = 0,1,2,3,4,5,6,7,8
	int i;
	HV_turnOFF(kHV);   // to turn OFF it is necessary to turn OFF, first (discharge capacitor)
// this procedure leaves:
//     *  interupts disable for ON/OFF and Status pins,
//     *  IODIR open for outut for ON/OFF pin,
//     *  GPIO = 0 for ON/OFF pin
//   ------------------------

  unsigned char expAddress = kHV/3;   // expander number: 0, 1, 2
  unsigned char kHVCWinEXP = kHV - 3 * expAddress; // C-W id within expander (0, 1, 2)
  unsigned char expAddressW = expAddress * 2 + 0x40; // expander address for write (0x40, 0x42, 0x44)
  unsigned char expAddressR = expAddressW + 0x01; // expander address for read (0x41, 0x43, 0x45)
  unsigned char datIODIR   = getRegister(expAddressR, IODIR);
  unsigned char datGPIO    = getRegister(expAddressR, GPIO);
  //unsigned char datGPINTEN = getRegister(expAddressR, GPINTEN);

  // turn ON HVPS_C-W (10 attempts):
  unsigned char kGPIO_CWon  =  0x01 << (2*kHVCWinEXP); // 0x01, 0x04, 0x10 (1 bit at 1, others at 0)
  unsigned char kGPIO_CWoff = 0x3f - kGPIO_CWon; // 0x3e, 0x3b, 0x2f (1 bit at 0, others at 1)
  unsigned char kGPIO = (datGPIO & kGPIO_CWoff) | kGPIO_CWon;
  unsigned char kIODIR = (datIODIR & kGPIO_CWoff)|STATUSES_PL; // "Polish status" always input (1)
  unsigned char kIODIRend = kIODIR|kGPIO_CWon; //

  for (i = 0; i< 10; i++) {
    setRegister(expAddressW, GPIO, kGPIO); // at the position of ON/OFF HVPS_C-W bit = 0
    setRegister(expAddressW, IODIR, kIODIR); // ON/OFF pin as output

    delay(10);  // 10 millisec delay
    setRegister(expAddressW, IODIR, kIODIRend); // change ON/OFF pin to input
    delay(5);
    datGPIO = getRegister(expAddressR, GPIO);
    if (datGPIO&kGPIO_CWon) {  // HVPS_CW is ON
      break;
     }
   }
  datGPIO = getRegister(expAddressR, GPIO); // once again

  //HV_addLog(HVPS_TURN_ON, kHV);

  return datGPIO;

// this procedure leaves:
//   *  interupts disable for ON/OFF and Status pins,
//   *  IODIR open for input for ON/OFF pin

 }


// ****************
// SetUp interrupt modes of expanders
unsigned char HV_setINT(char kHV) {  // sets INTerruption when HVPS no kHV is ON (also for
                                     //  Polish_Status when it is==1)
                                     // kHV - HVPS_CW id = 0,1,2,3,4,5,6,7,8
  unsigned char expAddress = kHV/3;   // expander number: 0, 1, 2
  unsigned char kHVCWinEXP = kHV - 3 * expAddress; // C-W id within expander (0, 1, 2)
  unsigned char expAddressW = expAddress * 2 + 0x40; // expander address for write (0x40, 0x42, 0x44)
  unsigned char expAddressR = expAddressW + 0x01; // expander address for read (0x41, 0x43, 0x45)
  //unsigned char datIODIR   = getRegister(expAddressR, IODIR);
  unsigned char datGPIO    = getRegister(expAddressR, GPIO);
  unsigned char datGPINTEN = getRegister(expAddressR, GPINTEN);

  unsigned char kStatus = 0x03 << (2*kHVCWinEXP); // 0x03, 0x0C, 0x30 (bits of statuses)
  unsigned char kON_OFF = 0x01 << (2*kHVCWinEXP); // 0x01, 0x04, 0x10 (bits of ON/OFF)

  unsigned char ret = 0x00;

  if (!(datGPIO & kON_OFF)) { // HVPS_CW off
     unsigned char kOFF = 0x3f - kStatus; // ON/OFF and Status bits are 0
     setRegister(expAddressW, GPINTEN, (datGPINTEN & kOFF) );   // disable interrupts
     print("B");
    }
   else if ((datGPIO & kStatus) == kStatus) { // both ON/OFF and  Polish_Status are 1
      unsigned char datDEFVAL = getRegister(expAddressR, DEFVAL);   // read reference INT for 3 HVPSs
      unsigned char datINTCON = getRegister(expAddressR, INTCON);   // read control register (to compare with DEFVAL)
      setRegister(expAddressW, DEFVAL, datDEFVAL|kStatus);   // sets DEFVAL
      setRegister(expAddressW, INTCON, datINTCON|kStatus);   // sets INTCON
      setRegister(expAddressW, GPINTEN, (datGPINTEN | kStatus));   // sets interrupts
      ret = datGPIO;
      print("A");
    }
   else if ((datGPIO & kON_OFF) == kON_OFF) { // only ON/OFF == 1
      unsigned char datDEFVAL = getRegister(expAddressR, DEFVAL);   // read reference INT for 3 HVPSs
      unsigned char datINTCON = getRegister(expAddressR, INTCON);   // read control register (to compare with DEFVAL)
      unsigned char kNoStatus = 0x3f - (kStatus - kON_OFF);  //
      setRegister(expAddressW, DEFVAL, ((datDEFVAL&kNoStatus)|kON_OFF));   // sets DEFVAL
      setRegister(expAddressW, INTCON, ((datINTCON&kNoStatus)|kON_OFF));   // sets INTCON
      setRegister(expAddressW, GPINTEN, ((datGPINTEN&kNoStatus)| kON_OFF));   // sets interrupts (without Status)
      ret = datGPIO;
      print("C");
    }
   else {
     unsigned char kOFF = 0x3f - kStatus; // ON/OFF and Status bits are 0
     setRegister(expAddressW, GPINTEN, (datGPINTEN & kOFF) );   // disable interrupts
     setRegister(expAddressW, GPIO, (datGPINTEN & kOFF) );
     datGPIO = getRegister(expAddressR, GPIO);
     ret = datGPIO;
     print("D");
    }

  return ret;
 }

//// TODO rework this function
//void regs_clr_intr()
//{
//	print("*");
//
//	getRegister(EXP1, INTCAP);
//	getRegister(EXP1, GPIO);
//	getRegister(EXP2, INTCAP);
//	getRegister(EXP2, GPIO);
//	getRegister(EXP3, INTCAP);
//	getRegister(EXP3, GPIO);
//}

// Add new record to HVPS log
void HV_addLog(u32 record_type, u32 channels)
{
	if(hvps_log_current_record < HVPS_LOG_SIZE_NRECORDS)
	{
		hvps_log.payload[hvps_log_current_record].ts.n_gtu = *(u64*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGR_HVHK_GTU_CNT_L);
		hvps_log.payload[hvps_log_current_record].record_type = record_type;
		hvps_log.payload[hvps_log_current_record].channels = channels;
//		xil_printf("HVPS rec%04d GTU%08x \t%s\t(0x%08x)\n\r",
//				hvps_log_current_record,
//				hvps_log.payload[hvps_log_current_record].ts.n_gtu, message, channels);
		hvps_log_current_record++;
	}
}

int HV_getLogSize()
{
	return hvps_log_current_record;
}

int HV_getLogFileSize()
{
	return sizeof(DATA_TYPE_HVPS_LOG_V1)*hvps_log_current_record + sizeof(ZynqBoardHeader);
}

void* HV_getLogPtr()
{
	return (void*)&hvps_log;
}

void HV_clean_log()
{
	hvps_log_current_record = 0;
}

void HV_prnLog()
{
	int i,j;
	for(i=0;i<hvps_log_current_record;i++)
	{
		xil_printf("%d.\tGTU=%d\tTYPE:%s\t",
				i,
				(u32)hvps_log.payload[i].ts.n_gtu,
				hvps_log_records_txt[hvps_log.payload[i].record_type]);
		switch(hvps_log.payload[i].record_type)
		{
		case HVPS_DACS_LOADED:
			xil_printf("Channel #%d: dac_value:%d", hvps_log.payload[i].channels>>16, hvps_log.payload[i].channels & 0xFFFF);
			break;
//		case HVPS_TURN_ON:
//		case HVPS_TURN_OFF:
////			print("Channels:");
////			for(j=0;j<NUM_OF_HV;j++)
////				xil_printf("%d ", (hvps_log.payload[i].channels == j));
////			break;
//		case HVPS_SR_LOADED:
//		case HVPS_BLOCK_RELEASE:
		default:
			print("Channels:");
			for(j=0;j<NUM_OF_HV;j++)
				xil_printf("%d ", (hvps_log.payload[i].channels >> j*2) & 3);
			break;
		}

		print("\r\n");
	}
}
// This function is periodically called from the lifecycle in main().
// Call of this function is independent of interrupt services
void HVInterruptService()
{
	int i;
	unsigned char  expAddress, kHVCWinEXP, expAddressW, expAddressR;
	u32 datGPIO, datGPINTEN, hvonok;
	// HV Interrupt release periodic sanity
	if(is_interrupt_pending)
	{
		if(*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_TIMER0_STOPPED))
		{
			for(i=0;i<NUM_OF_HV*2;i++) // for each HVon OVok of each HV channel
			{
				if((is_interrupt_pending>>i)&1 && (hv_working_successful>>(i/2))&1)
				{
					expAddress = i/6;
					kHVCWinEXP = i/2 - 3 * expAddress;
					expAddressW = expAddress * 2 + 0x40; // expander address for write (0x40, 0x42, 0x44)
					expAddressR = expAddressW + 0x01; // expander address for read (0x41, 0x43, 0x45)
					datGPIO = getRegister(expAddressR, GPIO);
					datGPINTEN = getRegister(expAddressR, GPINTEN);
					hvonok = datGPIO & (1<<(i - expAddress*6));
					if(hvonok)
					{
						setRegister(expAddressW, GPINTEN, datGPINTEN | hvonok);
						is_interrupt_pending &= ~(1<<i);
						hv_n_tries_to_release[i] = 0;
						print("Interrupt has been released\n\r");
					}
					else
					{
						print("!");
						hv_n_tries_to_release[i]++;
						// if too many tries to release interrupt
						if(hv_n_tries_to_release[i] > HVHK_N_TRIES_INTR_RELEASE_MAX)
						{
							HV_turnOFF(i/2); // turn off this HV
							hv_working_successful &= ~(1<<i/2);
							is_interrupt_pending &= ~(1<<i);
							HV_addLog(HVPS_BLOCK_ECUNIT, (1<<i));
							print("HV channel has been blocked\n\r");
						}
					}
				}
			}
			// Start timer0
			*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_TIMER0_START) = 1;
			*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_TIMER0_START) = 0;
		}
	}
	// HV Interrupt count periodic sanity
	for(i=0;i<NUM_OF_HV*2;i++)
	{
		if((hv_working_successful>>(i/2))&1)
		{
			if(hv_n_interrupts[i] > HVHK_MAX_INTERRUPTS)
			{
				hv_working_successful &= ~(1<<i/2);
				HV_addLog(HVPS_BLOCK_INTR, 1<<i);
				HV_turnOFF(i/2);
				print("HV channel turned off because of a big number if interrupts\n\r");
			}
		}
	}
}

// Interrupt Hundler which  is automatically called where interrupt line from expanders is rising up.
void HVInterruptHundler(void *Callback)
{
	print("H");
	u32 exp1_intf, exp2_intf, exp3_intf;
	u32 exp1_intcap, exp2_intcap, exp3_intcap;
	u32 exp1_gpinten, exp2_gpinten, exp3_gpinten;
	int i;

	// gather register content
	exp1_intf = getRegister(EXP1, INTF);
	exp2_intf = getRegister(EXP2, INTF);
	exp3_intf = getRegister(EXP3, INTF);
	exp1_intcap = getRegister(EXP1, INTCAP);
	exp2_intcap = getRegister(EXP2, INTCAP);
	exp3_intcap = getRegister(EXP3, INTCAP);
	exp1_gpinten = getRegister(EXP1, GPINTEN);
	exp2_gpinten = getRegister(EXP2, GPINTEN);
	exp3_gpinten = getRegister(EXP3, GPINTEN);
	//xil_printf("INTF=0x%02x\n\r", exp2_intf);
	//xil_printf("INTCAP=0x%02x\n\r", exp2_intcap);

	// turn off corresponding interrupt lines
	if(exp1_intf)
		setRegister(EXP2, GPINTEN, (~exp1_intf) & exp1_gpinten);
	if(exp2_intf)
		setRegister(EXP2, GPINTEN, (~exp2_intf) & exp2_gpinten);
	if(exp3_intf)
		setRegister(EXP2, GPINTEN, (~exp3_intf) & exp3_gpinten);

	is_interrupt_pending |= (exp3_intf<<12 | exp2_intf<<6 | exp3_intf);
	// Add log
	HV_addLog(HVPS_INTR, is_interrupt_pending);
	// Start timer0
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_TIMER0_START) = 1;
	*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_TIMER0_START) = 0;
	//adding an interrupt event control array hv_n_interrupts[]
	// determine which line interrupt is occured on
	for(i=0;i<NUM_OF_HV*2;i++)
		if(is_interrupt_pending & (1<<i))
			break;
	hv_n_interrupts[i]++;
}


void print_expander_regs()
{
	print("EXP1:\n\r");
	xil_printf("IODIR=0x%02x\n\r", getRegister(EXP1, IODIR));
	xil_printf("IPOL=0x%02x\n\r", getRegister(EXP1, IPOL));
	xil_printf("GPINTEN=0x%02x\n\r", getRegister(EXP1, GPINTEN));
	xil_printf("DEFVAL=0x%02x\n\r", getRegister(EXP1, DEFVAL));
	xil_printf("INTCON=0x%02x\n\r", getRegister(EXP1, INTCON));
	xil_printf("IOCON=0x%02x\n\r", getRegister(EXP1, IOCON));
	xil_printf("GPPU=0x%02x\n\r", getRegister(EXP1, GPPU));
	xil_printf("INTF=0x%02x\n\r", getRegister(EXP1, INTF));
	xil_printf("INTCAP=0x%02x\n\r", getRegister(EXP1, INTCAP));
	xil_printf("GPIO=0x%02x\n\r", getRegister(EXP1, GPIO));
	xil_printf("OLAT=0x%02x\n\r", getRegister(EXP1, OLAT));

	print("EXP2:\n\r");
	xil_printf("IODIR=0x%02x\n\r", getRegister(EXP2, IODIR));
	xil_printf("IPOL=0x%02x\n\r", getRegister(EXP2, IPOL));
	xil_printf("GPINTEN=0x%02x\n\r", getRegister(EXP2, GPINTEN));
	xil_printf("DEFVAL=0x%02x\n\r", getRegister(EXP2, DEFVAL));
	xil_printf("INTCON=0x%02x\n\r", getRegister(EXP2, INTCON));
	xil_printf("IOCON=0x%02x\n\r", getRegister(EXP2, IOCON));
	xil_printf("GPPU=0x%02x\n\r", getRegister(EXP2, GPPU));
	xil_printf("INTF=0x%02x\n\r", getRegister(EXP2, INTF));
	xil_printf("INTCAP=0x%02x\n\r", getRegister(EXP2, INTCAP));
	xil_printf("GPIO=0x%02x\n\r", getRegister(EXP2, GPIO));
	xil_printf("OLAT=0x%02x\n\r", getRegister(EXP2, OLAT));

	print("EXP3:\n\r");
	xil_printf("IODIR=0x%02x\n\r", getRegister(EXP3, IODIR));
	xil_printf("IPOL=0x%02x\n\r", getRegister(EXP3, IPOL));
	xil_printf("GPINTEN=0x%02x\n\r", getRegister(EXP3, GPINTEN));
	xil_printf("DEFVAL=0x%02x\n\r", getRegister(EXP3, DEFVAL));
	xil_printf("INTCON=0x%02x\n\r", getRegister(EXP3, INTCON));
	xil_printf("IOCON=0x%02x\n\r", getRegister(EXP3, IOCON));
	xil_printf("GPPU=0x%02x\n\r", getRegister(EXP3, GPPU));
	xil_printf("INTF=0x%02x\n\r", getRegister(EXP3, INTF));
	xil_printf("INTCAP=0x%02x\n\r", getRegister(EXP3, INTCAP));
	xil_printf("GPIO=0x%02x\n\r", getRegister(EXP3, GPIO));
	xil_printf("OLAT=0x%02x\n\r", getRegister(EXP3, OLAT));
}


void InitHV()
{
	memset(&hvps_log.payload[0], 0, sizeof(hvps_log.payload));
	hvps_log.zbh.header = BuildHeader(DATA_TYPE_HVPS_LOG, 1);
	hvps_log.zbh.payload_size = sizeof(DATA_TYPE_HVPS_LOG_V1);
	initDac();
	expIni();
}

void HV_turnON_all()
{
	int i;
	for(i=0;i<NUM_OF_HV;i++)
	{
		HV_turnON(i);
		delay(10);
		HV_setINT(i);
		delay(10);
	}
}

// Turn on HVs by list
void HV_turnON_list(int list[NUM_OF_HV])
{
	int i;
	for(i=0;i<NUM_OF_HV;i++)
	{
		if(list[i])
		{
			HV_turnON(i);
			delay(100);
			HV_setINT(i);
			delay(10);
			hv_turned_on_user |= (1<<i);
			hv_working_successful |= (1<<i);
			hv_n_interrupts[i*2] = 0;
			hv_n_interrupts[i*2+1] = 0;
			hv_n_tries_to_release[i*2] = 0;
			hv_n_tries_to_release[i*2+1] = 0;
		}
	}

	HV_addLog(HVPS_TURN_ON,
			list[8] << 16  |
			list[7] << 14  |
			list[6] << 12  |
			list[5] << 10  |
			list[4] << 8  |
			list[3] << 6  |
			list[2] << 4  |
			list[1] << 2  |
			list[0] << 0);

	int tmp_array[NUM_OF_HV];
	HV_getStatus(tmp_array);
}

// Turn off HVs by list
void HV_turnOFF_list(int list[NUM_OF_HV])
{
	int i;
	for(i=0;i<NUM_OF_HV;i++)
	{
		if(list[i])
		{
			HV_turnOFF(i);
			delay(10);
			hv_turned_on_user &= ~(1<<i);
			hv_working_successful &= ~(1<<i);
		}
	}

	HV_addLog(HVPS_TURN_OFF,
			list[8] << 16  |
			list[7] << 14  |
			list[6] << 12  |
			list[5] << 10  |
			list[4] << 8  |
			list[3] << 6  |
			list[2] << 4  |
			list[1] << 2  |
			list[0] << 0);
	int tmp_array[NUM_OF_HV];
	HV_getStatus(tmp_array);
}

// Set DAC value by list
void HV_setDAC_list(int list[NUM_OF_HV])
{
	int i;
	for(i=0;i<NUM_OF_HV;i++)
	{
		if(list[i])
		{
			HV_turnOFF(i);
			delay(10);
		}
	}
}


// Function to provide data exchange with other .c files
int GetIntrState()
{
	return *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR);
}

// Get status of HVPS
// Function to provide data exchange with other .c files
void HV_getStatus(int list[NUM_OF_HV])
{
	int gpio_exp1 = getRegister(EXP1, GPIO);
	int gpio_exp2 = getRegister(EXP2, GPIO);
	int gpio_exp3 = getRegister(EXP3, GPIO);
	list[0] = (gpio_exp1>>0) & 0x3;
	list[1] = (gpio_exp1>>2) & 0x3;
	list[2] = (gpio_exp1>>4) & 0x3;
	list[3] = (gpio_exp2>>0) & 0x3;
	list[4] = (gpio_exp2>>2) & 0x3;
	list[5] = (gpio_exp2>>4) & 0x3;
	list[6] = (gpio_exp3>>0) & 0x3;
	list[7] = (gpio_exp3>>2) & 0x3;
	list[8] = (gpio_exp3>>4) & 0x3;
	HV_addLog(HVPS_STATUS,
			list[8] << 16 |
			list[7] << 14 |
			list[6] << 12 |
			list[5] << 10 |
			list[4] << 8 |
			list[3] << 6 |
			list[2] << 4 |
			list[1] << 2 |
			list[0] << 0);
}

// Set Cathode voltage by list
// Each value can be 0 or 1 or 3.
// All value are serialized to shift registers
// Access to shift register was organized via IP core "HV_AERA",
// because initially Aera J. VHDL core was taken
int HV_setCathodeVoltage(int list[NUM_OF_HV])
{
	u32 reg = 0, i;
	for(i=0;i<NUM_OF_HV;i++)
	{
		xil_printf(" val=%d ", list[i]);
		if(list[i]>3)
		{
			print("Out of range\n\r");
			return ERR_PDM_OUT_OF_RANGE;
		}
		reg += list[i]<<(2*i);
	}
	xil_printf("Cathode reg = 0x%08x\n\r", reg);
	*(u32*)(XPAR_HV_AERA_IP_0_BASEADDR + 4*REGW_HVCATH_SW) = reg;
	*(u32*)(XPAR_HV_AERA_IP_0_BASEADDR + 4*REGW_HVCATH_CTRL) = (1<<BIT_TRANSMIT);
	print("t");
	*(u32*)(XPAR_HV_AERA_IP_0_BASEADDR + 4*REGW_HVCATH_CTRL) = 0;
	HV_addLog(HVPS_SR_LOADED, reg);
	return 0;
}


void Enable_HVHK_Interrupts(XScuGic* pIntc)
{
	/* Enable the interrupt for the GPIO device.*/
	XScuGic_Enable(pIntc, XPAR_FABRIC_HV_HK_V1_0_0_INTR_OUT_INTR);
}

// Setup interrupt system for HVPS
// This function is called when user calls "hvps turnon" via telnet

void SetupHVPSIntrSystem(XScuGic* pIntc)
{
	static is_called = 0;
	if(!is_called)
	{
		is_called++;

		int Result;

		XScuGic_SetPriorityTriggerType(pIntc, XPAR_FABRIC_HV_HK_V1_0_0_INTR_OUT_INTR,
						0xA8, 0x3);

		/*
		 * Connect the interrupt handler that will be called when an
		 * interrupt occurs for the device.
		 */
		Result = XScuGic_Connect(pIntc, XPAR_FABRIC_HV_HK_V1_0_0_INTR_OUT_INTR,
					 (Xil_ExceptionHandler)HVInterruptHundler, NULL);
		if (Result != XST_SUCCESS) {
			print("Error XScuGic_Connect\n\r");
		}

		Enable_HVHK_Interrupts(pIntc);
		XScuGic_Enable(pIntc, XPAR_FABRIC_HV_HK_V1_0_0_INTR_OUT_INTR);

		// Config timers
		// Set up restart value
		*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_HVHK_TIMER0_RESTART_VALUE) = HVHK_TIMER_RESTART_VALUE_US;
		return;
	}
}
