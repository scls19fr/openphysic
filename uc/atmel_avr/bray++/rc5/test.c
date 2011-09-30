 /************************************************************
  *   Program:    AVRGCC - RC5 Test
  *   Created:    17.9.99 17:23
  *   Author:     Brajer Vlado - vlado.brajer@kks.s-net.net
  *   Comments:   RC5 decoder
  ************************************************************/
#include <io.h>
#include <interrupt.h>
#include <signal.h>
#include "lcd.h"

unsigned int heartbeat=0;

// RC5 variables & definitions
#define PRSC1_SELECT 2                              // timer CLK/8
#define TRUE 1
#define FALSE 0
#define IRDet bit_is_set(PIND,PD2)
volatile unsigned char RC5RxAddress, RC5RxCommand;
volatile unsigned char RC5Avail=0, RC5Repeat, RC5PhaseErr;

void delay(unsigned int p)
{
  unsigned int i;
  unsigned char j;
  for(i=0;i<p;i++)
    for (j=0;j<100;j++);
}

/* signal handler for timer1 overflow interrupt */
SIGNAL(SIG_OVERFLOW1)
{
  static unsigned char RC5BitCnt=0;
  static unsigned int RC5Data;
  static unsigned char OldValue;
  static unsigned char ControlBit;

  // Load Timer again...
  outp(0xFC, TCNT1H);                  // set TCNT1  // 889us
  outp(0x87, TCNT1L);                  // set TCNT1

  if (RC5BitCnt==0) {
    RC5Data=0;
    OldValue=IRDet;
    RC5PhaseErr=FALSE;
  }

  if (RC5BitCnt<24) {                   // sample 24 bits
    if (RC5BitCnt & 0x01) {
      if (OldValue!=IRDet) {            // check for Biphase error
        RC5Data <<= 1;                  // next bit;
        if (IRDet) RC5Data &= 0xFFFE; else RC5Data |= 0x0001;
      } else RC5PhaseErr=TRUE;          // biphase error
    }
    RC5BitCnt++;
    OldValue=IRDet;                     // remember signal level

  } else {                              // if >24 then finish
    outp(0 , TCCR1B);                   // stop timer 1
    RC5BitCnt=0;                        // prepare for next time
    if (!RC5PhaseErr && !RC5Avail) {
      RC5Repeat=ControlBit==((RC5Data & 0x0800)==0x0800);   // if new controlbit=old then RC5Repeat=1
      ControlBit=((RC5Data & 0x0800)==0x0800);              // new controlbit
      RC5RxAddress=(unsigned char)((RC5Data & 0x07C0)>>6);
      RC5RxCommand=(unsigned char)(RC5Data & 0x003F);
      RC5Avail=TRUE;                                        // RC5 code is vailable...
    }
    RC5PhaseErr=FALSE;
    outp(0x40, GIMSK);
  }
}

/* signal handler for external interrupt int0 */
SIGNAL(SIG_INTERRUPT0)
{
  outp(0x00, GIMSK);                    // disable external int0
  outp(0xF3, TCNT1H);                   // set TCNT1 // 3111 us
  outp(0xD9, TCNT1L);                   // set TCNT1
  outp(PRSC1_SELECT, TCCR1B);           // start timer1
}

/* initialize RC5 decoder */
void RC5_init(void)
{
    cbi(DDRD,PD2);
    sbi(PORTD,PD2);

    outp((1<<ISC01), MCUCR);            // raise int0 on falling edge
    outp(0x40, GIMSK);                  // enable external int0

    outp(0x80, TIMSK);                  // enable timer1 Overflow interrupts
    outp(0x00, TCCR1A);                 // disable PWM and stuff
    outp(0x00, TCCR1B);
    outp(0xF3, TCNT1H);                 // set TCNT1 // 3111 us
    outp(0xD9, TCNT1L);                 // set TCNT1
}

/* main routine for testing */
int main(void)
{
    sei();                              // enable interrupts

    RC5_init();
    lcd_init();

    lcd_control(1,0,0);
    lcd_putstr("RC5 decoder");
    lcd_goto(0x49);
    lcd_putstr("PErr=");
    while(1)
    {
      lcd_goto(0x0E);
      printhex(heartbeat++);            // heart beat :)

      if (RC5Avail) {                   // display new RC5 data
        lcd_goto(0x40);
        printhex(RC5Repeat);
        lcd_putch(' ');
        printhex(RC5RxAddress);
        lcd_putch(' ');
        printhex(RC5RxCommand);
        RC5Avail=FALSE;                 // ready to get new one
      }
      lcd_goto(0x4E);
      printhex(RC5PhaseErr);            // error check
      delay(1000);
    }
}
