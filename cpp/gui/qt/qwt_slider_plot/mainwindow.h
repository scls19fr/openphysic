#include <qwidget.h>

class MainWindow : public QWidget
{
public:
    MainWindow(QWidget *parent = NULL);
protected:
    void timerEvent(QTimerEvent *e);
};

