/*
 * log_records.h
 *
 *  Created on: Dec 19, 2019
 *      Author: alx
 */

#ifndef SRC_LOG_RECORDS_H_
#define SRC_LOG_RECORDS_H_

#define		HVPS_TURN_ON		0  		/* turn on */
#define		HVPS_TURN_OFF		1		/* turn off */
#define		HVPS_DACS_LOADED	2		/* DAC loaded by user */
#define		HVPS_SR_LOADED		3		/* Shift register loaded by user */
#define		HVPS_INTR			4			/* Interrupt */
#define		HVPS_BLOCK_ECUNIT	5	     /* HVPS channel has been turned as its HVOK line was deasserted at least on 1 second */
#define		HVPS_BLOCK_INTR		6		 /* HVPS channel (EC) has been turned off because of too many interrupts from its lines */
#define		HVPS_STATUS         11       /* POLISH STATUS */
#define 	HVPS_OVERBRIGHT		12       /*Obsolete. Used in very first MINI-EUSO switch-ons*/
#define		HVPS_SWITCHING		13       /*Channels switching by algorithms*/
#define 	FTP_FILE_CREATED	100      /*This record is added when a new file on FTP server is created. Used for debug purposes*/



#endif /* SRC_LOG_RECORDS_H_ */
