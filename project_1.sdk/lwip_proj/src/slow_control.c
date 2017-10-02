/*
 * slow_control.c
 *
 *  Created on: Nov 13, 2016
 *      Author: alexander
 */


#include "slow_control.h"
#include "xparameters.h"

SLOWCTRL_SP3_36CHIPS_REFORMATTED_V1 reformatted;
SLOWCTRL_SP3_ALL_ASIC_V1 sc_sp3_all_asic_test;
SLOWCTRL_SP3_SAME_ASIC_V1 slowctrl_samedata;

void SetDefaultSCParameters()
{
	slowctrl_samedata.misc_reg0 = 0x0FA20007;
	slowctrl_samedata.x2_tst_msk_dac = 0x00C000C0;
	slowctrl_samedata.misc_reg1 = 0x00000000;
	slowctrl_samedata.x4_gain = 0x00000000;
	slowctrl_samedata.x4_dac_7b_sub = 0x00000000;
	slowctrl_samedata.misc_reg2 = 0x00000000;
}


void PrintReformattedData()
{
	char* p;
	int i;
	p = (char*)&reformatted;
	for(i=0;i<sizeof(reformatted);i++)
	{
		if(!(i%32)) print("\n\r");
		xil_printf("%02x ", p[i]);
	}

}

void SendTestSettingsToSp3(u32 dac_value, u32 c_pixel)
{
	int chip, line, pixel;
	u32 s_value;
	memset((char*)&sc_sp3_all_asic_test, 0, sizeof(sc_sp3_all_asic_test));
	for(chip=0;chip<6;chip++)
	{
		for(line=0;line<6;line++)
		{
			//dac_value = 512;//100*chip;//(25*(j+i*6));
			s_value = 0;
			sc_sp3_all_asic_test.slowctrl_sp3_sgl_asic[chip][line].misc_reg0 = 0x0FA20007 | dac_value<<7 | s_value<<3;
			sc_sp3_all_asic_test.slowctrl_sp3_sgl_asic[chip][line].misc_reg1 = 0x00000000;
			sc_sp3_all_asic_test.slowctrl_sp3_sgl_asic[chip][line].misc_reg2 = 0x00000000;
			for(pixel=0;pixel<64;pixel++)
				sc_sp3_all_asic_test.slowctrl_sp3_sgl_asic[chip][line].tst_msk_dac[pixel] = 0x0040 | ((pixel==c_pixel)<<7);
			xil_printf("chip=%d, line=%d, dac_value=%d\n\r", chip, line, dac_value);
		}
		sc_sp3_all_asic_test.slowctrl_sp3_sgl_asic[chip][line].tst_msk_dac[10] = 0x01C0;
	}
	ReformatSlowControlData(&sc_sp3_all_asic_test);
	//PrintReformattedData();
	LoadIndividualDataToSlowConrol();
}


void ReformatSlowControlData(SLOWCTRL_SP3_ALL_ASIC_V1* slowctrl_sp3_all_asic_v1)
{
	int i, i_remap, j, k;
	int chips_remap_table[] = {4, 2, 0, 1, 3, 5};
	for(i=0;i<N_OF_PMT_PER_ECASIC;i++)
	{
		i_remap = chips_remap_table[i];
		for(j=0;j<N_OF_ECASIC_PER_PDM;j++)
		{
			reformatted.slowctrl_sp3_6chips_reformatted[i].misc_reg0[j] =
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].misc_reg0;
		}
		for(j=0;j<N_OF_ECASIC_PER_PDM;j++)
		{
			for(k=0;k<N_OF_PIXELS_PER_PMT/2;k++)
			{
				reformatted.slowctrl_sp3_6chips_reformatted[i].x2_tst_msk_dac[k][j] =
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].tst_msk_dac[63 - (2*k+0)] << 16 |
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].tst_msk_dac[63 - (2*k+1)];
			}
		}
		for(j=0;j<N_OF_ECASIC_PER_PDM;j++)
		{
			reformatted.slowctrl_sp3_6chips_reformatted[i].misc_reg1[j] =
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].misc_reg1;
		}
		for(j=0;j<N_OF_ECASIC_PER_PDM;j++)
		{
			for(k=0;k<N_OF_PIXELS_PER_PMT/4;k++)
			{
				reformatted.slowctrl_sp3_6chips_reformatted[i].x4_gain[k][j] =
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].gain[63 - (4*k+0)] << 24 |
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].gain[63 - (4*k+1)] << 16 |
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].gain[63 - (4*k+2)] << 8 |
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].gain[63 - (4*k+3)];
			}
		}
		for(j=0;j<N_OF_ECASIC_PER_PDM;j++)
		{
			for(k=0;k<N_OF_PIXELS_PER_PMT/4/8;k++)
			{
				reformatted.slowctrl_sp3_6chips_reformatted[i].x4_dac_7b_sub[k][j] =
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].dac_7b_sub[8 - (4*k+0)] << 24 |
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].dac_7b_sub[8 - (4*k+1)] << 16 |
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].dac_7b_sub[8 - (4*k+2)] << 8 |
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].dac_7b_sub[8 - (4*k+3)];
			}
		}
		for(j=0;j<N_OF_ECASIC_PER_PDM;j++)
		{
			reformatted.slowctrl_sp3_6chips_reformatted[i].misc_reg2[j] =
					slowctrl_sp3_all_asic_v1->slowctrl_sp3_sgl_asic[i_remap][j].misc_reg2;
		}
	}
}

void LoadSameDataToSlowControl(SLOWCTRL_SP3_SAME_ASIC_V1* data)
{
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_GENERALREG_0) = data->misc_reg0;
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_GENERALREG_1) = data->x2_tst_msk_dac;
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_GENERALREG_2) = data->misc_reg1;
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_GENERALREG_3) = data->x4_gain;
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_GENERALREG_4) = data->x4_dac_7b_sub;
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_GENERALREG_5) = data->misc_reg2;
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_CONFIG) = (1<<BIT_IS_SAME_DATA) | (1<<BIT_USER_LED) | (1<<BIT_SELECT_DIN);
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_CONTROLREG) = (1<<BIT_START);
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_CONTROLREG) = 0;
}

void LoadSameDataToSlowControl2(u32 current_dac_value)
{
	u32 s_value=0, i;
	xil_printf("dac=%d ", current_dac_value);
	slowctrl_samedata.misc_reg0 = 0x07A20007 | current_dac_value<<7 | s_value<<3;
	LoadSameDataToSlowControl(&slowctrl_samedata);
	for(i=0;i<1000000;i++);
}

void LoadIndividualDataToSlowConrol()
{
	TxFIFOSend((char*)&reformatted, sizeof(reformatted)/4);
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_CONFIG) = (1<<BIT_USER_LED) | (1<<BIT_SELECT_DIN);
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_CONTROLREG) = (1<<BIT_START);
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_CONTROLREG) = 0;
}

void ResetSPACIROC3()
{
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_RESETREG) = (1<<BIT_RESET);
	*(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_RESETREG) = 0;
}

u32 RetSCState()
{
	return *(u32*)(XPAR_SPACIROC3_SC_0_BASEADDR + 4*REGW_SLOWCTRL_STATUS);
}
