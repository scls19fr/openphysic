#-------------------------------------------------
#
# Project created by QtCreator 2012-10-05T22:37:44
#
#-------------------------------------------------

QT       += core gui

TARGET = browser
TEMPLATE = app


SOURCES += main.cpp\
        slidedefaultview.cpp \
    slide.cpp \
    mainapplication.cpp \
    debugwindow.cpp \
    scrolltext.cpp \
    slidewidget.cpp \
    mainwindow.cpp

HEADERS  += slidedefaultview.h \
    slide.h \
    mainapplication.h \
    debugwindow.h \
    scrolltext.h \
    slidewidget.h \
    mainwindow.h

FORMS    += slidedefaultview.ui \
    debugwindow.ui \
    slidewidget.ui \
    mainwindow.ui

RESOURCES += \
    debug.qrc \
    screen.qrc
