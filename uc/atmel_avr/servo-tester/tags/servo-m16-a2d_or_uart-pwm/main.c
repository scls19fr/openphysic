#include <avr/io.h>

#define PERIOD 20000
#define MIN_WIDTH 1000
#define MAX_WIDTH 2000
#define MED_WIDTH 1500

#include "global.h"		// include our global settings
#include "a2d.h"		// include A/D converter function library
#include "uart.h"		// include uart function library
#include "rprintf.h"	// include printf function library
#include "timer.h"		// include timer function library (timing, PWM, etc)
#include "vt100.h"		// include VT100 terminal library

enum mode { A2D_MODE = 0, UART_MODE};

volatile uint8_t mode;

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
	rprintf("Servo tester-S.CELLES\r\n");
	rprintf("Sebastien CELLES\r\n");
	rprintf("IUT de Poitiers\r\n");
	rprintf("Genie Thermique et Energie\r\n");
}

void init_output(void) {
   // OC1A as output
   DDRD |= (1<<PD5);
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
volatile unsigned short pos; // 16 bits

int main(void)
{
	/* Voyant ON */
	DDRD |= (1<<DDD6);
	PORTD |= (1<<PD6);

	/* Voyant POWER sur OC2 */
	DDRD |= (1<<DDD7);
	PORTD |= (1<<PD7);
	TCCR2 = (0<<FOC2)|(1<<WGM20)|(1<<COM21)|(0<<COM20)|(1<<WGM21)|(0<<CS22)|(0<<CS21)|(1<<CS20);
    OCR2=0;

	init_uart();
	init_output();
	
	/* Mode 0=A2D 1=UART */
	//mode=A2D_MODE;
	DDRB &= ~(1<<PB0); // digital input for mode 

	a2dInit(); // init analog to digital converter
	
	
	while (1)
      {
	  		mode=PINB & (1<<PB0); /* get mode A2D=0 or UART=1*/

			if (mode == UART_MODE) {
				// 8bits
				pos8=-1;
				while(pos8==-1 && mode==UART_MODE) {
					pos8=uartGetByte();
			  		mode=PINB & (1<<PB0); /* get mode A2D=0 or UART=1*/
				}
				OCR1A=((((double) pos8)*1000.0)/255.0) + MIN_WIDTH;
				OCR2=pos8; /* voyant POWER */
			}
			else { //if (mode == A2D_MODE) {
				//pos=a2dConvert8bit(0);
				//pos=a2dConvert8bit(0);
				pos=a2dConvert10bit(0);
				//OCR1A=(pos<<2) + MIN_WIDTH; // 1000 approx 1024
				//OCR1A=((((double) pos)*1000.0)/255.0) + MIN_WIDTH;
				OCR1A=((((double) pos)*1000.0)/1023.0) + MIN_WIDTH; /* */
				OCR2=pos>>2; /* voyant POWER */
			}

			rprintf("Testeur de servo en cours - Sebastien CELLES - Mode=%d - Throttle=%d\r\n",mode, OCR2);
      };

	return 0;
}
