#include <pic.h>
#include "lcd.h"
#include "delay.h"
#include <stdio.h>

int i;

#define NB_COLS 20 //16
#define NB_LINES 4 //2

#define L1_OFFSET 0x0
#define L2_OFFSET 0x40 // 64
#define L3_OFFSET 0x14 // 0x40-22*2
#define L4_OFFSET 0x54 // 0x40+20

char buffer[NB_COLS*NB_LINES+1];
int nbc;

void test_lcd(void) {
	//lcd_puts("1234567890123456");
	//lcd_puts("12345678901234567890");
	//lcd_puts("+-+-+-+-+-+-+-+-");
	//lcd_puts("*-*-*-*-*-*-*-*-");

	lcd_goto(L1_OFFSET);	// select first line
	//nbc = sprintf(buffer, "L1: 5678901234567890L2: 5678901234567890L3: 5678901234567890L4: 5678901234567890");
	//nbc = sprintf(buffer, "*********************  OpenChrono      **   by S. Celles   *********************");
	//lcd_puts(buffer);
	lcd_puts("L1: 567890123456");
	lcd_goto(L2_OFFSET);	// Select second line
	//lcd_puts("1234567890123456");
	lcd_puts("L2: 5678901234567");
	lcd_goto(L3_OFFSET);
	lcd_puts("L3: 56789012345678");
	lcd_goto(L4_OFFSET);
	lcd_puts("L4: 567890123456789");

	//nbc = sprintf(buffer, "i=%03d",i);
	//lcd_puts(buffer);
	//lcd_goto(0x80);
	//lcd_goto(0x40+NB_COLS); // no cursor
	//DelayMs(1000);
	//lcd_clear();
}

void main(void) {
	i=0;

	lcd_init();

	while(1) {
		test_lcd();	

		i=i+1;
		DelayMs(1000);
	}
}
