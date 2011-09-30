/*
OpenChrono
Copyright (C) 2007  Sebastien CELLES
 
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

#ifndef COLOR_H
#define COLOR_H

/*
class Color
{
 public:
  Color( );
 
};
*/

#include <QColor>

void showRGBA(QColor color)
{
  int r,g,b,a;
  color.getRgb(&r, &g, &b, &a );
  cout << "R = " << r << " ; " << "G = "<< g << " ; " << "B = "<< b << " ; " << "alpha = " << a << endl;
}

QColor getColorAt(double x)
{
  QColor color1, color2, color3;
  double x1, x2, x3;

  int r1,g1,b1,a1;
  int r2,g2,b2,a2;
  int r3,g3,b3,a3;
  int r,g,b,a;

  color1 = Qt::green;
  color1.getRgb(&r1, &g1, &b1, &a1 );
  x1 = 0.0;

  color2 = Qt::yellow;
  color2.getRgb(&r2, &g2, &b2, &a2 );
  x2 = 0.5;

  color3 = Qt::red;
  color3.getRgb(&r3, &g3, &b3, &a3 );
  x3 = 1.0;

  if ( (x>=x1) and (x<x2) )
    {
      r = (int) ((r2-r1)/(x2-x1) * (x-x1) + r1);
      g = (int) ((g2-g1)/(x2-x1) * (x-x1) + g1);
      b = (int) ((b2-b1)/(x2-x1) * (x-x1) + b1);
      a = (int) ((a2-a1)/(x2-x1) * (x-x1) + a1);
    }
  else if ( (x>=x2) and (x<=x3) )
    {
      r = (int) ((r3-r2)/(x3-x2) * (x-x2) + r2);
      g = (int) ((g3-g2)/(x3-x2) * (x-x2) + g2);
      b = (int) ((b3-b2)/(x3-x2) * (x-x2) + b2);
      a = (int) ((a3-a2)/(x3-x2) * (x-x1) + a2);
    }
  else
    {
      //
      r = 0;
      g = 0;
      b = 0;
      a = 0;
    }

  return QColor(r,g,b,a);
}


/*
Color RGB pour RPM
Vert  :   0 255   0 
Jaune : 255 255   0
Rouge : 255   0   0
 
QColorMap ?
QLinearGradient rect_gradient(0, 0, 0, height());
rect_gradient.setColorAt(0, Qt::red);
rect_gradient.setColorAt(.7, Qt::yellow);
rect_gradient.setColorAt(1, Qt::green);
*/

#endif
