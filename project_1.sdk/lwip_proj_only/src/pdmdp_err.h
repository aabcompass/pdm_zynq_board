/*
 * pdmdp_err.h
 *
 *  Created on: Dec 1, 2016
 *      Author: alexander
 */

#ifndef SRC_PDMDP_ERR_H_
#define SRC_PDMDP_ERR_H_

#define ERR_OK							0
#define ERR_NO_SUCH_COMMAND				1
#define ERR_PDM_OUT_OF_RANGE			2
#define ERR_SCURVE_IS_BEING_GATHERED	3
#define ERR_INSTR_MODE_MUSTBE_0			4
#define ERR_HVPS_DISCONN_OR_POWERED		5
#define ERR_ARTIX_NOT_LOCKED			6

#define ERR_SD_CARD						100 /*from 10 -to 19 -- SDcard error codes*/
#define ERR_ARTIX_BIN					200 /*from 10 -to 19 -- SDcard error codes*/
#define ERR_ARTIX_BOARD					1000 /*from 10 -to 19 -- SDcard error codes*/
//typedef enum {
//	FR_OK = 0U,				/* (0) Succeeded */
//	FR_DISK_ERR,			/* (1) A hard error occurred in the low level disk I/O layer */
//	FR_INT_ERR,				/* (2) Assertion failed */
//	FR_NOT_READY,			/* (3) The physical drive cannot work */
//	FR_NO_FILE,				/* (4) Could not find the file */
//	FR_NO_PATH,				/* (5) Could not find the path */
//	FR_INVALID_NAME,		/* (6) The path name format is invalid */
//	FR_DENIED,				/* (7) Access denied due to prohibited access or directory full */
//	FR_EXIST,				/* (8) Access denied due to prohibited access */
//	FR_INVALID_OBJECT,		/* (9) The file/directory object is invalid */
//	FR_WRITE_PROTECTED,		/* (10) The physical drive is write protected */
//	FR_INVALID_DRIVE,		/* (11) The logical drive number is invalid */
//	FR_NOT_ENABLED,			/* (12) The volume has no work area */
//	FR_NO_FILESYSTEM,		/* (13) There is no valid FAT volume */
//	FR_MKFS_ABORTED,		/* (14) The f_mkfs() aborted due to any parameter error */
//	FR_TIMEOUT,				/* (15) Could not get a grant to access the volume within defined period */
//	FR_LOCKED,				/* (16) The operation is rejected according to the file sharing policy */
//	FR_NOT_ENOUGH_CORE,		/* (17) LFN working buffer could not be allocated */
//	FR_TOO_MANY_OPEN_FILES,	/* (18) Number of open files > _FS_SHARE */
//	FR_INVALID_PARAMETER	/* (19) Given parameter is invalid */
//} FRESULT;



#define ERR_FTP_CLIENT_IS_BUSY			2000



#define TOO_MANY_FILES					-1
#define FILE_ALREADY_EXIST				-2
#define FILENAME_IS_TOO_LONG			-3
#define NO_SUCH_FILE					-4



#endif /* SRC_PDMDP_ERR_H_ */
