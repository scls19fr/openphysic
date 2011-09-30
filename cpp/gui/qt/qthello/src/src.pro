SOURCES += qthello.cpp \
           main.cpp
HEADERS += qthello.h
TEMPLATE = app
CONFIG += release \
          warn_on \
	  thread \
          qt
TARGET = ../bin/qthello
