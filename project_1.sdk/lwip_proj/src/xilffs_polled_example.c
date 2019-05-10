
#define FILENAME_ARTIX_BITSTREAM "artix.bin"
#define FILENAME_SPACIROC_CONF "spaciroc.bin"

#include "xparameters.h"	/* SDK generated parameters */
#include "xsdps.h"		/* SD device driver */
#include "xil_printf.h"
#include "ff.h"
#include "xil_cache.h"
#include "xplatform_info.h"


/************************** Function Prototypes ******************************/
int FfsSdPolledExample(void);

/************************** Variable Definitions *****************************/
static FIL fil;		/* File object */
static FATFS fatfs;
static char FileName[32] = "Test.bin";
static char *SD_File;
u32 Platform;

#ifdef __ICCARM__
#pragma data_alignment = 32
u8 DestinationAddress[10*1024*1024];
u8 SourceAddress[10*1024*1024];
#pragma data_alignment = 4
#else
u8 DestinationAddress[10*1024*1024] __attribute__ ((aligned(32)));
u8 SourceAddress[10*1024*1024] __attribute__ ((aligned(32)));
#endif

#define TEST 7



int FfsSdPolledInit(void)
{
	TCHAR *Path = "0:/";
	FRESULT Res;

	/*
	 * Register volume work area, initialize device
	 */
	Res = f_mount(&fatfs, Path, 0);

	if (Res != FR_OK) {
		xil_printf("Error with mounting file system. Code = %d\n\r", Res);
		return Res;
	}

	return XST_SUCCESS;
}

int FfsSdClose(void)
{
	TCHAR *Path = "0:/";
	FRESULT Res;

	/*
	 * Register volume work area, initialize device
	 */
	Res = f_mount(NULL, Path, 0);

	if (Res != FR_OK) {
		xil_printf("Error with unmounting file system. Code = %d\n\r", Res);
		return XST_FAILURE;
	} else {
		print("File system mounted successfully.\n\r");
	}

	return XST_SUCCESS;
}

int ReadSpacirocConfiguration(char * data, int* size)
{
	FRESULT Res;
	FILINFO fno;
	UINT NumBytesRead;

	Res = f_stat(FILENAME_SPACIROC_CONF, &fno);
	if(Res != FR_OK)
	{
		xil_printf("f_stat returned %d\n\r", Res);
		return Res;
	}
	else
	{
		xil_printf("SPACIROC configuration file size =  %d\n\r", fno.fsize);
	}

	*size =  fno.fsize;

	Res = f_open(&fil, FILENAME_SPACIROC_CONF, FA_READ);
	if (Res) {
		return XST_FAILURE;
	}
	/*
	 * Pointer to beginning of file .
	 */
	Res = f_lseek(&fil, 0);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Read data from file.
	 */
	Res = f_read(&fil, (void*)data, fno.fsize,
			&NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}
	else
	{
		xil_printf("NumBytesRead=%d\n\r", NumBytesRead);
	}

	Res = f_close(&fil);
	if (Res) {
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}

int remove_BOOT_bin()
{
	FRESULT Res;
	Res = f_unlink("BOOT.bin");
	if (Res) {
		xil_printf("f_open returns %d\n\r", Res);
		return XST_FAILURE;
	}
	print("File removed\n\r");
	return XST_SUCCESS;
}

int WriteFileToSDCard(char * data, int size, char * filename)
{
	FRESULT Res;
	FILINFO fno;
	UINT NumBytesWrite;

	xil_printf("WriteFileToSDCard %s bytes: %d\n\r", filename, size);

	Res = f_open(&fil, filename, FA_CREATE_ALWAYS | FA_WRITE);
	if (Res) {
		xil_printf("f_open returns %d\n\r", Res);
		return XST_FAILURE;
	}

	Res = f_lseek(&fil, 0);
	if (Res) {
		xil_printf("f_lseek returns %d\n\r", Res);
		return XST_FAILURE;
	}

	Res = f_write(&fil, (void*)data, size,
			&NumBytesWrite);
	if (Res) {
		xil_printf("f_write returns %d\n\r", Res);
		return XST_FAILURE;
	}

	Res = f_close(&fil);
	if (Res) {
		xil_printf("f_close returns %d\n\r", Res);
		return XST_FAILURE;
	}

	print("File created\n\r");
	return XST_SUCCESS;
}

int ReadArtixBitstream(char * data, int* size)
{
	FRESULT Res;
	FILINFO fno;
	UINT NumBytesRead;

	Res = f_stat(FILENAME_ARTIX_BITSTREAM, &fno);
	if(Res != FR_OK)
	{
		xil_printf("f_stat returned %d\n\r", Res);
		return Res;
	}
	else
	{
		xil_printf("Artix bitstream file size =  %d\n\r", fno.fsize);
	}

	*size =  fno.fsize;

	Res = f_open(&fil, FILENAME_ARTIX_BITSTREAM, FA_READ);
	if (Res) {
		return Res;
	}
	/*
	 * Pointer to beginning of file .
	 */
	Res = f_lseek(&fil, 0);
	if (Res) {
		return Res;
	}

	/*
	 * Read data from file.
	 */
	Res = f_read(&fil, (void*)data, fno.fsize,
			&NumBytesRead);
	if (Res) {
		return Res;
	}
	else
	{
		xil_printf("NumBytesRead=%d\n\r", NumBytesRead);
	}

	Res = f_close(&fil);
	if (Res) {
		return Res;
	}
	return XST_SUCCESS;
}
/*****************************************************************************/
/**
*
* File system example using SD driver to write to and read from an SD card
* in polled mode. This example creates a new file on an
* SD card (which is previously formatted with FATFS), write data to the file
* and reads the same data back to verify.
*
* @param	None
*
* @return	XST_SUCCESS if successful, otherwise XST_FAILURE.
*
* @note		None
*
******************************************************************************/
int FfsSdPolledExample(void)
{
	FRESULT Res;
	UINT NumBytesRead;
	UINT NumBytesWritten;
	u32 BuffCnt;
	u32 FileSize = (8*1024*1024);
	TCHAR *Path = "0:/";

	Platform = XGetPlatform_Info();
	if (Platform == XPLAT_ZYNQ_ULTRA_MP) {
		/*
		 * Since 8MB in Emulation Platform taking long time, reduced
		 * file size to 8KB.
		 */
		FileSize = 8*1024;
	}

	for(BuffCnt = 0; BuffCnt < FileSize; BuffCnt++){
		SourceAddress[BuffCnt] = TEST + BuffCnt;
	}

	/*
	 * Register volume work area, initialize device
	 */
	Res = f_mount(&fatfs, Path, 0);

	if (Res != FR_OK) {
		return XST_FAILURE;
	}

	/*
	 * Open file with required permissions.
	 * Here - Creating new file with read/write permissions. .
	 * To open file with write permissions, file system should not
	 * be in Read Only mode.
	 */
	SD_File = (char *)FileName;

	Res = f_open(&fil, SD_File, FA_CREATE_ALWAYS | FA_WRITE | FA_READ);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Pointer to beginning of file .
	 */
	Res = f_lseek(&fil, 0);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Write data to file.
	 */
	Res = f_write(&fil, (const void*)SourceAddress, FileSize,
			&NumBytesWritten);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Pointer to beginning of file .
	 */
	Res = f_lseek(&fil, 0);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Read data from file.
	 */
	Res = f_read(&fil, (void*)DestinationAddress, FileSize,
			&NumBytesRead);
	if (Res) {
		return XST_FAILURE;
	}

	/*
	 * Data verification
	 */
	for(BuffCnt = 0; BuffCnt < FileSize; BuffCnt++){
		if(SourceAddress[BuffCnt] != DestinationAddress[BuffCnt]){
			return XST_FAILURE;
		}
	}

	/*
	 * Close file.
	 */
	Res = f_close(&fil);
	if (Res) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
