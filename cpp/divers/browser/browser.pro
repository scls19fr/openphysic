TEMPLATE = app
QT = gui \
 core \
 xml \
 webkit \
 network \
 dbus
TARGET =
DEPENDPATH += . build src ui
INCLUDEPATH += . src build
CONFIG += qt warn_on console release
DESTDIR += bin
OBJECTS_DIR += build
MOC_DIR += build
UI_DIR += build
HEADERS += src/browser.h src/mainapplication.h
SOURCES += src/main.cpp src/browser.cpp src/mainapplication.cpp
FORMS += ui/browser.ui
