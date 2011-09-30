/*
OpenChrono
Copyright (C) 2008  Sebastien CELLES
 
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
 
You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

#include "qrpmmeter.h"

#include <QtGui>

#include <iostream>

QRPMMeter::QRPMMeter(QWidget *parent) : QProgressBar(parent)
{
  //std::cout << "RPMmeter" << std::endl;

  setType(rectangle);
  //setType(triangle);
  //setType(x2);
  //setType(barre_x2);

}

double QRPMMeter::bottom(int value)
{
  //return 0.0;
  //return (height()*value)/maximum()+height()*1.0/4.0;
  return (height()*3.0/4.0*value)/maximum()+height()*1.0/4.0;
  //return height();
}

double QRPMMeter::bottom_x2(double i)
{
  return (((Bar_Height_Max-Bar_Height_Min)*(N_Bar/2.0-1)-(Bar_Height_Mid-Bar_Height_Min)*(N_Bar-1))
	/(pow((N_Bar-1),2)*(N_Bar/2.0-1)-(pow(N_Bar/2.0-1,2)*(N_Bar-1))))*pow(i,2)
  + (((Bar_Height_Max-Bar_Height_Min)*pow(N_Bar/2.0-1,2)-(Bar_Height_Mid-Bar_Height_Min)*pow(N_Bar-1,2))
    /((N_Bar-1)*pow(N_Bar/2.0-1,2)-(N_Bar/2.0-1)*pow(N_Bar-1,2)))*i
  + Bar_Height_Min;
}

int QRPMMeter::type() const
{
  return m_type;
}

void QRPMMeter::setType(int t)
{
  m_type = t;
}

void QRPMMeter::paintEvent(QPaintEvent * /* event */)
{
  N_Bar=70; // nombre de barres du RPMmetre
  //Bar_Width=2.0; // largeur de la barre
  //Bar_X_Space=2.0; // ecartement horizontal entre les barres
  Bar_Width=width()/(2.0*N_Bar); // largeur de la barre
  Bar_X_Space=width()/(2.0*N_Bar); // ecartement horizontal entre les barres

  Bar_Height_Max=height()-1; // hauteur maxi de la barre
  Bar_Height_Min=Bar_Height_Max*0.25; // hauteur mini de la barre
  Bar_Height_Mid=Bar_Height_Max*0.4; // hauteur de la barre du milieu


/*
  N_Bar=30; // nombre de barres du RPMmetre
  Bar_Width=0.75*width()/((double) N_Bar); // largeur de la barre
  Bar_X_Space=0.25*width()/((double) N_Bar); // ecartement horizontal entre les barres

  Bar_Height_Max=height()-1; // hauteur maxi de la barre
  Bar_Height_Min=Bar_Height_Max*0.25; // hauteur mini de la barre
  Bar_Height_Mid=Bar_Height_Max*0.4; // hauteur de la barre du milieu
*/
  //std::cout << "paint RPMmeter" << std::endl;
  //std::cout << "value=" << this->value() << std::endl;

  QPainter painter(this);

  /* Rendering quality
    see file:///usr/share/qt4/doc/html/qpainter.html#RenderHint-enum
    Antialiasing should be set to 'false' to debug drawing error
 */
  painter.setRenderHint(QPainter::Antialiasing, true);
  //painter.setRenderHint(QPainter::TextAntialiasing, true);
  //painter.setRenderHint(QPainter::SmoothPixmapTransform, true);
  //painter.setRenderHint(QPainter::HighQualityAntialiasing, true);

  double RPM=value();

  QLinearGradient gradientON(0, 0, width(), 0);
  gradientON.setColorAt(0.0, Qt::green);
  gradientON.setColorAt(0.8, Qt::yellow);
  gradientON.setColorAt(1.0, Qt::red);
  QPen penON(gradientON, 0); // no contour


  QLinearGradient gradientOFF(0, 0, width(), 0);
  QColor green = Qt::green;
  QColor yellow = Qt::yellow;
  QColor red = Qt::red;
  const int dark=200; /* Darker */
  green = green.darker(dark);
  yellow = yellow.darker(dark);
  red = red.darker(dark);
  const int alpha=200; /* Alpha-Blended Drawing : fully transparent color 0-255 fully opaque color */
  green.setAlpha(alpha);
  yellow.setAlpha(alpha);
  red.setAlpha(alpha);
  gradientOFF.setColorAt(0.0, green);
  gradientOFF.setColorAt(0.8, yellow);
  gradientOFF.setColorAt(1.0, red);
  //gradientOFF=gradient.darker(150); // this method (unfortunatel doesn't exist
  QPen penOFF(gradientOFF, 0); // no contour


  // Value of RPM
  // format = "%v RPM"
  //painter.setRenderHint(QPainter::Antialiasing, false);
  QString strRPM;
  strRPM.sprintf("%d RPM", (int) RPM);
  QPen penTxt(Qt::black);
  //penTxt.setWidth(0);
  if (RPM>=maximum())
    penTxt.setColor(Qt::red);
  QRectF rectTxt(0, 0, width()*0.62, height());
  //painter.drawText(rectTxt, Qt::AlignRight|Qt::AlignVCenter, strRPM);

  if (type()==rectangle) {
    // rectangle with gradient
    QRectF rectOFF(0, 0, width()-1, height()-1);
    painter.setBrush(gradientOFF);
    painter.setPen(penOFF); // no contour
    painter.drawRect(rectOFF);
    //painter.drawRoundedRect(rectOFF,10.0,10.0);

    if (RPM>0) {
      QRectF rectON(0, 0, ((width()-1)*RPM)/(maximum()), height()-1);
      painter.setBrush(gradientON);
      painter.setPen(penON); // no contour
      painter.drawRect(rectON);
      //painter.drawRoundedRect(rectON,10.0,10.0);
    }

    //QRectF rectTxt(0, 0, width()*0.62, height());
    painter.setPen(penTxt);
    painter.drawText(rectTxt, Qt::AlignRight|Qt::AlignVCenter, strRPM);
  } else if (type()==triangle) {
    // path (triangle, polygon) with gradient
    QPainterPath pathOFF;
    pathOFF.moveTo(0.0, 0.0);
    pathOFF.lineTo(width()-1, 0.0);
    pathOFF.lineTo(width()-1, height()-1);
    pathOFF.lineTo(0, height()*1.0/4.0);
    pathOFF.closeSubpath();
    painter.setBrush(gradientOFF);
    painter.setPen(penOFF); // no contour
    painter.drawPath(pathOFF);

    QPainterPath pathON;
    pathON.moveTo(0.0, 0.0);
    pathON.lineTo((width()-1)*RPM/(maximum()), 0.0);
    pathON.lineTo((width()-1)*RPM/(maximum()), bottom(RPM));
    pathON.lineTo(0, height()*1.0/4.0);
    pathON.closeSubpath();
    painter.setBrush(gradientON);
    painter.setPen(penON); // no contour
    painter.drawPath(pathON);
    //QRectF rectTxt(0, 0, width()*0.62, height());
    painter.setPen(penTxt);
    painter.drawText(rectTxt, Qt::AlignRight|Qt::AlignTop, strRPM);
  } else if (type()==x2) {
    QPainterPath pathOFF;
    pathOFF.moveTo(0.0, 0.0);
    pathOFF.lineTo(0, height()*1.0/4.0);
    for ( int i=0 ; i <= N_Bar ; ++i ) {
      pathOFF.lineTo((width()-1)*((double) i)/((double) N_Bar), bottom_x2(i));
    }
    pathOFF.lineTo(width()-1, 0.0);
    pathOFF.closeSubpath();
    painter.setBrush(gradientOFF);
    painter.setPen(penOFF); // no contour
    painter.drawPath(pathOFF);

    QPainterPath pathON;
    pathON.moveTo(0.0, 0.0);
    pathON.lineTo(0, height()*1.0/4.0);
    for ( double i=0 ; i <= (((double) N_Bar)*(RPM-minimum()))/(maximum()-minimum()) ; ++i ) {
      pathON.lineTo((width()-1)/((double) N_Bar)*((double) i), bottom_x2(i));
    }
    pathON.lineTo((width()-1)*(RPM-minimum())/(maximum()-minimum()), 0.0);
    pathON.closeSubpath();
    painter.setBrush(gradientON);
    painter.setPen(penON); // no contour
    painter.drawPath(pathON);

    painter.setPen(penTxt);
    painter.drawText(rectTxt, Qt::AlignRight|Qt::AlignTop, strRPM);
  } else if (type()==barre_x2) {
    /* barres */
    for ( int i=0 ; i < N_Bar ; i++ ) {
      if (i<(((double) N_Bar)*(RPM-minimum()))/(maximum()-minimum())) { // nb de barres à allumer / éteindre
        painter.setPen(penON);
        painter.setBrush(gradientON);
      } else {
        painter.setPen(penOFF);
        painter.setBrush(gradientOFF);
      }
      QRectF rect(
        Bar_X_Space/2.0 + i * (Bar_Width + Bar_X_Space),
        0,
        Bar_Width,
        bottom_x2(i)
      );
      //painter.drawRect(rect);
      painter.drawRoundedRect(rect,3,3);
    }
    //QRectF rectTxt(0, 0, width()*0.62, height());
    painter.setPen(penTxt);
    painter.drawText(rectTxt, Qt::AlignRight|Qt::AlignTop, strRPM);
  }
}


/*
Usefull links
http://doc.trolltech.com/4.4/painting-basicdrawing.html
http://doc.trolltech.com/4.4/painting-painterpaths.html
http://www.unixgarden.com/index.php/programmation/qt-4-%E2%80%93-3-dessins-et-graphismes
file:///usr/share/qt4/doc/html/qcolor.html
*/

