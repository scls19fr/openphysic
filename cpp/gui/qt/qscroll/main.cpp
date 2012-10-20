#include <QtGui/QApplication>
#include "scrolltext.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    ScrollText *w = new ScrollText();
    w->setText("Lorem ipsum <i>dolor sit</i> amet, <u>consectetur adipiscing</u> elit. Sed non risus.");
    w->scroll(10,0);
    w->show();
    
    return a.exec();
}
