#-------------------------------------------------
#
# Project created by QtCreator 2012-10-05T22:37:44
#
#-------------------------------------------------

QT       += core gui webkit network script

TARGET = browser
TEMPLATE = app


SOURCES += main.cpp\
    slide.cpp \
    mainapplication.cpp \
    debugwindow.cpp \
    scrolltext.cpp \
    slidewidget.cpp \
    mainwindow.cpp \
    QTMarqueeLabel.cpp

HEADERS  += \
    slide.h \
    mainapplication.h \
    debugwindow.h \
    scrolltext.h \
    slidewidget.h \
    mainwindow.h \
    QTMarqueeLabel.h

FORMS    += \
    debugwindow.ui \
    slidewidget.ui \
    mainwindow.ui

RESOURCES += \
    debug.qrc \
    screen.qrc
