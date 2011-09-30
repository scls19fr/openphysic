#include <avr/io.h>
//#include <avr/interrupt.h>
//#include <avr/signal.h>

#include <stdint.h> // uint8_t = unsigned char

//#include <uart.h>

#include "uart.h"		// include uart function library
#include "rprintf.h"	// include printf function library
//#include "a2d.h"		// include A/D converter function library
#include "timer.h"		// include timer function library (timing, PWM, etc)
#include "vt100.h"		// include VT100 terminal library


#define BYTES 6
uint8_t data[BYTES];

/*
   0|    1|   2|   3|    4|   5
DDRB|PORTB|PINB|DDRC|PORTC|PINC
*/

/*
enum mode { input = 0x00, output=0xFF};

typedef struct data_
{
	uint8_t key0;
	uint8_t key1;
	uint8_t mode1;
	uint8_t port1;
	uint8_t mode2;
	uint8_t port2;
	uint8_t checksum;
}
data;

data current_data;
*/

cBuffer* buff;

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
	rprintf("\r\nWelcome to Digital Input/Output!\r\n");
}

void init_ports(void) {
	DDRB=0x00; // port A as input
	PORTB=0xFF;

	DDRC=0x00; // port C as input
	
	DDRC=0xFF; // port C as output
	PORTC=0xFF;
	//PORTC=~0x01;
}


void to_data(void) {
	// avant l'envoi de la trame vers le PC
	data[0]=DDRB;
	//if (DDRA==0x00) { // entree
		data[1]=PORTB;
		data[2]=PINB;
	//}

	data[3]=DDRC;
	//if (DDRC==0x00) { // entree
		data[4]=PORTC;
		data[5]=PINC;
	//}
}

void from_data(void) {
	// apres reception de la trame par la carte

	DDRB=data[0];
	//if (DDRA==0xFF) { // sortie
		PORTB=data[1];
		PINB=data[2];
	//}

	DDRC=data[3];
	//if (DDRC==0xFF) { // sortie
		PORTC=data[4];
		PINC=data[5];
	//}
}

void test_data(void) {
	//data[0]=0XFF;
	//data[1]=0XFF;
	//data[2]=0XFF;
	//data[3]=0XFF;
	//data[4]=0x80; //0XFF;
	//data[5]=0x00; //0XFF;
	
	data[0]=0X01;
	data[1]=0X02;
	data[2]=0X03;
	data[3]=0X04;
	data[4]=0x05;
	data[5]=0x06;
}

void computer_to_board(void) {
	//rprintf("computer_to_board\r\n");

	buff = uartGetRxBuffer();

	uint8_t i;
	for(i=0;i<BYTES;i++) {
		data[i]=bufferGetAtIndex(buff, i);
	}

	test_data();
	
	from_data();
	
	//uartFlushReceiveBuffer
}

void board_to_computer(void) {
	//rprintf("board_to_computer\r\n");

	to_data();
	
	//test_data();
	
	//uartAddToTxBuffer(0xAF);
	//uartAddToTxBuffer(0xB0);
	
	uint8_t i;
	for(i=0;i<BYTES;i++) {
		uartAddToTxBuffer(data[i]);
	}

   //rprintf("uartRxBuffer.datalength=%d",uartRxBuffer.datalength);

	uartSendTxBuffer();

	
	rprintf("\r\n");
	for(i=0;i<BYTES;i++) {
		rprintf("%d ",data[i]);
	}
	rprintf("\r\n");

}


int main(void) {
	init_uart();
	init_ports();

   while(1) {
   	board_to_computer();
   	computer_to_board();
   }
}


