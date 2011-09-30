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

#ifndef TICKER_H
#define TICKER_H

#include <QtGui>

class Ticker : public QLabel {

  Q_OBJECT
  Q_PROPERTY(QString text READ text WRITE setText)
  Q_PROPERTY(int speed READ speed WRITE setSpeed)

public:
  Ticker(QWidget *parent = 0);
  //Ticker(const QString &text, QWidget *parent = 0);

  void setText(const QString &text) { txt = text; update(); }
  QString text() const { return txt; }
  QSize sizeHint() const;
  void setSpeed(int speed) { timer.setInterval(speed); }
  int speed() const { return timer.interval(); }

protected:
  void showEvent(QShowEvent *) { timer.start(); }
  void hideEvent(QHideEvent *) { timer.stop(); }
  void paintEvent(QPaintEvent *event);

private slots:
  void progress();

private:
  QString txt; QTimer timer; int offset;

};

#endif
