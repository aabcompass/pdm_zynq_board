/*
 * gps_parser.h
 *
 *  Created on: Sep 27, 2018
 *      Author: alx
 */

#ifndef SRC_GPS_PARSER_H_
#define SRC_GPS_PARSER_H_

#define REGW_GPS_CTRL		0
#define REGR_GPS_NMEA0183	1
#define REGR_GPS_FIFO_OCC	2
#define REGR_GPS_PPS_CNT	3

//REGW_GPS_CTRL
#define BIT_GPS_RST			0

//REGR_GPS_NMEA0183
#define BIT_GPS_DATA_DV_OFFSET	0
#define BIT_GPS_DATA_OFFSET		8
#define MASK_GPS_DATA		0x0000FF00

int GetNextChar(char* data);



#endif /* SRC_GPS_PARSER_H_ */
