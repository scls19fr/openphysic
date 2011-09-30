This project aims to compile (for a ATMEL AVR ATmega uC)
a parser for the following commands :

*IDN?
        MyDevice
heat on
        Heat is on
heat off
        Heat is off
get heat
        Heat is off
set temperature 22.6
        New temperature set to 22.6!
get temperature
        Temperature is 22.6

rem : temperature is double

This is inspired from the Lex/Yacc tutorial
http://ds9a.nl/lex-yacc/cvs/lex-yacc-howto.html

The project works fine on a PC
see this other project on my Subversion repository
Web access
http://svn.berlios.de/viewcvs/openphysic/compilation/2_yacc/thermostat/

Anonymous access
svn checkout svn://svn.berlios.de/openphysic/compilation/2_yacc/thermostat/

This project needs 
- WinAVR http://winavr.sourceforge.net/
- AVRLib http://hubbard.engr.scu.edu/embedded/avr/avrlib/

Simulation can be done with 
- VMLAB http://www.amctools.com/vmlab.htm
using the main.prj file


ToFix : doesn't compile with the WinAVR gcc toolchain !
flag -lfl ?

It doesn't seems to be a good idea to have such commands
for an only 8 bits microcontroller.

Simpler commands could be
*IDN?
        MyDevice
h1
        Heat is on
h0
        Heat is on
h?
        Heat is off
t22.6
        New temperature set to 22.6!
t?
        Temperature is 22.6


Other ideas more "SCPI like"
*IDN?
        MyDevice
HEATing on
        Heat is on
HEATing off
        Heat is off
HEAT?
        Heat is off
TEMPerature 22.6
        New temperature set to 22.6!
TEMPerature?
        Temperature is 22.6
