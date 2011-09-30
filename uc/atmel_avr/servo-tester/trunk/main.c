
//*****************************************************************************
//
// Fichier		: 'main.c'
// Title		: Commande d'un Turboréacteur
// Author		: Sébastien Celles
// Creation		: 2008
// Revision		: 10/6/2008
// Version		: 1
// uC Cible		: ATMega16
// Compilateur	: AVR-gcc
// Editor Tabs	: 4
//
//	Description : Ce fichier contient le programme principal du projet.
//
//*****************************************************************************


/*

La valeur est envoyée du PC par Lbview ou HT via USB (com serie virtuel)
Elle est renvoyée au PC pour control (via HT ou Labview)

* Sorties :
PC0 = Circuit en fonctionnement - LED VERTE
PD7 = Sortie PWM - temoin commande - LED ROUGE
PD5 = Sortie PPM - Commande servomoteur

* ISP:

PB5 = MOSI
PB6 = MISO
PB7 = SCK
PIN9 = !RESET
GND

* COM SERIE
PD0 = RXD
PD1 = TXD

* ARRET D'URGENCE
PD2 en entrée avec résistance de trirage

*/
#define F_CPU        8000000               		// 8MHz processor

#include <avr/io.h>			// Bibliothèque AVR-gcc gérant les E/S
#include <avr/wdt.h>		// Bibliothèque AVR-gcc gérant le chien de garde
#include <avr/interrupt.h>	// Bibliothèque AVR-gcc gérant les interruptions
#include <util/delay.h>		// Bibliothèque AVR-gcc gérant les temporisations

#define PERIOD 20000
#define MIN_WIDTH 1000
#define MAX_WIDTH 2000
#define MED_WIDTH 1500

#include "global.h"		// Paramètres généraux
#include "uart.h"		// Bibliothèque AVRLIB - gestion de l'USART
#include "rprintf.h"	// Bibliothèque AVRLIB - gestion des fonctions d'affichages
#include "timer.h"		// Bibliothèque AVRLIB - gestion des timers (timer, PWM, etc)
#include "vt100.h"		// Bibliothèque AVRLIB - gestion des dialogues avec le terminal

volatile int reception; 		// variable reception de données
volatile int AU = 0; 	// variable 'arret d'urgence'


//Gestion de l'arrêt d'urgence (AU)
ISR ( INT0_vect )
{
	//PORTA++;
	if (AU==0)
		AU=1;
	else
		AU=0;			//remise en route par nouvel appui sur AU, ne semble pas fonctionner
	OCR1A = MIN_WIDTH;
	OCR2 = 0;
	//rprintf("Arret urgence\r\n");	//fait planter le programme ?!
	uartFlushReceiveBuffer();
	while(!PD2);		//attente relachement de l'AU
	//_delay_ms(10);
}

void init_interrupt0(void)
{
	//MCUCR = 0;			//declenchement sur niveau bas
	MCUCR = 2;			//declenchement sur front descendant
	GICR = _BV(INT0);	//validation de l'interruption sur INT0
	sei();				//autorisation globale des interruptions
}


void init_uart(void) 
{
	// initialisation de l'UART (port série sur PD0 & PD1)
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
	rprintf("Commande Servomoteur\r\n");
	rprintf("IUT de Poitiers\r\n");
}

void init_output(void) {
   // OC1A as output
   DDRD |= (1<<PD5);
   // TOP, set for 50Hz (20ms)
   ICR1 = PERIOD;
   // PAR DEFAUT / GAZ à 0 (1ms)
   OCR1A = MIN_WIDTH;
   // Timer 1 fast PWM mode 14
   // Clear on compare, set at TOP
   TCCR1A = (1<<COM1A1)|(1<<WGM11);
   TCCR1B = (1<<WGM13)|(1<<WGM12)|(0<<CS12)|(1<<CS11)|(0<<CS10); // clk=8Mhz - prescaler=8

}



int main(void)
{
// initialisation du chien de guarde 1s
	wdt_reset();
	wdt_enable(WDTO_1S);

	/* Voyant ON */
	DDRC |= (1<<DDC0);
	PORTC |= (1<<PC0);

	/* temoin consigne et arret d'urgence */
	DDRD |= (0<<DDD2)|(1<<DDD7);
	PORTD |= (1<<PD2)|(1<<PD7);

	DDRA = 0xFF;

// initialisation timer 2 (temoin consigne)
	TCCR2 = (0<<FOC2)|(1<<WGM20)|(1<<COM21)|(0<<COM20)|(1<<WGM21)|(0<<CS22)|(0<<CS21)|(1<<CS20);
	OCR2 = 0;

	init_interrupt0();
	init_uart();
	init_output();
		
	
	while (1)
      {
		// 8bits
		reception = -1;
		while(reception==-1) 
		{
			wdt_reset();
			if (AU==0)
			{
				reception = uartGetByte();
			}
			else	//clignottement led temoin consigne si AU
			{
				_delay_ms(30);
				PORTC |= (0<<PC0);
				OCR2=0;
				_delay_ms(30);
				PORTC |= (1<<PC0);
				OCR2 = 255;
			}
		}
		OCR1A = ((((double) reception)*1000.0)/255.0) + MIN_WIDTH;
		OCR2 = reception; /* voyant Consigne */
		rprintf("Commande Servo - Throttle=%d%%\r\n", (reception*100)/255);
      };

	return 0;
}























