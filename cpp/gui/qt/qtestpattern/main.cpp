#include <QtGui/QApplication>
#include "mainwindow.h"
#include "testpattern.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    //MainWindow w;
    Testpattern w;
    w.show();
    return a.exec();
}
