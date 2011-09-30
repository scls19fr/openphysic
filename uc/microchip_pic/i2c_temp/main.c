#include <htc.h>
#include "delay.h"
#include "lcd.h"
#include <stdio.h>

#define _XTAL_FREQ 4000000

void main(void)
{
	char buffer[17];
	int nbc;
	unsigned int tick;
	float temp1;

	lcd_init();
	

	while(1) {
		//lcd_clear();

		lcd_goto(0);	// select first line
		temp1 = 18.5;
		nbc = sprintf(buffer, "Temp.1=%03f", temp1);
		lcd_puts(buffer);
	
		lcd_goto(0x40);	// Select second line
		nbc = sprintf(buffer, "           %05d", tick);
		lcd_puts(buffer);

		__delay_ms(500);

		tick = tick+1;
	}
}


/*
	//i2c_Restart();
	//i2c_SendAddress(0, 0);

	//i2c_SendByte(0xEE);
	//i2c_Open(0x00, )
	i2c_Start();
	//i2c_ReadFrom(0x00);
	i2c_SendByte(0x90);
	i2c_SendByte(0xEE);
	i2c_Stop();


	i2c_Start();
	i2c_SendByte(0x90);
	i2c_SendByte(0xAA);
	i2c_Start();
	i2c_SendByte(0x91);
	cycles=i2c_ReadByte();
	cycles=i2c_ReadByte();
*/
