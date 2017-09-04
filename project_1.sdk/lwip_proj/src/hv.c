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


int prev_int_status = 0;
volatile int int_status = 0;



void delay(int time)
{
	int i;
	for(i=0;i<70000*time;i++); // 100 thousands means 1 ms
}

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

void setDacValue_list(int dac[NUM_OF_HV])
{
	setDacReg(0x310000 | (dac[0] & HV_MAX_DAC_VALUE)<<4,
			  0x310000 | (dac[3] & HV_MAX_DAC_VALUE)<<4,
			  0x310000 | (dac[6] & HV_MAX_DAC_VALUE)<<4);
	setDacReg(0x320000 | (dac[0+1] & HV_MAX_DAC_VALUE)<<4,
			  0x320000 | (dac[3+1] & HV_MAX_DAC_VALUE)<<4,
			  0x320000 | (dac[6+1] & HV_MAX_DAC_VALUE)<<4);
	setDacReg(0x340000 | (dac[0+2] & HV_MAX_DAC_VALUE)<<4,
			  0x340000 | (dac[3+2] & HV_MAX_DAC_VALUE)<<4,
			  0x340000 | (dac[6+2] & HV_MAX_DAC_VALUE)<<4);
}

void expIni(void){
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
}


// ****************
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

// this procedure leaves:
//     *  interupts disable for ON/OFF and Status pins,
//     *  IODIR open for outut for ON/OFF pin,
//     *  GPIO = 0 for ON/OFF pin
//   ------------------------


// ? :    setRegister(Exp, DEFVAL, data2);
// ? :   setRegister(Exp, INTCON, data2);
 }

// ****************
void HV_turnOFF_all(void) {
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
  return datGPIO;

// this procedure leaves:
//   *  interupts disable for ON/OFF and Status pins,
//   *  IODIR open for input for ON/OFF pin

 }


// ****************
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
    }
   else if ((datGPIO & kStatus) == kStatus) { // both ON/OFF and  Polish_Status are 1
      unsigned char datDEFVAL = getRegister(expAddressR, DEFVAL);   // read reference INT for 3 HVPSs
      unsigned char datINTCON = getRegister(expAddressR, INTCON);   // read control register (to compare with DEFVAL)
      setRegister(expAddressW, DEFVAL, datDEFVAL|kStatus);   // sets DEFVAL
      setRegister(expAddressW, INTCON, datINTCON|kStatus);   // sets INTCON
      setRegister(expAddressW, GPINTEN, (datGPINTEN | kStatus));   // sets interrupts
      ret = datGPIO;
    }
   else if ((datGPIO & kON_OFF) == kON_OFF) { // only ON/OFF == 1
      unsigned char datDEFVAL = getRegister(expAddressR, DEFVAL);   // read reference INT for 3 HVPSs
      unsigned char datINTCON = getRegister(expAddressR, INTCON);   // read control register (to compare with DEFVAL)
      unsigned char kNoStatus = 0x3f - (kStatus - kON_OFF);  //
      setRegister(expAddressW, DEFVAL, ((datDEFVAL&kNoStatus)|kON_OFF));   // sets DEFVAL
      setRegister(expAddressW, INTCON, ((datINTCON&kNoStatus)|kON_OFF));   // sets INTCON
      setRegister(expAddressW, GPINTEN, ((datGPINTEN&kNoStatus)| kON_OFF));   // sets interrupts (without Status)
      ret = datGPIO;
    }
   else {
     unsigned char kOFF = 0x3f - kStatus; // ON/OFF and Status bits are 0
     setRegister(expAddressW, GPINTEN, (datGPINTEN & kOFF) );   // disable interrupts
     setRegister(expAddressW, GPIO, (datGPINTEN & kOFF) );
     datGPIO = getRegister(expAddressR, GPIO);
     ret = datGPIO;
    }

  return ret;
 }

void HVInterruptService()
{
//	if(int_status > 1)
//	{
//		int_status--;
//		print("*");
//	}
//	else if(int_status == 1)
//	{
//		print_expander_regs_clr_intr();
//		//xil_printf("GPIO(EXP2) = %02x", getRegister(EXP2, GPIO));
//		//xil_printf("INTCAP(EXP2) = %02x", getRegister(EXP2, INTCAP));
//		int_status = 0;
//	}

	if(*(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR) == 0)
	{
		regs_clr_intr();
	}
}

void HVInterruptHundler(void *Callback)
{
	int i;
//	int data_intf, data_defval, data_gpinten, data_gpio ;
	xil_printf("\n\rRprzerwanie od MCP23S08\n\r ");
	int_status = 1;

//	print("EXP1:\n\r");
//	xil_printf("IODIR=0x%02x\n\r", getRegister(EXP1, IODIR));
//	xil_printf("IPOL=0x%02x\n\r", getRegister(EXP1, IPOL));
//	xil_printf("GPINTEN=0x%02x\n\r", getRegister(EXP1, GPINTEN));
//	xil_printf("DEFVAL=0x%02x\n\r", getRegister(EXP1, DEFVAL));
//	xil_printf("INTCON=0x%02x\n\r", getRegister(EXP1, INTCON));
//	xil_printf("IOCON=0x%02x\n\r", getRegister(EXP1, IOCON));
//	xil_printf("GPPU=0x%02x\n\r", getRegister(EXP1, GPPU));
	xil_printf("INTF=0x%02x\n\r", getRegister(EXP1, INTF));
	xil_printf("INTCAP=0x%02x\n\r", getRegister(EXP2, INTCAP));
	xil_printf("GPIO=0x%02x\n\r", getRegister(EXP2, GPIO));
//	xil_printf("OLAT=0x%02x\n\r", getRegister(EXP1, OLAT));

//	print("EXP2:\n\r");
//	xil_printf("IODIR=0x%02x\n\r", getRegister(EXP2, IODIR));
//	xil_printf("IPOL=0x%02x\n\r", getRegister(EXP2, IPOL));
//	xil_printf("GPINTEN=0x%02x\n\r", getRegister(EXP2, GPINTEN));
//	xil_printf("DEFVAL=0x%02x\n\r", getRegister(EXP2, DEFVAL));
//	xil_printf("INTCON=0x%02x\n\r", getRegister(EXP2, INTCON));
//	xil_printf("IOCON=0x%02x\n\r", getRegister(EXP2, IOCON));
//	xil_printf("GPPU=0x%02x\n\r", getRegister(EXP2, GPPU));
	xil_printf("INTF=0x%02x\n\r", getRegister(EXP2, INTF));
	xil_printf("INTCAP=0x%02x\n\r", getRegister(EXP2, INTCAP));
	xil_printf("GPIO=0x%02x\n\r", getRegister(EXP2, GPIO));
//	xil_printf("OLAT=0x%02x\n\r", getRegister(EXP2, OLAT));

//	print("EXP3:\n\r");
//	xil_printf("IODIR=0x%02x\n\r", getRegister(EXP3, IODIR));
//	xil_printf("IPOL=0x%02x\n\r", getRegister(EXP3, IPOL));
//	xil_printf("GPINTEN=0x%02x\n\r", getRegister(EXP3, GPINTEN));
//	xil_printf("DEFVAL=0x%02x\n\r", getRegister(EXP3, DEFVAL));
//	xil_printf("INTCON=0x%02x\n\r", getRegister(EXP3, INTCON));
//	xil_printf("IOCON=0x%02x\n\r", getRegister(EXP3, IOCON));
//	xil_printf("GPPU=0x%02x\n\r", getRegister(EXP3, GPPU));
	xil_printf("INTF=0x%02x\n\r", getRegister(EXP3, INTF));
	xil_printf("INTCAP=0x%02x\n\r", getRegister(EXP3, INTCAP));
	xil_printf("GPIO=0x%02x\n\r", getRegister(EXP3, GPIO));


	// Try to release interrupt line. Read ALL registers
	//for(i=0;i<=10;i++)
	//	getRegister(EXP2, i);
//	  //xil_printf("INTF = %02x\n\r ", getRegister(0x40, INTF));
//	//delay(400000000);
////	for(i=0;i<100;i++)
////	{
////		xil_printf("GPIO = %02x ", getRegister(exp_addr, GPIO));
////		xil_printf("INTCAP = %02x ", getRegister(exp_addr, INTCAP));
////		xil_printf("i=%d Intr: %d\n\r", i, *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR));
////	}
//	data_intf=getRegister(0x40, INTF);
//	data_defval=getRegister(0x40, DEFVAL);
//	data_gpinten=getRegister(0x40, GPINTEN);
//	setRegister(0x40, GPINTEN, data_gpinten & (~data_intf));
//	xil_printf("GPIO = %02x", getRegister(0x40, GPIO));
//	data_gpio=getRegister(0x40, GPIO);
//	setRegister(0x40, DEFVAL, 0x3F);
//	setRegister(0x40, IOCON,  0x3F);
//	setRegister(0x40, GPINTEN,0x3F);
//	  //delay(20000);
//	 // int_status = *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR);

}

void regs_clr_intr()
{
	print("*");

	getRegister(EXP2, INTCAP);
	getRegister(EXP2, GPIO);
	getRegister(EXP2, INTCAP);
	getRegister(EXP2, GPIO);
	getRegister(EXP3, INTCAP);
	getRegister(EXP3, GPIO);
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
	xil_printf("INTCAP=0x%02x\n\r", getRegister(EXP2, INTCAP));
	xil_printf("GPIO=0x%02x\n\r", getRegister(EXP2, GPIO));
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
	initDac();
	expIni();
}

void HV_turnON_all()
{
	int i;
	for(i=0;i<NUM_OF_HV;i++)
	{
		HV_setINT(i);
		HV_turnON(i);
		delay(10);
	}
}

void HV_turnON_list(int list[NUM_OF_HV])
{
	int i;
	for(i=0;i<NUM_OF_HV;i++)
	{
		if(list[i])
		{
			HV_turnON(i);
			HV_setINT(i);
			delay(10);
		}
	}
}

void HV_turnOFF_list(int list[NUM_OF_HV])
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


int GetIntrState()
{
	return *(u32*)(XPAR_HV_HK_V1_0_0_BASEADDR + 4*REGW_INTR);
}

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
}


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
}

void InterruptOnAb()
{
	setRegister(EXP1, INTCON, 0x00);
	setRegister(EXP2, INTCON, 0x0C);
	setRegister(EXP3, INTCON, 0x00);

	setRegister(EXP1, DEFVAL, 0x00);
	setRegister(EXP2, DEFVAL, 0x0C);
	setRegister(EXP3, DEFVAL, 0x00);

	setRegister(EXP1, GPINTEN, 0x00);
	setRegister(EXP2, GPINTEN, 0x0C);
	setRegister(EXP3, GPINTEN, 0x00);
}

void SetupHVPSIntrSystem(XScuGic* pIntc)
{
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

	/* Enable the interrupt for the GPIO device.*/
	XScuGic_Enable(pIntc, XPAR_FABRIC_HV_HK_V1_0_0_INTR_OUT_INTR);


//	Xil_ExceptionInit();
//
//	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
//			 (Xil_ExceptionHandler)XScuGic_InterruptHandler, pIntc);
//
//	/* Enable non-critical exceptions */
//	Xil_ExceptionEnable();

	return;

}
