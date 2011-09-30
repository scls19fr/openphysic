# AVR-GCC Test by Bray++

include $(AVR)/include/make1

########### change this lines according to your project ##################

#put the name of the target mcu here (-2313, -8515, -8535, -mega103, -mega106)
        MCU     = -8515

#put the name of the target file here (without extension)
        TRG     = test

#put your C sourcefiles here
        SRC     = $(TRG).c lcd.c

#put additional assembler source file here
        ASRC    =

#needed libraries and object files to link
        LIB     =

#needed includes to compile
        INC	=

#compiler flags
        CPFLAGS = -Os -Wall

#assembler flags
        ASFLAGS = -L

#linker flags
        LDFLAGS = -v -l$(TRG).lnk

########### you should not need to change the following line #############
include $(AVR)/include/make2

###### dependecies, add any dependencies you need here ###################
$(TRG).o : $(TRG).c
lcd.o: lcd.c
