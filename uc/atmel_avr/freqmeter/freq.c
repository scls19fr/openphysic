// from http://www.jelectronique.com/pwm.php
// pwm_atmega32 pour la génération du signal

#include <stdint.h>

#include <math.h>


#define F_CPU 8000000UL

//#define N 1024UL
#define N 256UL


#include <avr/io.h>

#include <avr/interrupt.h>

#include <stdio.h>
#include "lcd.h"	//Fonction de gestion LCD (Fleury)
#include "lcd.c"

#define RPMpc_Min 0.0
#define RPMpc_Max 100.0

#define RPM_Min 0.0
#define RPM_Max 15000.0

#define N_Bar 10 /* nombre de barres du RPMmetre */


// Declare your global variables here

uint16_t FRQ_COUNT = 0x00; //0x1866;
//uint16_t FREQ = 0;
double FREQ = 0.0;
double RPM = 0.0;
double RPMpc = 0.0;

static FILE lcdout = FDEV_SETUP_STREAM( (void *)lcd_putc, NULL,_FDEV_SETUP_WRITE );

inline uint16_t roundp16(double n)
{
    return floor(n+0.5);
}

void calc_rpm(void) {
   if ( FRQ_COUNT != 0) {
      FREQ = ((double) F_CPU) / (((double) N) * ((double) (FRQ_COUNT+0.5)));
   } else {
      FREQ = 0; // évite d'afficher n'importe quoi au départ
   }
   RPM = FREQ * 60.0;
}

void display(void) {
   lcd_clrscr();

   lcd_gotoxy(0,0); 	//Curseur  1ère colonne 1ère ligne

   calc_rpm();
   
   printf("%5dRPM",(uint16_t) roundp16(RPM/10.0)*10);

   printf(" ");

   RPMpc = (RPM - RPM_Min) / (RPM_Max - RPM_Min) * 100;
   if ( RPMpc < 0 ) {
      RPMpc = 0;
   }
   if (RPMpc > 100) {
      RPMpc = 100;
   }
   uint8_t i;
   uint8_t Nbar_todisp;
   Nbar_todisp = floor(RPMpc/10+0.5);
   for ( i=0 ; i < Nbar_todisp ; i++ )
   {
      printf("|");
   }
   for ( i=Nbar_todisp ; i < N_Bar ; i++ )
   {
      printf("-");
   }

   lcd_gotoxy(0,1);
   //printf(" - ");
   printf("%3dHz",(uint16_t) roundp16(FREQ));
   //printf("%fRPM - %fHz",FREQ*60.0,FREQ);
   //lcd_gotoxy(0,1);
   //lcd_puts("Hello");
   //printf("T=%i ms",((1.0/FREQ)*1000));
}

void init_lcd(void) {
   // Port des bits de données du lcd
   PORTC=0x00;
   DDRC=0xFF; //Port en sortie
   // Port des bits de controles du lcd
   PORTB=0x00;   // R/W=0
   DDRB=0xFF;//Port en sortie

   lcd_init(LCD_DISP_ON_CURSOR_BLINK); //Initialisation curseur clignotant
   lcd_command(LCD_DISP_ON); //curseur éteint

   stdout = &lcdout; // printf

   lcd_clrscr(); //efface l'écran
   //Active la gestion des accents français	éèêëàùçô
   lcd_ChargeAccentsFrancais(); // Charge 8 caractères accentués dans la CGRAM et active leur utilisation
}


void init_frequencemeter_8bits(void) {
// init the counter
TCNT0=0x00; // initial value
// prescaler (shared with TIMER/COUNTER1 on ATmega32)
//TCCR0=0x03;	        //Lancement du comptage avec prédiv de 64
TCCR0=(1<<CS02)|(0<<CS01)|(1<<CS00); // prédiv de 1024
//TCCR0=(1<<CS02)|(0<<CS01)|(0<<CS00); // prédiv de 256
//TCCR0=(0<<CS02)|(1<<CS01)|(1<<CS00); // prédiv de 64
//TCCR0=(0<<CS02)|(1<<CS01)|(0<<CS00); // prédiv de 8
//TCCR0=(0<<CS02)|(0<<CS01)|(1<<CS00); // pas de prédiv
}

void init_frequencemeter_16bits(void) {
// init the counter
TCNT1H=0x00; // initial value
TCNT1L=0x00;

TCCR1A = (0<<WGM11)|(0<<WGM10); //0x00;
TCCR1B = (0<<WGM13)|(0<<WGM12)|(1<<CS12)|(0<<CS11)|(0<<CS10);
// prescaler (shared with TIMER/COUNTER1 on ATmega32)
//TCCR1A=(1<<CS02)|(0<<CS01)|(1<<CS00);
//TCCR0=(1<<CS02)|(0<<CS01)|(1<<CS00); // prédiv de 1024
//TCCR0=(1<<CS02)|(0<<CS01)|(0<<CS00); // prédiv de 256
//TCCR0=(0<<CS02)|(1<<CS01)|(1<<CS00); // prédiv de 64
//TCCR0=(0<<CS02)|(1<<CS01)|(0<<CS00); // prédiv de 8
//TCCR0=(0<<CS02)|(0<<CS01)|(1<<CS00); // pas de prédiv
}

int main(void)
{
// Declare your local variables here

// init the external interrupt
MCUCR |= (1<<ISC01) | (1<<ISC00); // rising edge INT0 ATmega32
GICR |= (1<<INT0);
sei(); // enable interrupts

//init_frequencemeter_8bits();
init_frequencemeter_16bits();

// init output (for test)
//DDRA=0xFF; // port A en sortie
//PORTA=0xFF; // switch off led

init_lcd();


while (1)
      {
      display();
      asm("nop");          // Inline assembly example
      asm("nop");          // Inline assembly example
      };

return 0;
}

/*
 * interrupt handler for INT0 (input)
 */
ISR(INT0_vect)
{
	 //FRQ_COUNT = TCNT0; // 8 bits timer
	 FRQ_COUNT = (TCNT1L)|(TCNT1H<<8); // 16 bits timer (lower bit must be read before)
	
    //PORTA=~PORTA; // test interrupt
    //PORTA=~TCNT0;

    // counter
    //TCNT0=0x00; // initialize counter 8bits

    TCNT1H=0x00; // initialize counter 16bits
    TCNT1L=0x00;
}















