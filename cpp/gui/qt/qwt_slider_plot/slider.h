#include <qwidget.h>

#include <qlabel.h>
#include <qwt_slider.h>

class Slider: public QWidget
{
    Q_OBJECT
public:
    Slider(QWidget *parent);

private slots:
    void setNum(double v);

private:
    QwtSlider *d_slider;
    QLabel *d_label;
};
