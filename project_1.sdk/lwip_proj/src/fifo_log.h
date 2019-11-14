/*
 * fifo_log.h
 *
 *  Created on: Nov 13, 2019
 *      Author: alx
 */

#ifndef SRC_FIFO_LOG_H_
#define SRC_FIFO_LOG_H_

int XLlFifoEventsInit();
u32 GetLogFifoOcc();
void GetNextRecordFromFifoLog(void * data);

#endif /* SRC_FIFO_LOG_H_ */
