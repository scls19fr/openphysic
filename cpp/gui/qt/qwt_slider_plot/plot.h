#include <qwt_plot.h>


#include <qdatetime.h>

class Plot: public QwtPlot
{
    Q_OBJECT
public:
    Plot(QWidget *parent);
    QTime upTime() const;


};
