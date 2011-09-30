/****************************************************************************
** ui.h extension file, included from the uic-generated form implementation.
**
** If you want to add, delete, or rename functions or slots, use
** Qt Designer to update this file, preserving your code.
**
** You should not define a constructor or destructor in this file.
** Instead, write your code in functions called init() and destroy().
** These will automatically be called by the form's constructor and
** destructor.
*****************************************************************************/

#include <iostream>
using namespace std;

void frm_main::Draw()
{
    pixmapLabel1->clear();
    
    double x_min = 0;
    double y_min = 0;
    double x_max = pixmapLabel1->width();
    double y_max = pixmapLabel1->height();
    
    //cout << x_max << "\t" << y_max << endl;
    
    // http://doc.trolltech.com/3.3/qpen.html
    // 
    QPainter painter;
    QPen pen( Qt::red, 2 );
    

    
    painter.begin(pixmapLabel1);
    painter.setBackgroundColor(Qt::white);
    painter.setBrush(Qt::blue);
    
    pixmapLabel1->repaint(true);
    
    //painter.moveTo((int) (x_max/2),(int) (y_max/2));
    
    //QPen *pen = new QPen(Qt::blue, 5, Qt::SolidLine);
							   
    //painter->setPen(Qt::blue);
    painter.setPen(pen);
    
    //painter.drawPoint(painter.pos());
    //painter.drawLine(0,0,(int) x_max, (int) y_max);
    
     double const Nb_pts = 100;
     
     double const T1 = 1/(sgn->get_f1());     
     double const t_min = -T1/2;
     double const t_max = T1/2;
     
     //double t = t_min;
     double s = sgn->get_value(-T1/1);
     double s_min = sgn->get_value(-T1/1);
     double s_max = sgn->get_value(-T1/1);

     
     for (double time=t_min+T1/Nb_pts ; time<t_max ; time+=T1/Nb_pts)
     {
	 s = sgn->get_value(time);
	 if (s>s_max)
	 {
	     s_max=s;
	 }
	 if (s<s_min)
	 {
	     s_min=s;
	 }
	 
	 //cout << time << "\t" << sgn->get_value(time) << endl;
     }
     
     //cout << s_min << " " << s_max << "|" << y_min << " " << y_max << endl; // TO FIX
     
     double x0 = x_min;
     double y0 = (y_max-y_min)/(s_max-s_min)*(sgn->get_value(t_min))+y_max/2;
     
     double x1 =0;
     double y1 = 0;
 

     
     for (double time=t_min+T1/Nb_pts ; time<=t_max ; time+=T1/Nb_pts)
     {
	x1 = (x_max-x_min)/(t_max-t_min)*(time-t_min)+t_min;
	y1 = (y_max-y_min)/(s_max-s_min)*(sgn->get_value(time))+y_max/2;
	painter.drawLine((int) x0, (int) y0, (int) x1, (int) y1);
	x0 = x1;
	y0 = y1;
     }
     
    painter.end();
    
    //delete pen; pen = NULL;
    //delete painter; painter = NULL;  
}

void frm_main::butAmplitude_clicked()
{
    cout << "butAmplitude_clicked" << endl;
}


void frm_main::butPhase_clicked()
{
    cout << "butPhase_clicked" << endl;
}


void frm_main::butAmplitudePhase_clicked()
{
    cout << "butAmplitudePhase_clicked" << endl;
}


void frm_main::butSound_clicked()
{
    cout << "butSound_clicked" << endl;
}


void frm_main::slider_f1_valueChanged( int )
{
    const double f_min = 20;
    const double f_max = 20000;
    
    const double val = -slider_f1->value()+f_max+f_min;
    numLabel_f1->setText(QString::number(val,'f',0));
    sgn->set_f1(val);
    Draw(); 
}


void frm_main::slider_a0_valueChanged( int )
{
    const double val = 1-slider_a0->value()/1000.0;
    numLabel_a0->setText(QString::number(val,'f',3));
    sgn->set_a0(val);
    Draw();
}

void frm_main::slider_a1_valueChanged( int )
{
    const double val = 1-slider_a1->value()/1000.0;
    numLabel_a1->setText(QString::number(val,'f',3));
    sgn->set_a1(val);
    Draw();
}


void frm_main::slider_a2_valueChanged( int )
{
    const double val = 1-slider_a2->value()/1000.0;
    numLabel_a2->setText(QString::number(val,'f',3));
   sgn->set_amplitude(2,val);
   Draw();
}


void frm_main::slider_ph2_valueChanged( int )
{
    const double val = -slider_ph2->value();
    numLabel_ph2->setText(QString::number(val,'f',0));
    sgn->set_phase(2,val);
    Draw();
}


void frm_main::slider_a3_valueChanged( int )
{
    const double val = 1-slider_a3->value()/1000.0;
    numLabel_a3->setText(QString::number(val,'f',3));
    sgn->set_amplitude(3,val);    
    Draw();
}


void frm_main::slider_ph3_valueChanged( int )
{
    const double val = -slider_ph3->value();
    numLabel_ph3->setText(QString::number(val,'f',0));
    sgn->set_phase(3,val);
    Draw();
}


void frm_main::slider_a4_valueChanged( int )
{
    const double val = 1-slider_a4->value()/1000.0;
    numLabel_a4->setText(QString::number(val,'f',3));
    sgn->set_amplitude(4,val);
    Draw();
}


void frm_main::slider_ph4_valueChanged( int )
{
    const double val = -slider_ph4->value();
    numLabel_ph4->setText(QString::number(val,'f',0));
    sgn->set_phase(4,val);
    Draw();
}


void frm_main::slider_a5_valueChanged( int )
{
    const double val = 1-slider_a5->value()/1000.0;
    numLabel_a5->setText(QString::number(val,'f',3));
    sgn->set_amplitude(5,val);
    Draw();
}


void frm_main::slider_ph5_valueChanged( int )
{
    const double val = -slider_ph5->value();    
    numLabel_ph5->setText(QString::number(val,'f',0));
    sgn->set_phase(5,val);
    Draw();
}


void frm_main::slider_a6_valueChanged( int )
{
    const double val = 1-slider_a6->value()/1000.0;
    numLabel_a6->setText(QString::number(val,'f',3));
    sgn->set_amplitude(6,val);
    Draw();
}


void frm_main::slider_ph6_valueChanged( int )
{
    const double val = -slider_ph6->value();
    numLabel_ph6->setText(QString::number(val,'f',0));
    sgn->set_phase(6,val);
    Draw();
}


void frm_main::slider_a7_valueChanged( int )
{
    const double val = 1-slider_a7->value()/1000.0;
    numLabel_a7->setText(QString::number(val,'f',3));
    sgn->set_amplitude(7,val);
    Draw();
}


void frm_main::slider_ph7_valueChanged( int )
{
    const double val = -slider_ph7->value();
    numLabel_ph7->setText(QString::number(val,'f',0));
    sgn->set_phase(7,val);
    Draw();
}


void frm_main::slider_a8_valueChanged( int )
{
    const double val = 1-slider_a8->value()/1000.0;
    numLabel_a8->setText(QString::number(val,'f',3));
    sgn->set_amplitude(8,val);
    Draw();
}


void frm_main::slider_ph8_valueChanged( int )
{
    const double val = -slider_ph8->value();
    numLabel_ph8->setText(QString::number(val,'f',0));
    sgn->set_phase(8,val);
    Draw();
}


void frm_main::slider_a9_valueChanged( int )
{
    const double val = 1-slider_a9->value()/1000.0;
    numLabel_a9->setText(QString::number(val,'f',3));
    sgn->set_amplitude(9,val);
    Draw();
}


void frm_main::slider_ph9_valueChanged( int )
{
    const double val = -slider_ph9->value();
    numLabel_ph9->setText(QString::number(val,'f',0));
    sgn->set_phase(9,val);
    Draw();
}


void frm_main::slider_a10_valueChanged( int )
{
    const double val = 1-slider_a10->value()/1000.0;
    numLabel_a10->setText(QString::number(val,'f',3));
    sgn->set_amplitude(10,val);
    Draw();
}


void frm_main::slider_ph10_valueChanged( int )
{
    const double val = -slider_ph10->value();
    numLabel_ph10->setText(QString::number(val,'f',0));
    sgn->set_phase(10,val);
    Draw();
}


void frm_main::sgn_to_sliders()
{
    const double f_min = 20;
    const double f_max = 20000;
    
    slider_f1->setValue((int) (f_max+f_min-sgn->get_f1()));
    
    slider_a0->setValue(1000);
    slider_a1->setValue(0);
    slider_a2->setValue(1000);
    slider_a3->setValue(1000);
    slider_a4->setValue(1000);
    slider_a5->setValue(1000);
    slider_a6->setValue(1000);
    slider_a7->setValue(1000);
    slider_a8->setValue(1000);
    slider_a9->setValue(1000);
    slider_a10->setValue(1000);
    
    slider_ph2->setValue(0);
    slider_ph3->setValue(0);
    slider_ph4->setValue(0);
    slider_ph5->setValue(0);
    slider_ph6->setValue(0);
    slider_ph7->setValue(0);
    slider_ph8->setValue(0);    
    slider_ph9->setValue(0);    
    slider_ph10->setValue(0);    
}

void frm_main::sliders_refresh()
{
    slider_f1_valueChanged(0);
    slider_a0_valueChanged(0);
    slider_a1_valueChanged(0);
    slider_a2_valueChanged(0);
    slider_a3_valueChanged(0);
    slider_a4_valueChanged(0);
    slider_a5_valueChanged(0);
    slider_a6_valueChanged(0);
    slider_a7_valueChanged(0);
    slider_a8_valueChanged(0);    
    slider_a9_valueChanged(0);    
    slider_a10_valueChanged(0);    
    
    slider_ph2_valueChanged(0);
    slider_ph3_valueChanged(0);
    slider_ph4_valueChanged(0);
    slider_ph5_valueChanged(0);
    slider_ph6_valueChanged(0);
    slider_ph7_valueChanged(0);
    slider_ph8_valueChanged(0);    
    slider_ph9_valueChanged(0);    
    slider_ph10_valueChanged(0);    
}


void frm_main::Test()
{
    sgn->Test_Signal();
}


void frm_main::butTime_clicked()
{

}


void frm_main::paintEvent( QPaintEvent * )
{
    Draw();
}


void frm_main::init()
{
    sgn = new Signal();
    
    sliders_refresh();
    
    //sgn_to_sliders(); // TO FIX
    
    //sgn->Test_Signal();
    Draw();
}


void frm_main::destroy()
{
    delete sgn; sgn = NULL;
}
