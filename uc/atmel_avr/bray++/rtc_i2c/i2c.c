 /***********************************************************
  *   Program:    I2C driver
  *   Created:    24.5.99 23:01
  *   Author:     Bray++
  *   Comments:   I2C driver (not optimized, spljoh..:)..)
  ************************************************************/
#include "i2c.h"

// inicializacija pinov
void i2c_init()
{
    sbi(DDRD,SDA);
    sbi(DDRD,SCL);
}

// zakasnitev
void i2c_delay(unsigned int p)
{
  unsigned int i;
  unsigned char j;
  for(i=0;i<p;i++)
    for (j=0;j<10;j++);
}

// pisanje byte-a na i2c
void i2c_writebyte(unsigned char byte)
{
    unsigned char i;

    for (i=0;i<8;i++) {
        if (byte>127) SDA_1; else SDA_0;
        i2c_delay(uDLY);
        SCL_1; i2c_delay(uDLY);
        SCL_0; i2c_delay(uDLY);
        byte<<=1;
    }
    SDA_1; i2c_delay(uDLY);
    SCL_1; i2c_delay(uDLY);
    cbi(DDRD,DDD7);
    //if (R_SDA) i2cflag=0; else i2cflag=1;
    SCL_0; i2c_delay(uDLY);
    sbi(DDRD,DDD7);
}

// branje byte-a z i2c
unsigned char i2c_readbyte(void)
{
    unsigned char i,byte=0;

    cbi(DDRD,DDD7);                     // nastavi pin za vhod
    for (i=0;i<8;i++) {
        byte<<=1;
        if (R_SDA) byte|=1;
        i2c_delay(uDLY);
        SCL_1; i2c_delay(uDLY);
        SCL_0; i2c_delay(uDLY);
    }
    sbi(DDRD,DDD7);                     // nastavi pin za izhod
    SDA_1; i2c_delay(uDLY);
    SCL_1; i2c_delay(uDLY);
    SCL_0; i2c_delay(uDLY);
    return(byte);
}

// I2C write
void i2c_write(unsigned char deviceaddr, unsigned char address, unsigned char data)
{
    unsigned char byte;
    SDA_1; SCL_1; i2c_delay(uDLY);
    SDA_0; i2c_delay(uDLY);
    SCL_0; i2c_delay(uDLY);
    byte=deviceaddr;                    // naslov
    i2c_writebyte(byte);
    byte=address;                       // interni naslov
    i2c_writebyte(byte);
    byte=data;                          // podatek
    i2c_writebyte(byte);
    SDA_0; i2c_delay(uDLY);
    SCL_1; i2c_delay(uDLY);
    SDA_1; i2c_delay(uDLY);
    /*for (byte=0;byte<255;byte++) {      // tole je mogoce brezveze
        SCL_0; i2c_delay(uDLY);
        SCL_1; i2c_delay(uDLY);
    }*/
}

// I2C read
unsigned char i2c_read(unsigned char deviceaddr, unsigned char address)
{
    unsigned char byte;
    SDA_1; SCL_1; i2c_delay(uDLY);      // start
    SDA_0; i2c_delay(uDLY);             //
    SCL_0; i2c_delay(uDLY);             //
    byte=deviceaddr;                    // naslov
    i2c_writebyte(byte);
    byte=address;                       // interni naslov
    i2c_writebyte(byte);
    SCL_1; i2c_delay(uDLY);
    SDA_0; i2c_delay(uDLY);
    SCL_0; i2c_delay(uDLY);
    byte=deviceaddr+1;                  // naslov + RD
    i2c_writebyte(byte);
    byte=i2c_readbyte();                // prebere byte
    SDA_0; i2c_delay(uDLY);             // stop
    SCL_1; i2c_delay(uDLY);             //
    SDA_1; i2c_delay(uDLY);             //
    return(byte);
}
