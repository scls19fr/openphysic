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

#include "ticker.h"

Ticker::Ticker(QWidget *parent) : QLabel(parent), offset(0) {
  setBackgroundRole(QPalette::Base);
  setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
  timer.setInterval(20);
  connect(&timer, SIGNAL(timeout()), this, SLOT(progress()));
}

/*
Ticker::Ticker(const QString &text, QWidget *parent) : QLabel(parent), txt(text), offset(0) {
  //setFrameStyle(WinPanel | Sunken);
  setBackgroundRole(QPalette::Base);
  setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
  timer.setInterval(20);
  connect(&timer, SIGNAL(timeout()), this, SLOT(progress()));
}
*/

QSize Ticker::sizeHint() const {
  //return QSize(40 * fontMetrics().width('x'), fontMetrics().lineSpacing() + 2 * frameWidth());
  return fontMetrics().size(0, text());
}

void Ticker::paintEvent(QPaintEvent *event) {
  QWidget::paintEvent(event);
  QPainter painter(this);
  for (int x = 0; x < width() - offset; x += fontMetrics().width(txt))
    painter.drawText(x + offset, 0, 65536, height(), Qt::AlignVCenter, txt);
}

void Ticker::progress() {
  if (--offset < -fontMetrics().width(txt)) offset = 0;
  update();
}

