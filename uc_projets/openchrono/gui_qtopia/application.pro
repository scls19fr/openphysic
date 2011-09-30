qtopia_project(qtopia app) # see buildsystem.html for more project keywords
TARGET=openchrono
# main.cpp uses the QTOPIA_ADD_APPLICATION/QTOPIA_MAIN macros
CONFIG+=qtopia_main
# Despite using the QTOPIA_MAIN macro, do not build this app as a
# quicklaunch plugin unless -force-quicklaunch was passed to configure
CONFIG+=no_quicklaunch
# Do not build this app into a singleexec binary
CONFIG+=no_singleexec
# This project does not use tr() so disable i18n support
#CONFIG+=no_tr

# These are the source files that get built to create the application
FORMS=about.ui
HEADERS=about.h
SOURCES=main.cpp about.cpp

# Install the launcher item. The metadata comes from the .desktop file
# and the path here.
desktop.files=openchrono.desktop
desktop.path=/apps/Applications
desktop.trtarget=openchrono-nct
desktop.hint=nct desktop
INSTALLS+=desktop

# Install some pictures.
pics.files=pics/*
pics.path=/pics/openchrono
pics.hint=pics
INSTALLS+=pics

# Install help files
help.source=help
help.files=openchrono.html
help.hint=help
INSTALLS+=help

# Package information (used for make packages)
pkg.name=openchrono
pkg.desc=OpenChrono
pkg.version=1.0.0-1
pkg.maintainer=Sebastien CELLES
pkg.license=GPL
pkg.domain=window
