#-------------------------------------------------
#
# Project created by QtCreator 2012-10-05T22:37:44
#
#-------------------------------------------------

QT       += core gui webkit

CONFIG += console

TARGET = browser
TEMPLATE = app


SOURCES += main.cpp\
        slidedefaultview.cpp \
    slide.cpp \
    mainapplication.cpp \
    display.cpp \
    debugwindow.cpp

HEADERS  += slidedefaultview.h \
    slide.h \
    mainapplication.h \
    display.h \
    debugwindow.h

FORMS    += slidedefaultview.ui \
    debugwindow.ui
