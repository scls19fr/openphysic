#ifndef FORM_H
#define FORM_H

#include <QWidget>
#include <QtGui>
#include <QWebView>
#include "variantanimator.h"

namespace Ui {
class Form;
}

class Form : public QWidget
{
    Q_OBJECT
    
public:
    explicit Form(QWidget *parent = 0);
    ~Form();

public slots:
    void on_verticalSlider_valueChanged(int value);
    void on_timer_timeout(void);
    void updateScene(const QVariant& angle);

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::Form *ui;
    QGraphicsScene *scene;

    qreal m_angle;

    QWebView *web;
    QWebView *web2;

    QGraphicsProxyWidget *proxy2;
    QGraphicsProxyWidget *proxy;


    void keyPressEvent(QKeyEvent * event);

    variantAnimator *mAngleAnimator;

};

#endif // FORM_H
