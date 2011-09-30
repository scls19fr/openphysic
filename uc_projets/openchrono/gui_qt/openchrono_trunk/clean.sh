# clean obj files
make clean
rm Makefile
qmake openchrono.pro

# remove temporary files~
rm src/*~ *~
rm moc_*.cpp ui_*.h

# beautify code (astyle, GNU/Indent...)
astyle --style=gnu src/*.cpp src/*.h
rm src/*.orig

# informations about project
sloccount src/

# make documentation (doxygen)