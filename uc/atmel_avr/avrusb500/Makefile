# makefile, written by guido socher
MCU=atmega8
CC=avr-gcc
OBJCOPY=avr-objcopy
# optimize for size:
CFLAGS=-g -mmcu=$(MCU) -Wall -Wstrict-prototypes -Os -mcall-prologues
#-------------------
all: avrusb500.hex test_1.hex test_2.hex ttydevinit1152
#-------------------
help: 
	@echo "Usage: make help"
	@echo "       Print this help"
	@echo " "
	@echo "Usage: make all|load|load_test_1|load_test_2"
	@echo " "
	@echo "Usage: make clean"
	@echo "       delete all generated files except the pre-compiled ones"
#-------------------
avrusb500.hex : avrusb500.out 
	$(OBJCOPY) -R .eeprom -O ihex avrusb500.out avrusb500.hex 
	avr-size avrusb500.out
	@echo " "
	@echo "Expl.: data=initialized data, bss=uninitialized data, text=code"
	@echo " "
avrusb500.out : main.o uart.o spi.o timeout.o
	$(CC) $(CFLAGS) -o avrusb500.out -Wl,-Map,avrusb500.map main.o uart.o spi.o timeout.o
main.o : main.c led.h avr_compat.h command.h spi.h uart.h timeout.h
	$(CC) $(CFLAGS) -Os -c main.c
#-------------------
timeout.o : timeout.c timeout.h avr_compat.h
	$(CC) $(CFLAGS) -Os -c timeout.c
#-------------------
spi.o : spi.c spi.h avr_compat.h timeout.h
	$(CC) $(CFLAGS) -Os -c spi.c
#-------------------
uart.o : uart.c uart.h avr_compat.h timeout.h
	$(CC) $(CFLAGS) -Os -c uart.c
#-------------------
# hardware test, led only:
test_1: test_1.hex
	@echo "OK"
test_1.o : test_1.c  led.h avr_compat.h timeout.h
	$(CC) $(CFLAGS) -Os -c test_1.c
test_1.hex : test_1.o timeout.o
	$(CC) $(CFLAGS) -o test_1.out -Wl,-Map,test_1.map test_1.o timeout.o
	$(OBJCOPY) -R .eeprom -O ihex test_1.out test_1.hex 
	avr-size test_1.out
	@echo " "
	@echo "Expl.: data=initialized data, bss=uninitialized data, text=code"
	@echo " "
load_test_1: test_1.hex
	./bbpg_firmware_load test_1.hex
#-------------------
# hardware test, led and uart:
test_2: test_2.hex
	@echo "OK"
test_2.o : test_2.c led.h uart.h avr_compat.h timeout.h
	$(CC) $(CFLAGS) -Os -c test_2.c
test_2.hex : test_2.o uart.o timeout.o
	$(CC) $(CFLAGS) -o test_2.out -Wl,-Map,test_2.map test_2.o uart.o timeout.o
	$(OBJCOPY) -R .eeprom -O ihex test_2.out test_2.hex 
	avr-size test_2.out
	@echo " "
	@echo "Expl.: data=initialized data, bss=uninitialized data, text=code"
	@echo " "
load_test_2: test_2.hex
	./bbpg_firmware_load test_2.hex
#-------------------
# here is a pre-compiled version in case you have trouble with
# your development environment
load_pre: avrusb500_pre.hex
	./bbpg_firmware_load avrusb500_pre.hex
#-------------------
# avrdude is better than uisp because it can verify the eeprom:
load: avrusb500.hex
	./bbpg_firmware_load avrusb500.hex
#-------------------
ttydevinit1152: ttydevinit1152.c
	gcc -Wall -o ttydevinit1152 ttydevinit1152.c 
#-------------------
clean:
	rm -f *.o *.map *.out test_2.hex avrusb500.hex ttydevinit1152 test_1.hex
#-------------------
