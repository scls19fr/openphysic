#ifndef TESTPATTERN_H
#define TESTPATTERN_H

#include <QtGui/QDialog>

namespace Ui
{
    class Dialog;
}

class Testpattern : public QDialog
{
    Q_OBJECT

public:
    Testpattern(QWidget *parent = 0);
    ~Testpattern();

protected:
    void paintEvent(QPaintEvent * event);

private:
    Ui::Dialog *ui;

    void (*p_testpattern)();
    void testpattern1(void);
    int x,y,w,h;

    QVector<QColor> colors;

    void print_colors(void);

};

#endif // TESTPATTERN_H
