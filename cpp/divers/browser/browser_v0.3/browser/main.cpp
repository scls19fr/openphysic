#include <QtGui/QApplication>
#include "slidedefaultview.h"


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    quint8 N = 3;

    SlideDefaultView w[N];

    quint8 iv;

    iv = 0;

    for(int i=0 ; i<N ; i++) {
        w[i].setVisible(false);
    }

    w[iv].setVisible(true);

    iv = 1;
    w[iv].setVisible(true);
    w[iv-1].setVisible(false);


    return a.exec();
}
