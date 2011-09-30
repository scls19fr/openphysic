/******************************************************************************
 Title:    Output data using the SPI bus to a 74595 shift register
 Author:   Peter Fleury <pfleury@gmx.ch> http://jump.to/fleury
 Date:     December 2003
 Software: AVR-GCC 3.3 
 Hardware: Any AVR with built-in SPI, 74HC595
           Tested with AT90S8515 at 4Mhz and ATmega8 at 1Mhz
           
 Description:
 Demonstrates accessing a 74HC595 shift register using the built-in SPI interface
 A LED connected to the 74HC595 will flash.
 
 AVR AT90S8515         74HC595
 SS   (5)      ->      LatchClock (12)
 MOSI (6)      ->      SerialIn   (14)
 SCK  (8)      ->      ShiftClock (11)
                       Reset      (10) -> VCC
                       OE         (13) -> GND
                       Q1         (1)  -> 1K Resistor -> LED -> GND

 AVR ATmega8
 SS   (16)
 MOSI (17)
 SCK  (19)
                       
*******************************************************************************/
#include <inttypes.h>
#include <avr/io.h>


/*
 * Definitions of the SPI pins
 */
#if __AVR_AT90S8515__

#define SPI_CHIP_SELECT PB4             // SS pin is used here, but any pin can be used
#define SPI_MOSI        PB5             // SPI MOSI pin 
#define SPI_SCK         PB7             // SPI SCK pin
#define SPI_DDR         DDRB            // port used by SPI

#elif __AVR_ATmega8__

#define SPI_CHIP_SELECT PB2             // SS pin is used here, but any pin can be used
#define SPI_MOSI        PB3             // SPI MOSI pin 
#define SPI_SCK         PB5             // SPI SCK pin
#define SPI_DDR         DDRB            // port used by SPI

#else
#error "Adapt SPI pin definitions to your MCU"
#endif



static void delay(uint16_t us);

static void delay(uint16_t us) 
/* delay for a minimum of <us> microseconds    */
/* with a 4Mhz crystal, the resolution is 1 us */
{
    while ( us ) us--;
}

int main(void)
{ 
    uint8_t led = 2;
    
    /* SPI port initialization (/SS, MOSI, SCK output, MISO input) */
    SPI_DDR  = _BV(SPI_CHIP_SELECT) + _BV(SPI_MOSI) + _BV(SPI_SCK);

    /* SPI interrupt disabled, SPI port enabled, master mode, MSB first, SPI mode 3, SPI Clock = XTAL/4 */
    SPCR = _BV(SPE) +_BV(MSTR) + _BV(CPOL) + _BV(CPHA);
     
    for(;;)
    {
        PORTB &= ~_BV(SPI_CHIP_SELECT);     // enable SPI device
        SPDR = led;                         // send data to SPI device (turn LED on/off)
        while (!(SPSR & _BV(SPIF)));        // wait until write complets
        PORTB |= _BV(SPI_CHIP_SELECT);      // disable SPI device

        led ^= 2;                           // toggle LED
                
        delay(65535);                       // delay 0.1 seconds
   }

}
