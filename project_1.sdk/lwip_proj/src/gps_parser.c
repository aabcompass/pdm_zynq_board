/*
 * gps_parser.c
 *
 *  Created on: Sep 27, 2018
 *      Author: alx
 */

#include "gps_parser.h"
#include "xbasic_types.h"
#include "xparameters.h"

//returns 1 if NMEA0183 char is present
int GetNextChar(char* data)
{
	u32 reg = *(u32*)(XPAR_AXI_GPS_CORE_0_BASEADDR+4*REGR_GPS_NMEA0183);
	if(reg & (1U<<BIT_GPS_DATA_DV_OFFSET))
	{
		*data = (char)((reg & MASK_GPS_DATA) >> BIT_GPS_DATA_OFFSET);
		return 1;
	}
	else
	{
		return 0;
	}
}

void GPS_service()
{
	char c; int char_exists;
	char_exists = GetNextChar(&c);
	if(char_exists)
		xil_printf("%c", c);
}
