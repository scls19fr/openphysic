AVR GCC development environment test software.
See the following article for details:
http://main.linuxfocus.org/English/November2004/article352.shtml

To compile type the command:
make

Note: You will get some warnings "#warning "This header file is obsolete."
during compilation with avr-libc-1.4.X. This is because this code will 
also work with avr-libc-1.2.X

Alternative 1: Programming with uisp (dapa programmer):
-------------------------------------------------------
Make sure that you have loaded the following modules in the kernel (for 2.4.x)
before you use the uisp programmer:
> /sbin/lsmod 
Module                  Size  Used by
parport_pc             17808   0
ppdev                   5312   0 (unused)
parport                25856   0 [parport_pc ppdev]


To compile and load use:
make loaduisp

Alternative 2: Programming with avrusb500 (high speed usb programmer from tuxgraphics):
---------------------------------------------------------------------------------------
Make sure that you have loaded the following modules in the kernel
before you use the uisp programmer:
> /sbin/lsmod 
Module                  Size  Used by
ftdi_sio               20568   0
usbcore                57792   1 [ftdi_sio usbserial]


To compile and load use:
make load

Files:
------
avrm8ledtest.c        # the c source code for ATmega8
avrm8ledtest_pre.hex  # pre-compiled loadable object in case you have
                      # trouble to compile the software
Makefile              # Makefile 
README.txt            # this file
circuit.gif           # schematic as gif image

-------------------------------------------
History:
version 0.1: 2004-10-01, first Version
version 0.2: 2004-12-30, corrected fault in delay_ms function
version 0.3: 2005-10-04, new modular programming with the scripts prg_load_uc
                         and prg_fusebit_uc for easy transition to the new
			 avrusb500 programmer
version 0.4: 2006-03-02, compiler independent delay loop. The old delay_ms
                         would behave totally different with the new gcc-4
			 version.
version 0.5: 2006-03-10, Fault in delay_ms corrected
-------------------------------------------
Copyright: GPL
Written by guido socher <guido at tuxgraphics.org>
-------------------------------------------

