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
#include <stdarg.h>

typedef unsigned char byte;

void lcd_delay(unsigned int p);
void toggle_E();
void lcd_cls();
void lcd_home();
void lcd_control(byte disonoff, byte curonoff, byte curblink);
void lcd_goto(byte mesto);
void lcd_putch(byte data);
void lcd_putstr(byte *data);
void printbin(byte x);
void printhex(byte i);
void print2(unsigned int x);
void print3(unsigned int x);
void print5(unsigned int x);
void print10(unsigned long x);
void lcd_init(void);
int printf(const char *format, ...);
