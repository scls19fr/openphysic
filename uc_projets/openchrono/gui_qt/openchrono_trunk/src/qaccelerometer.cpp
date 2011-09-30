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

#include "qaccelerometer.h"

#include <QtGui>

#include <iostream>

QAccelerometer::QAccelerometer(QWidget *parent) : QWidget(parent)
{
  setGeometry(QRect(0,0,100,100));
  //setSize(100,100);

  setGmax(2);

  /* Tests */
  /*
  setGX(0.5);
  setGY(1.5);
  */
/*
  setGX(0.5);
  setGY(-1.5);
*/
  setG(0.0, 0.0);


  matrix.scale(0.9,0.9);

  m_editable = false;
}

void QAccelerometer::setGX(const double g)
{
  m_GX = g;
  this->update();
}

void QAccelerometer::setGY(const double g)
{
  m_GY = g;
  this->update();
}

void QAccelerometer::setG(const double gx, const double gy)
{
  m_GX = gx;
  m_GY = gy;
  this->update();
}

/*
 ToDo : utiliser window-viewport
 graph.setWindow(xmin,ymin,width,height);
*/
/*
double QAccelerometer::gx_to_x(double g)
{
  double w = (double) (this->geometry().width()-1);
  return w/(2.0*Gmax())*(g-Gmax())+w;
}

double QAccelerometer::gy_to_y(double g)
{
  double h = (double) (this->geometry().height()-1);
  return -h/(2.0*Gmax())*(g-Gmax());
}
*/

double QAccelerometer::x_to_gx(double x)
{
/*
x = w/(2.0*Gmax)*(g-Gmax)+w
(x-w)*(2.0*Gmax)/w+Gmax
*/
  //double w = (double) (this->geometry().width()-1);
  double w = qMin(width(), height());
  return ((x-w)*(2.0*Gmax())/w+Gmax())/0.9;
}

double QAccelerometer::y_to_gy(double y)
{
  double h = (double) (this->geometry().height()-1);
  //double h = (double) qMin(this->geometry().width()-1, this->geometry().height()-1);
/* 
y = -h/(2.0*Gmax)*(g-Gmax)
y * 2.0*Gmax/h + Gmax
*/
  return (Gmax() - ((double) y) * 2.0*Gmax()/((double) h))/0.9;
}

/*
void QAccelerometer::drawCercle(QPainter & painter, double g)
{
  int x1, y1, x2, y2;
  x1 = (int) gx_to_x(-g);
  y1 = (int) gy_to_y(g);
  x2 = (int) gx_to_x(g);
  y2 = (int) gy_to_y(-g);
  painter.drawEllipse(x1,y1,x2-x1,y2-y1);    
}
*/

void QAccelerometer::paintEvent(QPaintEvent * /* event */)
{
  //std::cout << "paint accelero" << std::endl;

  QPainter painter(this);
  painter.setRenderHint(QPainter::Antialiasing, true);

  //painter.save();

  int side = qMin(width(), height());
  //double eps=1.3; //5;

  painter.setViewport( (width()-side)/2, (height()-side)/2, side, side);
  //painter.setWindow(QRect(-Gmax()*eps,Gmax()*eps,2*Gmax()*eps,-2*Gmax()*eps)); /* ToDo */
  //painter.drawLine(QPointF(-Gmax(),-Gmax()),QPointF(Gmax(),Gmax()));

  painter.setWindow( QRect( -Gmax(), Gmax(), 2*Gmax(), -2*Gmax() ) );
  //painter.setWindow(QRect(-Gmax()*eps,Gmax()*eps,2*Gmax()*eps,-2*Gmax()*eps));
  //painter.drawLine( QPointF(-2,-2), QPointF(2,2) );
  //painter.drawLine( QPointF(-1.5,1.5), QPointF(1.5,-1.5) );

  //QMatrix matrix;

  painter.setMatrix(matrix);

  QPen pen;
  //pen.setWidth(1);


  double g;
  painter.setBrush(Qt::NoBrush);

  pen.setColor(Qt::black);
  //pen.setWidthF(0.0);
  painter.setPen(pen);
  for (g=1 ; g<=Gmax() ; g+=1) {
    painter.drawEllipse( QRectF( -g, -g, 2*g, 2*g ) );
  }

  pen.setColor(Qt::gray);
  painter.setPen(pen);
  for (g=0.5 ; g<=Gmax() ; g+=1) {
    painter.drawEllipse( QRectF( -g, -g, 2*g, 2*g ) );
  }

  const double epsG = 0.05;

  pen.setColor(Qt::gray);
  painter.setPen(pen);
  painter.drawLine( QPointF(-2*epsG, 0), QPointF(2*epsG, 0) );
  painter.drawLine( QPointF(0, -2*epsG), QPointF(0, 2*epsG) );

  painter.setBrush(Qt::red);
  painter.setPen(Qt::red);

  painter.drawEllipse( QRectF( GX()-epsG, GY()-epsG, 2*epsG, 2*epsG ) );

  //painter.restore();
}

void QAccelerometer::setEditable() {
  m_editable = true;
}

void QAccelerometer::unsetEditable() {
  m_editable = false;
}

void QAccelerometer::mousePressEvent (QMouseEvent * event)
{
  mouseClickOrMoveEvent(event);
}

void QAccelerometer::mouseMoveEvent (QMouseEvent * event)
{
//  std::cout << "mouseMoveEvent on QAccelerometer" << std::endl;
  mouseClickOrMoveEvent(event);
}


void QAccelerometer::mouseClickOrMoveEvent (QMouseEvent * event)
{
  if (m_editable) {
    //QPainter painter(this);
    //QMatrix matrix_inv;
    
    setG(x_to_gx(event->x()), y_to_gy(event->y()));
    //QPointF point = event->pos() - rect().center();
    //setG( point.x(), point.y() );
    emit changed();
    this->update();
  }

/*
    std::cout << "mousePressEvent on QAccelerometer "
      << "X=" << event->x() << " ; " << "Y=" << event->y()
      << " - "
      << "Gx=" << x_to_gx(event->x()) << " ; " << "Gy=" << y_to_gy(event->y()) << std::endl;
*/

/*
    setGX(x_to_gx(event->x()));
    setGY(y_to_gy(event->y()));
*/

}
