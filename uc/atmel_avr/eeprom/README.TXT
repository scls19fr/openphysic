http://wiki.jelectronique.com/avr-gcc#eeprom
http://wiki.jelectronique.com/winavr/l_eeprom

EEPROM
Librairie utilisée

#include <avr/eeprom.h> 

Fonctions

eeprom_is_ready()

Retourne 1 sur l’EEPROM est prête sinon 0

Il est conseillé de désactiver les interruptions pendant les phases de lecture et d’écriture.

uint8_t eeprom_read_byte (const uint8_t * addr)

Lit un octet (8bits) à l’adresse addr

void eeprom_write_byte (uint8_t * addr, uint8_t value)

Ecrit un octet (8bits) value à l’adresse addr

uint16_t eeprom_read_word (const uint16_t * addr)

Lit un mot (16bits) à l’adresse addr

void eeprom_write_word (uint16_t * addr, uint16_t value)

Ecrit un mot (16bits) value à l’adresse addr

