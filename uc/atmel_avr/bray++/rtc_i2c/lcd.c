 /***********************************************************
  *   Program:    LCD driver
  *   Created:    28.8.99 21:32
  *   Author:     Brajer Vlado
  *                 vlado.brajer@kks.s-net.net
  *   Comments:   HITACHI LCD driver (4bit mode) & print stuff
  ************************************************************/
#include "lcd.h"

void lcd_delay(unsigned int p)
{
  unsigned int i;
  byte j;
  for(i=0;i<p;i++)
    for (j=0;j<10;j++);
}

void toggle_E()
{
  outp(inp(PORTA) | 0x20,PORTA);        // E=1
  outp(inp(PORTA) & 0xDF,PORTA);        // E=0
}


/*-----------------27.5.99 20:30--------------------
 *  Display initialization
 *--------------------------------------------------*/
void lcd_init(void)
{
  outp(0xFF,DDRA);
  lcd_delay(10000);
  outp(0x03,PORTA); toggle_E(); lcd_delay(500);
  outp(0x03,PORTA); toggle_E(); lcd_delay(100);
  outp(0x03,PORTA); toggle_E(); lcd_delay(100);
  outp(0x02,PORTA); toggle_E(); lcd_delay(100);
  outp(0x02,PORTA); toggle_E();
  outp(0x08,PORTA); toggle_E(); lcd_delay(100);
  outp(0x00,PORTA); toggle_E();
  outp(0x0F,PORTA); toggle_E(); lcd_delay(100);
  outp(0x00,PORTA); toggle_E();
  outp(0x06,PORTA); toggle_E(); lcd_delay(100);
  lcd_cls();
}


/*-----------------27.5.99 20:33--------------------
 *  Clear display
 *--------------------------------------------------*/
void lcd_cls()
{
  outp(0x00,PORTA); toggle_E();
  outp(0x01,PORTA); toggle_E();
  lcd_delay(1000);
}


/*-----------------27.5.99 20:33--------------------
 *  Home position
 *--------------------------------------------------*/
void lcd_home()
{
  outp(0x00,PORTA); toggle_E();
  outp(0x02,PORTA); toggle_E();
  lcd_delay(1000);
}


/*-----------------27.5.99 20:33--------------------
 *  LCD & Cursor control (Blinking, ON/OFF,...)
 *--------------------------------------------------*/
void lcd_control(byte disonoff, byte curonoff, byte curblink)
{ byte temp;
  outp(0x00,PORTA);
  toggle_E();
  temp=0x08;
  if (disonoff==1) temp|=0x04;
  if (curonoff==1) temp|=0x02;
  if (curblink==1) temp|=0x01;
  outp(temp,PORTA);
  toggle_E();
  lcd_delay(100);
}

/*-----------------27.5.99 20:31--------------------
 *  Goto position   (0x00 - 1.line, 1.col)
 *                  (0x40 - 2.line, 1.col)
 *--------------------------------------------------*/
void lcd_goto(byte mesto)
{
  byte temp;
  temp=0x08;
  temp|=mesto>>4;
  outp(temp,PORTA);
  toggle_E();
  outp((mesto & 0x0F),PORTA);
  toggle_E();
  lcd_delay(100);
}

/*-----------------27.5.99 20:31--------------------
 *  Put character on LCD
 *--------------------------------------------------*/
void lcd_putch(byte data)
{ byte temp;
  temp=data>>4;
  temp=temp | 0x10;
  outp(temp,PORTA);
  toggle_E();
  temp=data & 0x0F;
  temp=temp | 0x10;
  outp(temp,PORTA);
  toggle_E();
  lcd_delay(100);
}

/*-----------------27.5.99 20:30--------------------
 *  Display null terminated string
 *--------------------------------------------------*/
void lcd_putstr(byte *data)
{
    while(*data) {
        lcd_putch(*data);
        data++;
    }
}

/*-----------------31.8.99 20:29--------------------
 *  Display 8bit bin value
 *   printbin(0xAA,'0','1') -> 10101010
 *   printbin(0xAA,'_','*') -> *_*_*_*_
 *--------------------------------------------------*/
void printbin(byte x, byte ch0, byte ch1)
{
  byte i;
  for (i=128;i>0;i>>=1)
  {
    if ((x&i)==0) lcd_putch(ch0);
    else lcd_putch(ch1);
  }
}

/*-----------------1.6.99 16:39---------------------
 *  Display byte in hex (8bit)
 *--------------------------------------------------*/
void printhex(byte i)
{
    byte hi,lo;

    hi=i&0xF0;               // High nibble
    hi=hi>>4;
    hi+='0';
    if (hi>'9')
        hi+=7;

    lo=(i&0x0F)+'0';         // Low nibble
    if (lo>'9')
        lo=lo+7;

    lcd_putch(hi); lcd_putch(lo);
}

/*-----------------31.08.99 18:34-------------------
 *   Display 0..65535 with or without leading zeroes
 *     printdec(12345,6,'0') -> 012345
 *     printdec(12345,5,'')  -> 12345
 *     printdec(12345,6,' ') ->  12345
 *--------------------------------------------------*/
void printdec(unsigned int x, unsigned char n, unsigned char fillch)
{
    unsigned char i;
    unsigned char s[10];
    for (i = 0; i < n; i++) {
        s[n - i - 1] = '0' + (x % 10);
        x /= 10;
    }
    for (i=0; i<(n - 1); i++) {
        if (s[i] == '0') s[i] = fillch; else break;
    }
    for (i=0; i<n; i++) lcd_putch(s[i]);
}


/*-----------------31.5.99 18:18--------------------
 *  Display unsigned long 0-4294967296 (32bit)
 *--------------------------------------------------*/
void print10(unsigned long x)
{
  unsigned int y;
  if (x<4294967297ul)
  {
    y=x/1000000000;lcd_putch(y+0x30);x-=(y*1000000000);
    y=x/100000000;lcd_putch(y+0x30);x-=(y*100000000);
    y=x/10000000;lcd_putch(y+0x30);x-=(y*10000000);
    y=x/1000000;lcd_putch(y+0x30);x-=(y*1000000);
    y=x/100000;lcd_putch(y+0x30);x-=(y*100000);
    y=x/10000;lcd_putch(y+0x30);x-=(y*10000);
    y=x/1000;lcd_putch(y+0x30);x-=(y*1000);
    y=x/100;lcd_putch(y+0x30);x-=(y*100);
    y=x/10;lcd_putch(y+0x30);x-=(y*10);
    lcd_putch(x+0x30);
  }
  else lcd_putstr("Err");
}


/*-----------------28.08.99 22:49-------------------
 *   Simple printf function (no fp, and strings),
 *   but it works for signed numbers
 *--------------------------------------------------*/
int printf(const char *format, ...) {
  static const char hex[] = "0123456789ABCDEF";
  char format_flag;
  unsigned int u_val, div_val, base;
  char *ptr;
  va_list ap;

  va_start (ap, format);
  for (;;) {
     while ((format_flag = *format++) != '%') {
       if (!format_flag) {
         va_end (ap);
         return (0);
       }
       lcd_putch (format_flag);
     }

     switch (format_flag = *format++) {
       case 'c': format_flag = va_arg(ap,int);
       default:  lcd_putch(format_flag); continue;

       case 'd': base = 10; div_val = 10000; goto CONVERSION_LOOP;
       case 'x': base = 16; div_val = 0x10;

       CONVERSION_LOOP:
       u_val = va_arg(ap,int);
       if (format_flag == 'd') {
         if (((int)u_val) < 0) {
           u_val = - u_val;
           lcd_putch ('-');
         }
         while (div_val > 1 && div_val > u_val) div_val /= 10;
       }
       do {
         lcd_putch (hex[u_val / div_val]);
         u_val %= div_val;
         div_val /= base;
       } while (div_val);
    }
  }
}
