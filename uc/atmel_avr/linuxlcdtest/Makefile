# makefile, written by guido socher
#MCU=at90s4433
MCU=atmega8
CC=avr-gcc
OBJCOPY=avr-objcopy
#CFLAGS=-g -mmcu=$(MCU) -Wall -Wstrict-prototypes -Wa,-ahlms=$(<:.c=.lst)
CFLAGS=-mcall-prologues -Os -mmcu=$(MCU) -Wall -Wstrict-prototypes 
#-------------------
all: linuxlcdtest.hex 
#-------------------
load: linuxlcdtest.hex
	./prg_load_uc linuxlcdtest.hex
# here is a pre-compiled version in case you have trouble with
# your development environment
load_pre: prebuildlinuxlcdtest.hex
	./prg_load_uc prebuildlinuxlcdtest.hex
#-------------------
clean: 
	rm -f *.o *.out *.map linuxlcdtest.hex ttydevinit lcdschematic_gschem.ps gschem.log
#
#-------------------
linuxlcdtest.hex : linuxlcdtest.out 
	$(OBJCOPY) -R .eeprom -O ihex linuxlcdtest.out linuxlcdtest.hex 
linuxlcdtest.out : linuxlcdtest.o lcd.o
	$(CC) $(CFLAGS) -o linuxlcdtest.out -Wl,-Map,linuxlcdtest.map,--cref linuxlcdtest.o lcd.o 
lcd.o : lcd.c lcd.h lcd_hw.h
	$(CC) $(CFLAGS) -c lcd.c
linuxlcdtest.o : linuxlcdtest.c lcd.h lcd.h avr_compat.h 
	$(CC) $(CFLAGS) -c linuxlcdtest.c
#-------------------
# fuse byte settings:
#  Atmel AVR ATmega8 
#  Fuse Low Byte      = 0xe1 (1MHz internal), 0xe3 (4MHz internal), 0xe4 (8MHz internal)#  Fuse High Byte     = 0xd9 
#  Factory default is 0xe1 for low byte and 0xd9 for high byte
# Check this with make rdfuses
rdfuses:
	./prg_fusebit_uc -r
# use internal RC oscillator 1 Mhz
wrfuse1mhz:
	./prg_fusebit_uc -w 1
#-------------------

