 /***********************************************************
  *   Program:    PC Keyboard
  *   Created:    07.09.99 21:05
  *   Author:     V. Brajer - vlado.brajer@kks.s-net.net
  *               http://www.sparovcek.net/bray
  *               based on Atmel's AVR313 application note
  *   Comments:   AVRGCC port - original for IAR C
  ************************************************************/
#include <io.h>
#include <interrupt.h>
#include <signal.h>
#include "pckb.h"
#include "scancodes.h"

#define BUFF_SIZE 16

volatile unsigned char edge, bitcount;                // 0 = neg.  1 = pos.
unsigned char kb_buffer[BUFF_SIZE];
unsigned char *inpt, *outpt;
volatile unsigned char buffcnt;

void init_kb(void)
{
    outp(0x02, MCUCR);                      // INT0 interrupt on falling edge
    outp(0x40, GIMSK);                      // enable external int0
    edge = 0;                               // 0 = falling edge  1 = rising edge
    bitcount = 11;

    inpt =  kb_buffer;                      // Initialize buffer
    outpt = kb_buffer;
    buffcnt = 0;
}

/* signal handler for external interrupt int0 */
SIGNAL(SIG_INTERRUPT0)
{
    static unsigned char data;                // Holds the received scan code

    if (!edge)                                // Routine entered at falling edge
    {
        if(bitcount < 11 && bitcount > 2)    // Bit 3 to 10 is data. Parity bit,
        {                                    // start and stop bits are ignored.
            data = (data >> 1);
            if(bit_is_set(PIND,PD4)) data = data | 0x80;
        }
        outp(0x03, MCUCR);                  // Set interrupt on rising edge
        edge = 1;
    }
    else
    {                                       // Routine entered at rising edge
        outp(0x02, MCUCR);                      // Set interrupt on falling edge
        edge = 0;
        if(--bitcount == 0)                    // All bits received
        {
            decode(data);
            bitcount = 11;
        }
    }
}


void decode(unsigned char sc)
{
    static unsigned char is_up=0, shift=0;
    unsigned char i;

    if (!is_up)                // Last data received was the up-key identifier
    {
        //outp(sc,PORTB);                   // show me scancode - for debuging
        switch (sc)
        {
          case 0xF0 : is_up = 1; break;      // The up-key identifier
          case 0x12 : shift = 1; break;      // Left SHIFT
          case 0x59 : shift = 1; break;      // Right SHIFT

          default:
            if(!shift)                    // If shift not pressed,
            {                             // do a table look-up
                for(i = 0; unshifted[i][0]!=sc && unshifted[i][0]; i++);
                if (unshifted[i][0] == sc) {
                    put_kbbuff(unshifted[i][1]);
                }
            } else {                    // If shift pressed
                for(i = 0; shifted[i][0]!=sc && shifted[i][0]; i++);
                if (shifted[i][0] == sc) {
                    put_kbbuff(shifted[i][1]);
                }
            } break;
        }
    } else {
        is_up = 0;                            // Two 0xF0 in a row not allowed
        switch (sc)
        {
          case 0x12 : shift = 0; break;                      // Left SHIFT
          case 0x59 : shift = 0; break;                      // Right SHIFT
          case 0x76 : lcd_cls(); break;                      // ESC - clear my LCD
        }
    }
}

void put_kbbuff(unsigned char c)
{
    if (buffcnt<BUFF_SIZE)                        // If buffer not full
    {
        *inpt=c;                                // Put character into buffer
        inpt++;                                    // Increment pointer
        buffcnt++;
        if (inpt >= (kb_buffer + BUFF_SIZE)) inpt = kb_buffer;
    }
}

unsigned char getchar(void)
{
    unsigned char byte;

    while(buffcnt==0);                        // Wait for data

    byte = *outpt;                                // Get byte
    outpt++;                                    // Increment pointer
    if (outpt >= (kb_buffer + BUFF_SIZE)) outpt = kb_buffer;
    buffcnt--;                                    // Decrement buffer count
    return byte;
}

