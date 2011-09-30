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

#ifndef QRPMMETER_H
#define QRPMMETER_H

#include <QProgressBar>

class QRPMMeter : public QProgressBar
  {
    Q_OBJECT

    public:
      QRPMMeter (QWidget *parent = 0);


      enum drawtype {rectangle, triangle, x2, barre_x2};

      int type() const;
      void setType(int t);

    protected:
      void paintEvent(QPaintEvent * event);
      double bottom(int value);
      double bottom_x2(double i);

    private:
      int m_type;

      int N_Bar; // nombre de barres du RPMmetre
      //double Bar_Width=2.0; // largeur de la barre
      //double Bar_X_Space=2.0; // ecartement horizontal entre les barres
      double Bar_Width; // largeur de la barre
      double Bar_X_Space; // ecartement horizontal entre les barres

      double Bar_Height_Max; // hauteur maxi de la barre
      double Bar_Height_Min; // hauteur mini de la barre
      double Bar_Height_Mid; // hauteur de la barre du milieu

  };

#endif
