#Linux
DEFAULT_INCLUDE=/usr/local/include
TCL_INCLUDE=/usr/include/tcl8.4 # tcl.h
PYTHON_INCLUDE=/usr/include/python2.5 # Python.h
PERL_INCLUDE=/usr/lib/perl/5.8.8/CORE # perl.h

#Mac OS X
#TCL_INCLUDE=/system/Library/Frameworks/Tcl.framework/Versions/Current/Headers #/usr/local/include
#PYTHON_INCLUDE=/system/Library/Frameworks/Python.framework/Versions/Current/include/python2.3/

all:
	#$(MAKE) tcl
	#$(MAKE) python

tcl:
	swig -tcl example.i
	gcc -c -fpic example.c example_wrap.c -I$(TCL_INCLUDE)
	gcc -shared example.o example_wrap.o -o example.so
	#tclsh
#% load ./example.so
#% fact 4
#24
#% my_mod 23 7
#2
#% expr $My_variable + 4.5
#7.5
#%

python:
	swig -python example.i
	gcc -c -fpic example.c example_wrap.c -I$(PYTHON_INCLUDE) #-I/usr/lib/python2.5/config
	gcc -shared example.o example_wrap.o -o example.so
#unix > python
#Python 2.0 (#6, Feb 21 2001, 13:29:45)
#[GCC egcs−2.91.66 19990314/Linux (egcs−1.1.2 release)] on linux2
#Type "copyright", "credits" or "license" for more information.
#>>> import libexample
#>>> example.fact(4)
#24
#>>> example.my_mod(23,7)
#2
#>>> example.cvar.My_variable + 4.5
#7.5

perl:
	swig -perl example.i
	gcc -c example.c example_wrap.c -I$(PERL_INCLUDE)


.PHONY: clean

clean:
	$(RM) *~ *.o *.so example_wrap.c example.py example.pyc *.pm