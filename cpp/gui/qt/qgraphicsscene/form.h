#ifndef FORM_H
#define FORM_H

#include <QWidget>
#include <QtGui>
#include <QWebView>

namespace Ui {
class Form;
}

class Form : public QWidget
{
    Q_OBJECT
    
public:
    explicit Form(QWidget *parent = 0);
    ~Form();

private slots:
    void on_verticalSlider_valueChanged(int value);

private:
    Ui::Form *ui;
    QGraphicsScene *scene;

    qreal m_angle;

    QWebView *web;
    QWebView *web2;

    QGraphicsProxyWidget *proxy2;
    QGraphicsProxyWidget *proxy;

    void update_screen(void);

};

#endif // FORM_H
