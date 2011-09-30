#include <avr/io.h>

#define PERIOD 20000
#define MIN_WIDTH 1000
#define MAX_WIDTH 2000
#define MED_WIDTH 1500

#include "global.h"		// include our global settings
//#include "a2d.h"		// include A/D converter function library
#include "uart.h"		// include uart function library
#include "rprintf.h"	// include printf function library
#include "timer.h"		// include timer function library (timing, PWM, etc)
#include "vt100.h"		// include VT100 terminal library


void init_uart(void) {
	// initialize our libraries
	// initialize the UART (serial port)
	uartInit();
	// set the baud rate of the UART for our debug/reporting output
	uartSetBaudRate(9600);
	// set uartSendByte as the output for all rprintf statements
	rprintfInit(uartSendByte);
	// initialize the timer system
	timerInit();
	// initialize vt100 library
	vt100Init();
	vt100ClearScreen();
	// print a little intro message so we know things are working
	//rprintf("Servo tester-S.CELLES\r\n");
	//rprintf("Sebastien CELLES\r\n");
	//rprintf("IUT de Poitiers\r\n");
	//rprintf("Genie Thermique et Energie\r\n");
}

void init_output(void) {
   // OC1A as output
   DDRB |= (1<<PB1);
   // TOP, set for 50Hz (20ms)
   ICR1 = PERIOD;
   // Center outputs (1.5ms)
	//OCR1A = MIN_WIDTH;
   OCR1A = MED_WIDTH;
   //OCR1A = MAX_WIDTH;
   // Timer 1 fast PWM mode 14
   // Clear on compare, set at TOP
   TCCR1A = (1<<COM1A1)|(1<<WGM11);
   //TCCR1B = (1<<WGM13)|(1<<WGM12)|(0<<CS12)|(0<<CS11)|(1<<CS10); // clk=1Mhz - no prescaler
   TCCR1B = (1<<WGM13)|(1<<WGM12)|(0<<CS12)|(1<<CS11)|(0<<CS10); // clk=8Mhz - prescaler=8

}

volatile int pos8; // 8 bits
//volatile unsigned short pos; // 16 bits

int main(void)
{
	/* Voyant ON */
	DDRD |= (1<<DDD7);
	PORTD |= (1<<PD7);

	/* Voyant POWER */
	DDRB |= (1<<DDB3);
	PORTB |= (1<<PB3);
	TCCR2 = (0<<FOC2)|(1<<WGM20)|(1<<COM21)|(0<<COM20)|(1<<WGM21)|(0<<CS22)|(0<<CS21)|(1<<CS20);
    OCR2=0;


	init_uart();
	init_output();
		
	
	while (1)
      {
		// 8bits
		pos8=-1;
		while(pos8==-1) {
			pos8=uartGetByte();
		}
		OCR1A=((((double) pos8)*1000.0)/255.0) + MIN_WIDTH;
		OCR2=pos8; /* voyant POWER */

		rprintf("Testeur servo UART-S.CELLES-Throttle=%d\r\n", OCR2);
      };

	return 0;
}























