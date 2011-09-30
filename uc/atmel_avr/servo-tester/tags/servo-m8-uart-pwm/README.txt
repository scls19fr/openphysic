Ce projet décrit le fonctionnement d'un testeur de servo de modélisme.
Il permet de commander un servomoteur à l'aide d'une tension continue (A2D_MODE) ou à l'aide d'une liaison série (UART_MODE) et génère un signal compatible avec les servomoteurs utilisés en modélisme c'est à dire un signal périodique de 20 ms et de largeur d'impulsion variable entre 1 et 2 ms.
Nécessite :
- WinAVR-gcc
- AVRLib

Rôles des différents cavaliers (JUMPER)
JP2_MODE 0=A2D_MODE 1=UART_MODE
JP2_INPUT
 Entrée analogique sur borne Vin_ext (utilisation d'un générateur continu ajustable externe entre 0 et 5V) 
 Potentiomètre
JP VCC / JP MID / JP GND
 Cavaliers permettant d'activer une résistance de pull-up afin que la borne ADC0 ne soit pas "en l'air" si le fil ammenant la tension Vin_ext est déconnecté.


ToDo:
 Changer de uC car le code dépasse 8ko !
 Changer le port sur lequel est relié le cavalier mode (à cause de l'ISP)


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