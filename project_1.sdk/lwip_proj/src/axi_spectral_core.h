#ifndef AXI_SPECTRAL_CORE_H_
#define AXI_SPECTRAL_CORE_H_

#include "xparameters.h"
#include "xil_io.h"
#include "xbasic_types.h"
#include "slow_control.h"


//#define NUM_OF_PIXELS_PER_FRAME		(N_PIXELS*N_CHIPS*N_OF_ECASIC_PER_PDM)
#define RECORDS_IN_FIFO	(N_OF_PIXEL_PER_PDM/6/4)
//#define FRAMES_PER_BUNCH	128
#define MAX_SIZE_TCP_PACKET 1460 /*bytes*/

typedef struct
{
	u8 flash_state;
	u32 corever;
	u32 toBeReset;
	u32 access_denied;
	u8 severity; // 0 - max;  ... then low
	char device_modelname[12];
	u8 isPrinting;
	u8 no_files;
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
	u32 current_dac_value;
	u32 is_scurve_being_gathered;
	u32 scurve_counter;
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
	int file_counter_hv;
	u32 artix_locked;
	int is_simple_packets;
	int is_HVPS_OK;
	int err_SDcard; //SD-card error during mount. 0 - OK
	int err_artix_bin; // Error during artix.bin load. 0 - Ok
	int is_artix_loaded;
} InstrumentState;

#define SCI_DATA_ARRAY_SIZE 50

typedef struct
{
	DATA_TYPE_SCI_ALLTRG_V1 sci_data;
	u32 is_occupied;
} DATA_TYPE_SCI_ALLTRG_RECORD;



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






#endif /* AXI_SPECTRAL_CORE_H_ */
