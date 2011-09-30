 /***********************************************************
  *   Program:    LCD driver header
  *   Created:    27.8.99 20:26
  *   Author:     Brajer Vlado
  *                 vlado.brajer@kks.s-net.net
  *   Comments:   functions & definitions
  ************************************************************/
// LCD is connected on PORTA in 4bit mode
#include <io.h>
#include <stdio.h>
#include <stdarg.h>                     // just for printf

typedef unsigned char byte;

void lcd_delay(unsigned int p);
void toggle_E();
void lcd_init(void);
void lcd_cls();
void lcd_home();
void lcd_control(byte disonoff, byte curonoff, byte curblink);
void lcd_goto(byte mesto);
void lcd_putch(byte data);
void lcd_putstr(byte *data);
void printbin(byte x, byte ch0, byte ch1);
void printhex(byte i);
void printdec(unsigned int x, unsigned char n, unsigned char fillch);
void print10(unsigned long x);

int printf(const char *format, ...);
