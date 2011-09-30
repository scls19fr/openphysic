#include	<htc.h>
#include 	"i2c.h"

/*
 *	I2C functions for HI-TECH PIC C - master mode only
 */

/*
 * 	TIMING - see Philips document: THE I2C-BUS SPECIFICATION
 */


/*
 * 	Send stop condition
 * 	  - data low-high while clock high
 */

void
i2c_Stop(void)
{
	/* don't assume SCL is high on entry */

	SDA_LOW();					/* ensure data is low first */
	SCL_HIGH();
	
	__delay_us(I2C_TM_DATA_SU);
	SCL_DIR = I2C_INPUT;		/* float clock high */
	__delay_us(I2C_TM_STOP_SU);
	SDA_HIGH();					/* the low->high data transistion */
	__delay_us(I2C_TM_BUS_FREE);	/* bus free time before next start */
	SDA_DIR = I2C_INPUT;		/* float data high */

	return;
}

/*
 * 	Send (re)start condition
 * 	  - ensure data is high then issue a start condition
 * 	  - see also i2c_Start() macro
 */

void
i2c_Restart(void)
{
	SCL_LOW();					/* ensure clock is low */
	SDA_HIGH();					/* ensure data is high */

	__delay_us(I2C_TM_DATA_SU);

	SCL_DIR = I2C_INPUT;		/* clock pulse high */
	__delay_us(I2C_TM_SCL_HIGH);

	SDA_LOW();					/* the high->low transition */
	__delay_us(I2C_TM_START_HD);
	return;
}

/*
 * 	Send a byte to the slave
 * 	  - returns true on error
 */
unsigned char
i2c_SendByte(unsigned char byte)
{
	signed char i;

	for(i=7; i>=0; i--)
	{
		SCL_LOW();					/* drive clock low */
		
		/* data hold time = 0, send data now */
        SDA_DIR = ((byte>>i)&0x01);
        if ((byte>>i)&0x01) {		/* bit to send */
			SDA_HIGH();
        }else {
			SDA_LOW();
        }
		__delay_us(I2C_TM_DATA_SU);
		SCL_DIR = I2C_INPUT;		/* float clock high */

		if(i2c_WaitForSCL())		/* wait for clock release */
			return TRUE;			/* bus error */

		__delay_us(I2C_TM_SCL_HIGH);	/* clock high time */
	}
	
	return FALSE;
}

/*
 * 	send an address and data direction to the slave
 * 	  - 7-bit address (lsb ignored)
 * 	  - direction (FALSE = write )
 */
unsigned char
i2c_SendAddress(unsigned char address, unsigned char rw)
{
	return i2c_SendByte(address | (rw?1:0));
}

/*
 * 	Check for an acknowledge
 * 	  - returns ack or ~ack, or ERROR if a bus error
 */
signed char
i2c_ReadAcknowledge(void)
{
	unsigned char ack;

	SCL_LOW();						/* make clock is low */
	SDA_DIR = I2C_INPUT;			/* disable data line - listen for ack */
	__delay_us(I2C_TM_SCL_TO_DATA);	/* SCL low to data out valid */
	SCL_DIR = I2C_INPUT;			/* float clock high */
	__delay_us(I2C_TM_DATA_SU);
	ack = SDA;						/* read the acknowledge */

	/* wait for slave to release clock line after processing byte */
	if(i2c_WaitForSCL())
		return I2C_ERROR;
	return ack;
}

/*
 * 	Read a byte from the slave
 * 	  - returns the byte, or I2C_ERROR if a bus error
 */
int
i2c_ReadByte(void)
{
	unsigned char i;
	unsigned char byte = 0;

	for(i=0; i<8; i++)
	{
		SCL_LOW();					/* drive clock low */
		__delay_us(I2C_TM_SCL_LOW);	/* min clock low  period */
		SDA_DIR = I2C_INPUT;		/* release data line */

		SCL_DIR = I2C_INPUT;		/* float clock high */
		if(i2c_WaitForSCL())
			return I2C_ERROR;
		__delay_us(I2C_TM_SCL_HIGH);
		byte = byte << 1;		/* read the next bit */
		byte |= SDA;
	}
	return (int)byte;
}

/*
 * 	Send an (~)acknowledge to the slave
 * 	  - status of I2C_LAST implies this is the last byte to be sent
 */
void
i2c_SendAcknowledge(unsigned char status)
{
	SCL_LOW();
	if ( status & 0x01) {
		SDA_LOW();				/* drive line low -> more to come */
	}else { 
		SDA_HIGH();
	}
	__delay_us(I2C_TM_DATA_SU);
	SCL_DIR = I2C_INPUT;		/* float clock high */
	__delay_us(I2C_TM_SCL_HIGH);
	return;
}

/*
 * 	Send a byte to the slave and acknowledges the transfer
 * 	  - returns I2C_ERROR, ack or ~ack
 */
signed char
i2c_PutByte(unsigned char data)
{
	if(i2c_SendByte(data))
		return I2C_ERROR;
	return i2c_ReadAcknowledge();	/* returns ack, ~ack */
}

/*
 * 	Get a byte from the slave and acknowledges the transfer
 * 	  - returns true on I2C_ERROR or byte
 */
int
i2c_GetByte(unsigned char more)
{
	int byte;

	if((byte = i2c_ReadByte()) == I2C_ERROR)
		return I2C_ERROR;

	i2c_SendAcknowledge(more);

	return byte;
}

/*
 * 	Send an array of bytes to the slave and acknowledges the transfer
 * 	  - returns number of bytes not successfully transmitted
 */
int
i2c_PutString(const unsigned char *str, unsigned char length)
{
	signed char error;

	while(length)
	{
		if((error = i2c_PutByte(*str)) == I2C_ERROR)
			return -(int)length;					/* bus error */
		else
			if(error)
				return (int)length;					/* non acknowledge */
		str++;
		length--;
	}

	return FALSE;									/* everything OK */
}

/*
 * 	Reads number bytes from the slave, stores them at str and acknowledges the transfer
 * 	  - returns number of bytes not successfully read in
 */
unsigned char
i2c_GetString(unsigned char *str, unsigned char number)
{
	int byte;

	while(number)
	{
		if((byte = i2c_GetByte(number-1)) == I2C_ERROR)
			return number;								/* bus error */
		else
			*str = (unsigned char)byte;
		str++;
		number--;
	}

	return FALSE;										/* everything OK */
}

/*
 * 	Opens communication with a device at address. mode
 * 	indicates I2C_READ or I2C_WRITE.
 * 	  - returns TRUE if address is not acknowledged
 */
unsigned char
i2c_Open(unsigned char address, unsigned char mode)
{
	i2c_Start();
	i2c_SendAddress(address, mode);
	if(i2c_ReadAcknowledge()) 
		return TRUE;

	return FALSE;
}

/*
 * 	wait for the clock line to be released by slow slaves
 * 	  - returns TRUE if SCL was not released after the
 * 	    time out period.
 * 	  - returns FALSE if and when SCL released
 */
unsigned char
i2c_WaitForSCL(void)
{
	/* SCL_DIR should be input here */
	if(!SCL)
	{
		__delay_us(I2C_TM_SCL_TMO);
		/* if the clock is still low -> bus error */
		if(!SCL)
			return TRUE;
	}
	return FALSE;
}

void
i2c_Free()
{
	unsigned char ucI;

	SDA_DIR=I2C_INPUT;
	for(ucI=0;ucI!=9;ucI++)
	{
		SCL_HIGH();
		__delay_us(5);
		SCL_LOW();
		__delay_us(5);
	}
}

unsigned char i2c_read(unsigned char ucAdr)
{
	unsigned char ucDat;

	if (i2c_ReadFrom(ucAdr)==0)
	{
		ucDat=i2c_GetByte(I2C_MORE);
		i2c_Stop();

	}

	return(ucDat);
}
