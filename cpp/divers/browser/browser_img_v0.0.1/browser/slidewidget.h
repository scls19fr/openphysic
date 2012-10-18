#ifndef SLIDEWIDGET_H
#define SLIDEWIDGET_H

#include <QWidget>

namespace Ui {
class slidewidget;
}

class slidewidget : public QWidget
{
    Q_OBJECT
    
public:
    explicit slidewidget(QWidget *parent = 0);
    ~slidewidget();
    
private:
    Ui::slidewidget *ui;
};

#endif // SLIDEWIDGET_H
