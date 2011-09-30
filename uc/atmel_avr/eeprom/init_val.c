/*
Initialiser des valeurs dans l'EEPROM

Pour fixer une valeur à une variable située dans l’EEPROM lors de la programmation du microcontrôleur, il vous suffit d’indiquer EEMEM (zone mémoire EEPROM) après votre type de variable.
L’accès à cette variable se fait de la même manière que dans l’exemple précèdent, sauf qu’au lieu de mettre directement l’adresse on utilise la notation &un (adresse de un).
 */

#include <avr/io.h>
#include <avr/eeprom.h>
 
unsigned char EEMEM un = 1; 	//On déclare un dans l'EEPROM et on lui donne la valeur 1
unsigned char EEMEM deux = 2;	//On déclare deux dans l'EEPROM et on lui donne la valeur 2
 
int main (void)
{
	DDRB = 0xFF;
	
	PORTB = eeprom_read_byte (&un) + eeprom_read_byte (&deux); 	//1+2=3 :p
 
	return 1;
}
