#include "slider.h"

#include <qlayout.h>
#include <qwt_scale_engine.h>
#include <qwt_scale_map.h>

Slider::Slider(QWidget *parent):
    QWidget(parent)
{
    d_slider = new QwtSlider(parent, 
            Qt::Vertical, QwtSlider::LeftScale, QwtSlider::BgSlot);
    d_slider->setRange(0.0, 100.0, 0.5, 5);
    d_slider->setScaleMaxMinor(5);

    QFlags<Qt::AlignmentFlag> alignment;
    alignment = Qt::AlignVCenter | Qt::AlignRight;

    d_label = new QLabel("0", this);
    d_label->setAlignment(alignment);
    d_label->setFixedWidth(d_label->fontMetrics().width("10000.9"));

    connect(d_slider, SIGNAL(valueChanged(double)), SLOT(setNum(double)));

    QBoxLayout *layout;
    layout = new QVBoxLayout(this);

    layout->addWidget(d_slider);
    layout->addWidget(d_label); // Add QTextEdit or QSpinBox or QDoubleSpinBox instead of QLabel
}


void Slider::setNum(double v)
{
    if ( d_slider->scaleMap().transformation()->type() ==
        QwtScaleTransformation::Log10 )
    {
        v = pow(10.0, v);
    }

    QString text;
    text.setNum(v, 'f', 1);

    d_label->setText(text);
}
