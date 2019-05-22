/*
 * emacps_ab.c
 *
 *  Created on: Aug 1, 2017
 *      Author: alx
 */
#include "xemacps_hw.h"
#include "xstatus.h"

LONG XEmacPs_PhyWriteAb(/*XEmacPs *InstancePtr, */u32 PhyAddress,
		      u32 RegisterNum, u16 PhyData)
{
	u32 Mgtcr;
	volatile u32 Ipisr;
	u32 IpWriteTemp;
	LONG Status;

	//Xil_AssertNonvoid(InstancePtr != NULL);

	/* Make sure no other PHY operation is currently in progress */
	if ((!(XEmacPs_ReadReg(XPAR_XEMACPS_0_BASEADDR/*InstancePtr->Config.BaseAddress*/,
				XEMACPS_NWSR_OFFSET) &
	      XEMACPS_NWSR_MDIOIDLE_MASK))==TRUE) {
		Status = (LONG)(XST_EMAC_MII_BUSY);
	} else {
	/* Construct Mgtcr mask for the operation */
	Mgtcr = XEMACPS_PHYMNTNC_OP_MASK | XEMACPS_PHYMNTNC_OP_W_MASK |
			(PhyAddress << XEMACPS_PHYMNTNC_PHAD_SHFT_MSK) |
			(RegisterNum << XEMACPS_PHYMNTNC_PREG_SHFT_MSK) | (u32)PhyData;

	/* Write Mgtcr and wait for completion */
	XEmacPs_WriteReg(XPAR_XEMACPS_0_BASEADDR/*InstancePtr->Config.BaseAddress*/,
			   XEMACPS_PHYMNTNC_OFFSET, Mgtcr);

	do {
		Ipisr = XEmacPs_ReadReg(XPAR_XEMACPS_0_BASEADDR/*InstancePtr->Config.BaseAddress*/,
					  XEMACPS_NWSR_OFFSET);
				IpWriteTemp = Ipisr;
		} while ((IpWriteTemp & XEMACPS_NWSR_MDIOIDLE_MASK) == 0x00000000U);

		Status = (LONG)(XST_SUCCESS);
	}
	return Status;
}


LONG XEmacPs_PhyReadAb(/*XEmacPs *InstancePtr,*/ u32 PhyAddress,
		     u32 RegisterNum, u16 *PhyDataPtr)
{
	u32 Mgtcr;
	volatile u32 Ipisr;
	u32 IpReadTemp;
	LONG Status;

	//Xil_AssertNonvoid(InstancePtr != NULL);

	/* Make sure no other PHY operation is currently in progress */
	if ((!(XEmacPs_ReadReg(XPAR_XEMACPS_0_BASEADDR/*InstancePtr->Config.BaseAddress*/,
				XEMACPS_NWSR_OFFSET) &
	      XEMACPS_NWSR_MDIOIDLE_MASK))==TRUE) {
		Status = (LONG)(XST_EMAC_MII_BUSY);
	} else {

	/* Construct Mgtcr mask for the operation */
	Mgtcr = XEMACPS_PHYMNTNC_OP_MASK | XEMACPS_PHYMNTNC_OP_R_MASK |
			(PhyAddress << XEMACPS_PHYMNTNC_PHAD_SHFT_MSK) |
			(RegisterNum << XEMACPS_PHYMNTNC_PREG_SHFT_MSK);

	/* Write Mgtcr and wait for completion */
	XEmacPs_WriteReg(XPAR_XEMACPS_0_BASEADDR/*InstancePtr->Config.BaseAddress*/,
			   XEMACPS_PHYMNTNC_OFFSET, Mgtcr);

	do {
		Ipisr = XEmacPs_ReadReg(XPAR_XEMACPS_0_BASEADDR/*InstancePtr->Config.BaseAddress*/,
					  XEMACPS_NWSR_OFFSET);
			IpReadTemp = Ipisr;
		} while ((IpReadTemp & XEMACPS_NWSR_MDIOIDLE_MASK) == 0x00000000U);

	/* Read data */
		*PhyDataPtr = (u16)XEmacPs_ReadReg(XPAR_XEMACPS_0_BASEADDR/*InstancePtr->Config.BaseAddress*/,
					XEMACPS_PHYMNTNC_OFFSET);
		Status = (LONG)(XST_SUCCESS);
	}
	return Status;
}
