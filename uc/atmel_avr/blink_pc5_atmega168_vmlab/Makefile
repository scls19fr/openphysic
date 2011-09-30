# MCU for gcc
MCU=atmega168
#MCU=at90s4433

## MCU for loader
MCU2=m168

CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-g -mmcu=$(MCU) -Wall -Wstrict-prototypes -Os -mcall-prologues
TRG = main
SRC = $(TRG).c
#assembler flags
ASFLAGS = -Wa, -gstabs
#compiler flags
CPFLAGS	= -g -Os -Wall -Wstrict-prototypes -I$(AVRLIB) -Wa,-ahlms=$(<:.c=.lst)
#linker flags
LDFLAGS = -Wl,-Map=$(TRG).map,--cref

all: $(TRG).hex

help: 
	@echo "Usage: make all|load|clean"
#	@echo "Warning: you will not be able to undo wrfusecrystal unless you connect an"
#	@echo "         external crystal! uC is dead after wrfusecrystal if you do not"
#	@echo "         have an external crystal."

$(TRG).hex : $(TRG).out 
	$(OBJCOPY) -R .eeprom -O ihex $(TRG).out $(TRG).hex 
$(TRG).out : $(TRG).o 
	$(CC) $(CFLAGS) -o $(TRG).out -Wl,-Map,$(TRG).map $(TRG).o 
$(TRG).o : $(SRC) 
	$(CC) $(CFLAGS) -Os -c $(SRC)

.PHONY: clean erase load fuse8

clean:
	$(RM) *.out *.o *.hex *.cof *.d *.eep *.elf *.gcc *.lss *.lst *.ly1 *.map *.sym

erase:
	avrdude -p $(MCU2) -c stk500v2 -P COM4 -e

load:
	avrdude -p m8 -c stk500v2 -P COM4 -U flash:w:main.hex

#Passer l'oscillateur interne de l'ATmega8 de 1MHz à 8Mhz
#fuse8:
#	avrdude -p m8 -c stk500v2 -P COM4 -t
#	avrdude> r lfuse
#	avrdude> w lfuse 0 0xC4
