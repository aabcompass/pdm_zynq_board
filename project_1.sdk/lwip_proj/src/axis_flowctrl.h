/*
 * axis_flowctrl.h
 *
 *  Created on: May 22, 2017
 *      Author: alx
 */
#ifndef SRC_AXIS_FLOWCTRL_H_
#define SRC_AXIS_FLOWCTRL_H_




#define REGW_FLAGS					0 /* 3=periodic_trig_en 2=en_algo_trig  1=en_int_trig 0=is_started*/
#define REGW_CLR_FLAGS				1 /* 3=restart_intr 2=clr_all 1=clear_error 0=clr_trans_counter*/
#define REGW_TRIG_DELAY				2 /* the delay between trigger event and message about it*/
#define REGW_EDGE_FLAGS				3 /* 1=trig_force 0=release */
#define REGW_GTUS_PER_CYCLE			6 /* the number of GTUs in one cycles (5.24s in Mini-EUSO)*/
#define REGW_PERIODIC_TRIG_PERIOD	7 /* to be upgraded*/
#define REGW_DMA_LENGTH				8 /* number of AXIS transfers per interrupt*/
#define REGW_NUM_OF_TRIG			9 /* 15:0 = number of triggers per cycle 5,24s*/
#define REGW_UNIX_TIME				14

#define REGR_GPIO_0			16
#define REGR_GPIO_1			17
#define REGR_GPIO_2			18
#define REGR_TLAST_CNT2		19 /*total number of TLASTs which has been sent*/
#define REGR_RESERV			20 /*4debug*/
#define REGR_TRANS_CNT_LCH	23 /*?*/
#define REGR_TRANS_COUNTER	24 /* the number of AXIS transactions after last clr_trans_counter or clr_all */
#define REGR_MAXIS_ALARM	25 /* 0=m_axis_fifo_error if started */
#define REGR_FC_SM_STATE	26 /*3:0=sm_state*/

#define REGR_GTU_CNT		27 /*number of GTU after last GTU counter reset*/
#define REGR_GTU_CNT_LCH	28 /*GTU counter timestamp for */
#define REGR_TRIG_TYPE		29 /*TRIGGER_TYPES for each DMA bank*/


#define SM_STATE_IDLE		0
#define SM_STATE_ARMED		3

#define SetTrigTstGtuTime_L1(data) (*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGW_TRIG_TST_GTU_L*4) = data)

#define GetCurPosFC1() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_TRANS_COUNTER*4))
#define GetCurPosFC2() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_TRANS_COUNTER*4))
#define GetGpio0FC1() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GPIO_0*4))
#define GetGpio1FC1() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GPIO_1*4))
#define GetGpio2FC1() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GPIO_2*4))
#define GetGpio3FC1() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GPIO_3*4))
#define GetGpio4FC1()		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GPIO_4*4))
#define GetGpio5FC1() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_GPIO_5*4))

#define GetMaxisAlarmL1() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L1_BASEADDR + REGR_MAXIS_ALARM*4))
#define GetMaxisAlarmL2() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_MAXIS_ALARM*4))

#define GetNlifeCycle() 		(*(u32*)(XPAR_AXIS_FLOW_CONTROL_L2_BASEADDR + REGR_GTU_CNT_L*4))

#define BIT_FC_IS_STARTED		(1<<0)
#define BIT_FC_EN_INT_TRIG		(1<<1)
#define BIT_FC_EN_ALGO_TRIG		(1<<2)
#define BIT_FC_EN_PERIODIC_TRIG	(1<<3)

#define BIT_FC_CLR_TRANS_CNT	(1<<0)
#define BIT_FC_CLR_ERROR		(1<<1)
#define BIT_FC_CLR_ALL			(1<<2)
#define BIT_FC_CLR_INTR			(1<<3)

#define BIT_FC_RELEASE			(1<<0)
#define BIT_FC_TRIG_FORCE		(1<<1)


#endif /* SRC_AXIS_FLOWCTRL_H_ */
