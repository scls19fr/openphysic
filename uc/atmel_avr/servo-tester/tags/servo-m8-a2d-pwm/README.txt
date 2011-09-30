Testeur de servo
- entrée tension analogique entre 0 et 5V sur ADC0 (PC0 - pin 23)
- sortie signal de période 20ms et de durée variable entre 1ms et 2ms sur OC1A (PB1 - pin 15)


Compiler le programme
$ cd repertoire_projet
$ make

Effacer l'ATmega8
$ avrdude -p m8 -c stk500v2 -P COM4 -e

Programmer l'ATMega8
$ cd repertoire_projet
$ avrdude -p m8 -c stk500v2 -P COM4 -U flash:w:main.hex

Passer l'oscillateur interne de l'ATmega8 de 1MHz à 8Mhz
$ avrdude -p m8 -c stk500v2 -P COM4 -t
avrdude> r lfuse
avrdude> w lfuse 0 0xC4