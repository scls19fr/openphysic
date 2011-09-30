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

#include "qtemperature.h"

QTemperature::QTemperature(QWidget *parent) : QWidget(parent)
{
  setGeometry(0,320,320,30);

}

void QTemperature::paintEvent(QPaintEvent * /* event */)
{
  QPainter painter(this);
  painter.setRenderHint(QPainter::Antialiasing, true);
  QLinearGradient gradientTemp(0, 0, width(), 0);
  gradientTemp.setColorAt(0.0, Qt::blue);
  gradientTemp.setColorAt(0.25, Qt::green);
  //gradientTemp.setColorAt(0.5, Qt::white);
  gradientTemp.setColorAt(0.75, Qt::yellow);
  gradientTemp.setColorAt(1.0, Qt::red);
  QPen penTemp(gradientTemp, 0); // no contour
  QRectF rectTemp(0, 0, width()-1, height()-1);
  painter.setBrush(gradientTemp);
  painter.setPen(penTemp); // no contour
  painter.drawRect(rectTemp);
}

