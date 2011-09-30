# AVR-GCC Makefile
# Adapted to WinAVR 20050214
#**************************************************************
.SUFFIXES:
.SUFFIXES:	.S .c .o .cof .elf .eep .hex

#--- define some variables based on the AVR base path in $(AVR)
CC	= avr-gcc
AS	= avr-gcc
RM	= rm -f
RN	= mv
CP      = cp
BIN	= avr-objcopy
OBJCOPY = avr-objcopy
INCDIR	= .

#If all other steps compile ok then echo "Errors: none".
#Necessary for AVR Studio 3.x IDE to understand that everything went ok.
DONE    = @echo Errors: none


#--- default mcu type
MCU = at90s8515
#MCU = atmega8


#--- default compiler flags -ahlmsn
CPFLAGS = -g -Os -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -Wall -Wstrict-prototypes -mmcu=$(MCU) -Wa,-adhlns=$(<:.c=.lst)

#--- default assembler flags 
ASFLAGS = -mmcu=$(MCU) -Wa,-mmcu=$(MCU),-gstabs

#--- default linker flags
LDFLAGS = -Wl,-Map=$(<:.o=.map),--cref -mmcu=$(MCU)

#--- output format can be srec (Motorola), ihex (Intel HEX)
ROMFORMAT 	= ihex
EEPROMFORMAT    = ihex              # AVR Studio needs Intel HEX format


#--- compile: instructions to create assembler and/or object files from C source
%o : %c
	$(CC) -c $(CPFLAGS) -I$(INCDIR) $< -o $@

%s : %c
	$(CC) -s $(CPFLAGS) -I$(INCDIR) $< -o $@

%: %.c
	@echo "Error: target $@ not defined in Makefile"
	@exit 1

#--- assemble: instructions to create object file from assembler source
%o : %S
	$(AS) -x assembler-with-cpp $(ASFLAGS) -I$(INCDIR) -c $< -o $@


#--- link: instructions to create elf output file from object files
%elf:	%o
	$(CC) $^ $(LDFLAGS) -o $@

#--- create AVR Studio cof file from elf output for use in debugging / simulating in AVR Studio 4.08 only
COFFCONVERT=$(OBJCOPY) --debugging \
	--change-section-address .data-0x800000 \
	--change-section-address .bss-0x800000 \
	--change-section-address .noinit-0x800000 \
	--change-section-address .eeprom-0x810000 
%cof: %elf
	$(COFFCONVERT) -O coff-ext-avr $< $@



#--- create flash and eeprom bin file (ihex, srec) from elf output file
%hex: %elf
	$(BIN) -O $(ROMFORMAT) -R .eeprom $< $@

%eep: %elf
	$(BIN) -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 -O $(EEPROMFORMAT) $< $(@:.elf=.eep)


#If all other steps compile ok then echo "Errors: none".
#Necessary for AVR Studio 3.x to understand that everything went ok.
%ok:
	@echo "Errors: none" 



.PHONY	: begin
begin:	all


.phony:	clean
clean:
	$(RM) *.hex
	$(RM) *.eep 
	$(RM) *.cof
	$(RM) *.elf 
	$(RM) *.o 
	$(RM) *.lst 
	$(RM) *.map


#*************************** add your projects below **************************************


#--- this defines the aims of the make process
ifeq ($(MCU),atmega16)

all:	helloled externint walkingled test_eeprom pwmdemo flashled \
	test_starterkit hardwarespi debounce_keys adc
	$(DONE)

else

all:	helloled externint walkingled test_eeprom pwmdemo flashled rc5decode \
	test_starterkit hardwarespi debounce_keys externalsram
	$(DONE)

endif

#-------- helloled 
helloled:	helloled.hex

	
helloled.elf:	helloled.o

helloled.o:	helloled.c 


#-------- walkingled
walkingled:	walkingled.hex
		$(DONE)

walkingled.elf:	walkingled.o

walkingled.o:	walkingled.c 

#-------- externint
externint:	externint.hex
		$(DONE)

externint.elf:	externint.o

externint.o:	externint.c 

#-------- test_eeprom
test_eeprom:	test_eeprom.hex  test_eeprom.eep
		$(DONE)

test_eeprom.elf:	test_eeprom.o

test_eeprom.o:	test_eeprom.c 

#-------- pwmdemo
pwmdemo:	pwmdemo.hex
		$(DONE)

pwmdemo.elf:	pwmdemo.o

pwmdemo.o:	pwmdemo.c 

#-------- flashled
flashled:	flashled.hex
		$(DONE)

flashled.elf:	flashled.o

flashled.o:	flashled.c 


#-------- rc5decode
rc5decode:	rc5decode.hex
		$(DONE)

rc5decode.elf:	rc5decode.o

rc5decode.o:	rc5decode.c 


#-------- test_starterkit
test_starterkit:	test_starterkit.hex
			$(DONE)

test_starterkit.elf:	test_starterkit.o

test_starterkit.o:	test_starterkit.c 

#-------- externalsram
externalsram:		externalsram.hex
			$(DONE)

externalsram.elf:	externalsram.o

externalsram.o:		externalsram.c 


#-------- hardwarespi
hardwarespi:		hardwarespi.hex
			$(DONE)

hardwarespi.elf:	hardwarespi.o

hardwarespi.o:		hardwarespi.c 

#-------- debounce_keys
debounce_keys:		debounce_keys.hex
			$(DONE)

debounce_keys.elf:	debounce_keys.o

debounce_keys.o:	debounce_keys.c 

#------- adc
adc:			adc.hex
			$(DONE)
			
adc.elf:		adc.o

adc.o:			adc.c
