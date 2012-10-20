/*
Des widgets en 3D avec Qt
Ref: http://www.siteduzero.com/tutoriel-3-271568-des-widgets-en-3d-avec-qt.html
*/

#include <QApplication>
#include <QtGui>

#include "form.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Form frm;
    //frm.show();
    //frm.showFullScreen();
    frm.showMaximized();

    return app.exec();
}

