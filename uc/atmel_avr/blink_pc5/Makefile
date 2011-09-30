# makefile, written by guido socher
MCU=atmega8
#MCU=at90s4433
CC=avr-gcc
OBJCOPY=avr-objcopy
# optimize for size:
CFLAGS=-g -mmcu=$(MCU) -Wall -Wstrict-prototypes -Os -mcall-prologues
#-------------------
all: avrm8ledtest.hex
#-------------------
help: 
	@echo "Usage: make all|load|load_pre|rdfuses|wrfuse1mhz|wrfuse4mhz|wrfusecrystal"
	@echo "Warning: you will not be able to undo wrfusecrystal unless you connect an"
	@echo "         external crystal! uC is dead after wrfusecrystal if you do not"
	@echo "         have an external crystal."
#-------------------
avrm8ledtest.hex : avrm8ledtest.out 
	$(OBJCOPY) -R .eeprom -O ihex avrm8ledtest.out avrm8ledtest.hex 
avrm8ledtest.out : avrm8ledtest.o 
	$(CC) $(CFLAGS) -o avrm8ledtest.out -Wl,-Map,avrm8ledtest.map avrm8ledtest.o 
avrm8ledtest.o : avrm8ledtest.c 
	$(CC) $(CFLAGS) -Os -c avrm8ledtest.c
#------------------
load: avrm8ledtest.hex
	./prg_load_uc avrm8ledtest.hex
# here is a pre-compiled version in case you have trouble with
# your development environment
load_pre: avrm8ledtest_pre.hex
	./prg_load_uc avrm8ledtest.hex
#
loaduisp: avrm8ledtest.hex
	./prg_load_uc -u avrm8ledtest.hex
# here is a pre-compiled version in case you have trouble with
# your development environment
load_preuisp: avrm8ledtest_pre.hex
	./prg_load_uc -u avrm8ledtest.hex
#-------------------
# fuse byte settings:
#  Atmel AVR ATmega8 
#  Fuse Low Byte      = 0xe1 (1MHz internal), 0xe3 (4MHz internal), 0xe4 (8MHz internal)
#  Fuse High Byte     = 0xd9 
#  Factory default is 0xe1 for low byte and 0xd9 for high byte
# Check this with make rdfuses
rdfuses:
	./prg_fusebit_uc -r
# use internal RC oscillator 1 Mhz
wrfuse1mhz:
	./prg_fusebit_uc -w 1
# use internal RC oscillator 4 Mhz
wrfuse4mhz:
	./prg_fusebit_uc -w 4
# use external 3-8 Mhz crystal
# Warning: you can not reset this to intenal unless you connect a crystal!!
wrfusecrystal:
	@echo "Warning: The external crystal setting can not be changed back without a working crystal"
	@echo "         You have 3 seconds to abort this with crtl-c"
	@sleep 3
	./prg_fusebit_uc -w 0
#-------------------
clean:
	rm -f *.o *.map *.out *t.hex
#-------------------
