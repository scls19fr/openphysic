#ifndef FORM_H
#define FORM_H

#include <QWidget>
#include <QtGui>

namespace Ui {
class Form;
}

class Form : public QWidget
{
    Q_OBJECT
    
public:
    explicit Form(QWidget *parent = 0);
    ~Form();

    QGraphicsScene scene;

private:
    Ui::Form *ui;
};

#endif // FORM_H
