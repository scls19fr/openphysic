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

#ifndef QACCELEROMETER_H
#define QACCELEROMETER_H

#include <QColor>
#include <QImage>
#include <QWidget>
#include <QtGui>

class QAccelerometer : public QWidget
  {
    Q_OBJECT
    Q_PROPERTY(double GX READ GX WRITE setGX)

    public:
      QAccelerometer(QWidget *parent = 0);

      void setGX(const double g); // { m_GX = g; };
      double GX() const {return m_GX; };

      void setGY(const double g); // { m_GY = g; };
      double GY() const {return m_GY; };

      void setG(const double gx, const double gy);

      void setGmax(const double g) { m_Gmax = g; };
      double Gmax() const {return m_Gmax; };

      //double gx_to_x(double g);
      //double gy_to_y(double g);

      double x_to_gx(double x);
      double y_to_gy(double y);
/*
      void setGXmin(const double g) { m_GXmin = g; };
      double GXmin() const {return m_GXmin; };

      void setGXmax(const double g) { m_GXmax = g; };
      double GXmax() const {return m_GXmax; };

      void setGYmin(const double g) { m_GYmin = g; };
      double GYmin() const {return m_GYmin; };

      void setGYmax(const double g) { m_GYmax = g; };
      double GYmax() const {return m_GYmax; };
*/

      void setEditable();
      void unsetEditable();


    protected:
      void paintEvent(QPaintEvent * event);
      void mousePressEvent (QMouseEvent * event);
      void mouseMoveEvent (QMouseEvent * event);
      void mouseClickOrMoveEvent (QMouseEvent * event);

    signals:
      void changed( );

    private:
      double m_GX;
      double m_GY;

      double m_Gmax;
/*
      double m_GXmin;
      double m_GXmax;
      double m_GYmin;
      double m_GYmax;
*/
      //QImage image;

      //QPainter painter;
      QMatrix matrix;

      //void drawCercle(QPainter & painter, double g);

      bool m_editable;
  };

#endif
