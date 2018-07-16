/*
 * ftp_server.h
 *
 *  Created on: Jun 26, 2018
 *      Author: alx
 */



#define MAX_FILES			1000	 /*  */
#define MAX_FILENAME_LEN	51

typedef struct
{
	uint8_t is_presented;
	char filename[MAX_FILENAME_LEN];
	uint32_t length;
	uint32_t unix_time;
	char* link;
} FileRecord;


void PrintFS();
void FileSystemInit();
int CreateFile(char* filename, char* pData, int size, uint32_t unix_time);
void SendDir();







#ifndef SRC_FTP_SERVER_H_
#define SRC_FTP_SERVER_H_



#endif /* SRC_FTP_SERVER_H_ */
