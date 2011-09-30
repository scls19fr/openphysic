#include "plot.h"

#include <qwt_legend.h>
#include <qwt_scale_draw.h>

Plot::Plot(QWidget *parent):
    QwtPlot(parent)
{
    setTitle("Slider and plot Demonstration");
    insertLegend(new QwtLegend(), QwtPlot::RightLegend);

    // Set axis titles
    setAxisTitle(xBottom, "t");
    setAxisTitle(yLeft, "y");

    // Set axis scale
    setAxisScale(QwtPlot::yLeft, 0.0, 100.0);

    //setAxisScale(QwtPlot::xBottom, 0.0, 60.0);
    //setAxisScaleDraw(QwtPlot::xBottom, 
    //    new TimeScaleDraw(this->upTime()));
    //setAxisScale(QwtPlot::xBottom, 0, HISTORY);

    setAxisLabelRotation(QwtPlot::xBottom, -45.0);
    setAxisLabelAlignment(QwtPlot::xBottom, Qt::AlignLeft | Qt::AlignBottom);

/*
    setAxisScaleDraw(QwtPlot::xBottom, 
        new TimeScaleDraw(cpuStat.upTime()));
*/
}

QTime Plot::upTime() const
{
    QTime t;
    //for ( int i = 0; i < NValues; i++ )
    //    t = t.addSecs(int(procValues[i] / 100));

    return t;
}



class TimeScaleDraw: public QwtScaleDraw
{
public:
    TimeScaleDraw(const QTime &base):
        baseTime(base)
    {
    }
    virtual QwtText label(double v) const
    {
        QTime upTime = baseTime.addSecs((int)v);
        return upTime.toString();
    }
private:
    QTime baseTime;
};
