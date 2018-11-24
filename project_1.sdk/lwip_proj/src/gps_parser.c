/*
 * gps_parser.c
 *
 *  Created on: Sep 27, 2018
 *      Author: alx
 */

#include "gps_parser.h"
#include "xbasic_types.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "stdio.h"

char msg_str[NMEA0183_MAX_STR_LEN];
int msg_pos=0;

GPS_struct gps_struct;

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

void ProcessNMEA0183msg()
{
	int ret;
	//example
	//$GPGGA,162100.00,5541.91417,N,03732.45924,E,1,07,1.14,202.0,M,13.4,M,,*59
	ret = sscanf(msg_str+1,
			"GPGGA,%f,%f,%c,%f,%c,%d,%d,%f,%f,M,%f,M",
			&gps_struct.time_UTC,
			&gps_struct.latitude,
			&gps_struct.N_or_S,
			&gps_struct.longitude,
			&gps_struct.E_or_W,
			&gps_struct.fix_quality,
			&gps_struct.satellites_num,
			&gps_struct.horiz_dilution,
			&gps_struct.altitude,
			&gps_struct.geoid_height);
	//xil_printf("ret=%d\n\r", ret);
	//xil_printf("msg=%s\n\r", msg_str+1);
	if(ret >= 1)
	{
		gps_struct.n_params = ret;
		printf("UTC=%f,%d satellites\n\r",
			gps_struct.time_UTC,
			gps_struct.satellites_num);
	}
}

void GPS_service()
{
	char c; int char_exists;
	char_exists = GetNextChar(&c);
	if(char_exists)
	{
		if(c == '$')
		{
			msg_pos = 0;
			ProcessNMEA0183msg();
		}
		if(msg_pos >= NMEA0183_MAX_STR_LEN) return;
		msg_str[msg_pos] = c;
		msg_pos++;
//		xil_printf("%c", c);
	}
}


