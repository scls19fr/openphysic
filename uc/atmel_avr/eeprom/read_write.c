// Lecture - Ecriture d'un octet
#include <avr/io.h>
#include <avr/eeprom.h>		//Pour pouvoir utiliser les fonctions d'acces à l'EEPROM
#include <avr/interrupt.h> 	//Pour pouvoir utiliser cli et sei
 
int main (void)
{
	unsigned char port;
 
	DDRB = 0x00; 					//Met le port B en entrée
        DDRC = 0xFF; 					//Met le port C en sortie 
 
	port = PINB; 					//Lit le PORTB et met la valeur dans la variable port
 
	while(!eeprom_is_ready()); 			//On attend que l'EEPROM soit prête
 
	cli(); 						//Désactive les intéruptions
        eeprom_write_byte (0x00, port); 		//On écrit la valeur de port dans l'EEPROM à l'adresse 0x00
	sei(); 						//Active les intéruptions
 
	while(!eeprom_is_ready()); 			//On attend que l'EEPROM soit prête
 
	cli();
        PORTC = eeprom_read_byte (0x00);		//On lit l'adresse 0x00 de l'EEPROM et on l'envoie sur le port C
        sei();
 
	return 1;
}
