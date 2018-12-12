/*
 * axis_switch.h
 *
 *  Created on: Nov 4, 2017
 *      Author: alx
 */

#ifndef SRC_AXIS_SWITCH_H_
#define SRC_AXIS_SWITCH_H_

// Custom AXIS switch register description
#define REGW_SW_CTRL		0
#define REGW_ARBITRATE		1
#define REGR_SM_STATE		2
#define REGR_S_TVALID		3
#define REGR_S_TLAST		4
#define REGR_S_READY		5
#define REGW_CLEAR_ERR		6
#define REGR_ERR			7
#define REGW_READY_DLY		8
#define REGW_OCCUPANCY_0	16
#define REGW_OCCUPANCY_1	17
#define REGW_OCCUPANCY_2	18
#define REGW_OCCUPANCY_3	19
#define REGW_OCCUPANCY_4	20
#define REGW_OCCUPANCY_5	21
#define REGR_PACKET_CNT		22
#define REGR_TLAST_CNT		23

#define BIT_SW_START		0
#define BIT_CLR_ERR			0

#endif /* SRC_AXIS_SWITCH_H_ */
