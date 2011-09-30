// Initialisation, lecture et écriture

// On lit un et deux et on met la somme dans resultat.

#include <avr/io.h>
#include <avr/eeprom.h>
 
unsigned char EEMEM un = 1; 	
unsigned char EEMEM deux = 2;	
unsigned char EEMEM resultat;	
 
int main (void)
{
	eeprom_write_byte(&resultat,eeprom_read_byte (&un) + eeprom_read_byte (&deux));
	return 1;
}
