#include "mainwindow.h"
#include <qapplication.h>

int main (int argc, char **argv)
{
    QApplication a(argc, argv);

    //QApplication::setFont(QFont("Helvetica",10));

    MainWindow w;

    w.show();

    return a.exec();
}
