 /***********************************************************
  *   Program:    I2C header
  *   Created:    24.5.99 23:02
  *   Author:     Bray++
  *   Comments:   I2C definitions
  ************************************************************/
#include <io.h>

#define SCL PD6
#define SDA PD7

#define uDLY 5

#define SDA_0 cbi(PORTD,SDA)
#define SDA_1 sbi(PORTD,SDA)
#define SCL_0 cbi(PORTD,SCL)
#define SCL_1 sbi(PORTD,SCL)
#define R_SDA bit_is_set(PIND,PIND7)

//unsigned char i2cflag;                                  // Acknowledge flag (ne dela neki)

void i2c_init();                                        // inicializacija pinov
void i2c_delay(unsigned int p);                         // zakasnitev (>4us !?)
void i2c_writebyte(unsigned char byte);                 // pisanje byte-a na i2c
unsigned char i2c_readbyte(void);                       // branje byte-a z i2c
void i2c_write(unsigned char deviceaddr, unsigned char address, unsigned char data);    // I2C write
unsigned char i2c_read(unsigned char deviceaddr, unsigned char address);                // I2C read

