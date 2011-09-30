/*
QProgressBar with gradient
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

#include <QApplication>
#include <QPlastiqueStyle>

#include <QGradient>
//#include <QPalette>


#include "qprogressbar_gradient.h"

int main(int argc, char ** argv)
{
  QApplication app( argc, argv );
  QApplication::setStyle(new QPlastiqueStyle);

  QGradient gradient;
  gradient.setColorAt(0, Qt::green);
  gradient.setColorAt(0.8, Qt::yellow);
  gradient.setColorAt(1, Qt::red);

  QProgressBar_Gradient bar(&gradient);
  bar.setGeometry(0,0,500,20);

  //bar.setValue(0);
  //bar.setValue(50);
  bar.setValue(80);
  //bar.setValue(100);

  bar.show();

  app.connect( &app, SIGNAL( lastWindowClosed() ), &app, SLOT( quit() ) );

  return app.exec();
}

