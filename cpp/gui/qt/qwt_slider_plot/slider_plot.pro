CONFIG           += qt     # Also for Qtopia Core!
CONFIG           += warn_on
CONFIG           += thread
CONFIG           += release     # release/debug/debug_and_release
#CONFIG           += debug_and_release
#CONFIG           += build_all

QwtBase    = /usr/local/qwt-5.1.2-svn

TEMPLATE = app
TARGET = 
DEPENDPATH += .
INCLUDEPATH += .
INCLUDEPATH += $${QwtBase}/include


# Input
HEADERS += mainwindow.h slider.h plot.h
SOURCES += mainwindow.cpp slider.cpp plot.cpp main.cpp

LIBS        += -L$${QwtBase}/lib -lqwt
