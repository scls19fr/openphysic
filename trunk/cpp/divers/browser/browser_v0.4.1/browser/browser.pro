#-------------------------------------------------
#
# Project created by QtCreator 2012-10-05T22:37:44
#
#-------------------------------------------------

QT       += core gui webkit network

TARGET = browser
TEMPLATE = app


SOURCES += main.cpp\
        slidedefaultview.cpp \
    slide.cpp \
    mainapplication.cpp \
    debugwindow.cpp \
    scrolltext.cpp \
    slideabstractview.cpp

HEADERS  += slidedefaultview.h \
    slide.h \
    mainapplication.h \
    debugwindow.h \
    scrolltext.h \
    slideabstractview.h

FORMS    += slidedefaultview.ui \
    debugwindow.ui

RESOURCES += \
    debug.qrc \
    screen.qrc