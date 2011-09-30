/*
 * Générateur de Signaux Basses Fréquence
 *
 * Function Generator
 *  http://en.wikipedia.org/wiki/Function_generator
 *
 * Sébastien CELLES
 *
 * Under GNU General Public License v2 and above
 *
 * See also this project
 *  http://www.scienceprog.com/avr-dds-signal-generator-v10
 */

/* TO DO
Gestion de la fréquence
 */

#include <avr/io.h>
#include <avr/interrupt.h>

#include <math.h>
#define PI 4*atan(1)
#include <stdlib.h> // for rand()

#define F_CPU 8000000UL  // 8 MHz
//#define RESOLUTION F_CPU/(9*16777216);
#define RESOLUTION 0.052981906467013888888888888888889

#define MIN 0x00
#define MAX 0xFF
#define MID 0x80

#define PORTOUT PORTD

uint8_t i;

double time;

#define N 256 // nb de valeurs precalculees
uint8_t tab_signal[N];
//uint8_t * ptr_tab_signal[];


struct signal
{
	uint32_t freq;
   //double freq;
   double alpha;
   double amplitude;
   double offset;
   void (*init) (void);     // ptr de fct sur fonction de calcul
};

struct signal sgn;

inline void func_test_signal_inc(void) {
   PORTOUT++;
}

inline void func_test_signal_dec(void) {
   PORTOUT--;
}


void init_func_constant(void) {
   uint8_t j = 0;
	do {
	   tab_signal[j] = MID; // MIN MAX MID //(&sgn)->offset;
	   j++;
	} while(j!=0);
}


// sine wave
//void init_func_sin2(void) {
//   uint16_t j;  // uint16_t instead of uint8_t to fix the problem of limits
//   tab_signal[0] = 0; // to fix the problem of 0
//	for(j = 1 ; j<N ; j++ ) {
//	   tab_signal[j] = -(MID-1) * cos(2*PI/N*j) + MID;	// - is to fix the problem
//	}
//}

void init_func_sin(void) {
   uint8_t j = 0;
   tab_signal[0] = 0; // to fix the problem of 0
   j = 1;
	do {
	   tab_signal[j] = -(MID-1) * cos(2*PI/N*j) + MID;	// - is to fix the problem
	   j++;
	} while(j!=0);
}

// square
void init_func_square(void) {
   uint8_t j = 0;
   uint8_t Nmid;
   Nmid = N*(&sgn)->alpha;

	do {
	   tab_signal[j] = MAX;
	   j++;
	} while(j!=Nmid);
	
	do {
	   tab_signal[j] = MIN;
	   j++;
	} while(j!=0);	
}

// sawtooth (dent de scie croissante)
void init_func_sawtooth(void) {
   uint8_t j = 0;

	do {
	   tab_signal[j] = j;
	   j++;
	} while(j!=0);
}

// inverted sawtooth (dent de scie décroissante)
void init_func_sawtooth_inv(void) {
   uint8_t j = 0;

	do {
	   tab_signal[j] = 255-j;
	   j++;
	} while(j!=0);
}

// triangle
void init_func_triangle(void) {
   uint8_t j = 0;
   uint8_t Nmid;
   Nmid = N*(&sgn)->alpha;

	do {
	   tab_signal[j] = j/(&sgn)->alpha;
	   j++;
	} while(j!=Nmid);
	
	do {
	   tab_signal[j] = 255-(j-Nmid)/(1-(&sgn)->alpha);
	   j++;
	} while(j!=0);	
}
	
void init_signal(void) {
	(&sgn)->freq = 1000; //.0;
	(&sgn)->alpha = 0.5;
	(&sgn)->amplitude = 1.0;
	(&sgn)->offset = 0.0; // MIN MAX MED

	(&sgn)->init = &init_func_sin;
	//(&sgn)->init = &init_func_square;
	//(&sgn)->init = &init_func_constant;
	//(&sgn)->init = &init_func_sawtooth;
	//(&sgn)->init = &init_func_sawtooth_inv;
	//(&sgn)->init = &init_func_triangle;
	// random
	
	(&sgn)->init();
}

void static inline signalOUT(uint8_t *tab_sgn, uint8_t ad2, uint8_t ad1, uint8_t ad0)
{
asm volatile(	"eor r18, r18 	;r18<-0"	"\n\t"
				"eor r19, r19 	;r19<-0"	"\n\t"
				"1:"						"\n\t"
				"add r18, %0	;1 cycle"			"\n\t"
				"adc r19, %1	;1 cycle"			"\n\t"	
				"adc %A3, %2	;1 cycle"			"\n\t"
				"lpm 			;3 cycles" 	"\n\t"
				"out %4, __tmp_reg__	;1 cycle"	"\n\t"
				"rjmp 1b		;2 cycles. Total 9 cycles"	"\n\t"
				:
				:"r" (ad0),"r" (ad1),"r" (ad2),"e" (tab_sgn),"I" (_SFR_IO_ADDR(PORTOUT))
				:"r18", "r19"
	);
}

int main(void) {
   /* enable PORT Dx as output (led) */
   DDRD = 0xFF;

   PORTOUT = 0xFF; // PORTB TO FIX DAC problem
   PORTOUT = 0x00;

   /* variable for test purpose */
   //i = 0;

   /* init counter */
   OCR1AH = 0x00;
   OCR1AL = 0x00;
   //OCR1AH=0x03; //Ox00
   //OCR1AL=0x20; //0x63

	TCCR1A = 0x00;
	TCCR1B = (0<<CS12)|(1<<CS11)|(1<<CS10); //(0<<CS12)|(0<<CS11)|(1<<CS10);
	
   //TCCR1B |=(1<<WGM12)|(0<<CS11)|(1<<CS10); //CTC division F_CPU 1  (1<<WGM12)|(1<<CS11)|(1<<CS10)

   TIMSK |= (1<<OCIE1A);

	time = 0.0;

   //sei(); // set interrupt enable

   /* init signal */
   init_signal();

	//uint8_t tmrh;
	//uint8_t tmrl;
	
   /*
   uint8_t freq1 = 0xE8; // 1kHz = 0x0003E8
   uint8_t freq2 = 0x03;
   uint8_t freq3 = 0x00;
   uint32_t frequency=(((uint32_t)(freq3)<<16)|((uint32_t)(freq2)<<8)|((uint32_t)(freq1)));
   uint32_t temp = (uint32_t) (frequency/RESOLUTION);
   uint8_t tfreq1 = (uint8_t) (temp);
   uint8_t tfreq2 = (uint8_t) (temp>>8);
   uint8_t tfreq3 = (uint8_t) (temp>>16);
   */	
	
   while(1) {

   	//tmrh = TCNT1H;
   	//tmrl = TCNT1L;
		//time = (double) (((tmrh<<8) + tmrl)/pow(2,16)); // TO FIX

      //(&sgn)->calculate();

      //PORTOUT = rand();

      //i++;
      //PORTOUT = tab_signal[i];

      PORTOUT = tab_signal[TCNT1L];

      //signalOUT(tab_signal, tfreq3, tfreq2, tfreq1);
      //signalOUT(tab_signal, 0x00, 0x03, 0xE8);
      //signalOUT(tab_signal, 0x80, 0xFF, 0xFF);
   }

}



/*
 * interrupt handler for TIMER
 */
//SIGNAL(SIG_OUTPUT_COMPARE1A)
//ISR(TIM1_COMPA_vect)
ISR(SIG_OUTPUT_COMPARE1A)
{
// TO DO
}




