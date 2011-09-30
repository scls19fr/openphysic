input = glcd.bmp
output = glcd.c

all:
	$(RM) *.o
	#python glcd.py
	python glcd.py samples/glcd_bw_240_128_hz2_8bits.bmp -g T6963 -o glcd.c -l C
	#python glcd.py samples/glcd_bw_240_128_vt_8bits.bmp -g KS0108B -o glcd.c -l C
	#cat $(output)
	gcc -c $(output) -W -Wall -pedantic -ansi

.PHONY: clean

clean:
	$(RM) *.o *.pyc

#input = 'samples/glcd_bw_240_128_hz2_8bits.bmp' # T6963   test case (1 to 8 pixels hz   ON - 0x01 0x03 0x07 0x0F 0x1F 0x3F 0x7F 0xFF)
#input = 'samples/glcd_bw_240_128_vt_8bits.bmp' # KS0108B test case (1 to 8 pixels vert ON - 0x01 0x03 0x07 0x0F 0x1F 0x3F 0x7F 0xFF)
#output = 'glcd.c'
#language = 'C_AVR' # language C_AVR C_PIC...
