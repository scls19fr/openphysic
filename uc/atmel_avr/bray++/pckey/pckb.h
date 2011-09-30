 /***********************************************************
  *   Program:    PC Keyboard
  *   Created:    07.09.99 21:08
  *   Author:     V. Brajer - vlado.brajer@kks.s-net.net
  *               http://www.sparovcek.net/bray
  *               based on Atmel's AVR313 application note
  *   Comments:   AVRGCC port - original for IAR C
  ************************************************************/
#define ISC00 0
#define ISC01 1

void init_kb(void);
void decode(unsigned char sc);
void put_kbbuff(unsigned char c);
unsigned char getchar(void);

