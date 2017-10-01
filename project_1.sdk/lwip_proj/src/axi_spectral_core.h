#ifndef AXI_SPECTRAL_CORE_H_
#define AXI_SPECTRAL_CORE_H_

#include "xparameters.h"
#include "xil_io.h"
#include "xbasic_types.h"
#include "slow_control.h"


//#define NUM_OF_PIXELS_PER_FRAME		(N_PIXELS*N_CHIPS*N_OF_ECASIC_PER_PDM)
#define RECORDS_IN_FIFO	(N_OF_PIXEL_PER_PDM/6/4)
//#define FRAMES_PER_BUNCH	128


typedef struct
{
	u8 flash_state;
	u32 corever;
	u32 toBeReset;
	u32 access_denied;
	u8 severity; // 0 - max;  ... then low
	char device_modelname[12];
	u8 isPrinting;
} SystemSettings;

//// ------------------- ������� ���������, ����������� � flash ---------------------

#define FLASH_IP_ADDR	(64*256*256)
//#define FLASH_ELF_ADDR	(192*256*256)
#define DEFAULT_IP	0x0A07A8C0 /*192.168.7.10*/
#define SLAVA_IP	0x0A07A8C0 /*192.168.7.10 -- ��� �������� ���������*/

#define IP_CONF_NUMBER_NORMAL	0
#define IP_CONF_NUMBER_ERASE	0x0A
#define IP_CONF_NUMBER_SLAVA	0x0B

#define MIN_IFGAP	12

typedef struct
{
	u32 IP; // IP-�����
	u32 IP_not_confirmed; // ���������������� IP-�����
	u32 n_tries; // ����� ������� ����� �� ����������������� IP
} NetworkNVSettings;

typedef struct
{
	u32 start_dac_value;
	u32 stop_dac_value;
	u32 step_dac_value;
	u32 accumulation;
} SCurveStruct;

typedef struct
{
	u32 current_thr;
	u32 current_pixel;
} DebugSettings;


typedef struct
{
	u32 mode;
	u32 ftp_files_mode;
	//u32 is_started;
	int file_counter_l1;
	int file_counter_l2;
	int file_counter_l3;
	int file_counter_cc;
	u32 artix_locked;
} InstrumentState;

#define GPIO_OUTPUT_REG_OFFSET	8
#define IS_TEST_GEN_BIT_OFFSET	1
#define DUTY1_BIT_OFFSET		8
#define NUMFRAMES_BIT_OFFSET	16
#define DUTY2_BIT_OFFSET		24

#define CC_FIFO_OCCUPANCY		16

#define GET_ARTIX_LOCKED (*(u32*)(XPAR_AXI_GPIO_0_BASEADDR) & 7)

#define REGW_SW_MUX_OFFSET		0x40
#define REGW_SW_CTRL_OFFSET		0
#define BIT_SW_COMMIT	1

// data provider register description
#define REGW_CTRL			0
#define REGW_CFG			1
#define REGW_TESTGEN		2
#define REGW_NFRAMES		3
#define REGW_FIFO_OCC_ART0	4
#define REGW_FIFO_OCC_ART1	5
#define REGW_FIFO_OCC_ART2	6
#define REGR_ALARM			7
#define REGW_TESTMODE		9
#define REGW_INFINITE		10
#define REGR_TIMESTAMP		16

#define CMD_START_BIT_OFFSET		0
#define CMD_START_INT_BIT_OFFSET	1
#define CMD_RESET_TIMESTAMP2		8
#define CMD_CLR_ALARM				9

#define CFG_BIT_RUN_TIMESTAMP2		8

#define BIT_TESTMODE_0				0

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
#define REGW_PACKET_CNT		22

#define BIT_SW_START		0
#define BIT_CLR_ERR			0


#endif /* AXI_SPECTRAL_CORE_H_ */
