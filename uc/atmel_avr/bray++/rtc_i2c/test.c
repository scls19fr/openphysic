 /***********************************************************
  *   Program:    AVRGCC - I2C Test
  *   Created:    31.8.99 17:23
  *   Author:     vlado.barjer@kks.s-net.net
  *   Comments:   let see what we can do whit this stuff
  ************************************************************/
#include <io.h>
#include "lcd.h"
#include "i2c.h"


#define RTCAddress 0xa0
#define ControlReg 0

void SetRTC (unsigned char *p)
{   unsigned char i;

    for (i=1;i<=6;i++)
    i2c_write(RTCAddress, i, *p++);
    i2c_write(RTCAddress, ControlReg, 0x00);
}

void GetRTC (unsigned char *p)
{   unsigned char i;

    for (i=1;i<=6;i++)
    *p++=(i2c_read(RTCAddress, i));
    i2c_write(RTCAddress, ControlReg, 0x00);
}

int main(void)
{
    unsigned char RtcBuffer[6];
    unsigned char hours, minutes, seconds, hundredths;
    unsigned char year, month, day;

    lcd_init();
    i2c_init();

    lcd_control(1,0,0);

    /* sample how to set clock (see PDF for registers)
    RtcBuffer[0] = 0x78;
    RtcBuffer[1] = 0x56;
    RtcBuffer[2] = 0x34;
    RtcBuffer[3] = 0x12;
    RtcBuffer[4] = 0x30;
    RtcBuffer[5] = 0x12;
    SetRTC (&RtcBuffer);
    */

    lcd_cls();
    while(1) {
        lcd_home();
        GetRTC(RtcBuffer);

        hours=10*(RtcBuffer[3] >> 4 & 0x3) + (RtcBuffer[3] & 0xf);
        minutes=10*(RtcBuffer[2] >> 4) + (RtcBuffer[2] & 0xf);
        seconds=10*(RtcBuffer[1] >> 4) + (RtcBuffer[1] & 0xf);
        hundredths=10*(RtcBuffer[0] >> 4) + (RtcBuffer[0] & 0xf);
        year=99;
        month=10*(RtcBuffer[5] >> 4 & 0x1) + (RtcBuffer[5] & 0xf);
        day=10*(RtcBuffer[4] >> 4 & 0x3) + (RtcBuffer[4] & 0xf);

        printdec(hours,2,'0');
        lcd_putch(':');
        printdec(minutes,2,'0');
        lcd_putch(':');
        printdec(seconds,2,'0');
        lcd_putch('.');
        printdec(hundredths,2,'0');
        lcd_goto(0x40);
        printdec(day,2,'0');
        lcd_putch('/');
        printdec(month,2,'0');
        lcd_putch('/');
        printdec(year,2,'0');
    }
}
