#include <htc.h>
#include "lcd.h"

void
main(void)
{
	lcd_init();
	lcd_goto(0);	// select first line
	lcd_puts("1234567890123456");
	lcd_goto(0x40);	// Select second line
	lcd_puts("Hello world");

	while(1) {
	}
}
