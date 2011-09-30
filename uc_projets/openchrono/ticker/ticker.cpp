#include "ticker.h"

Ticker::Ticker(const QString &text, QWidget *parent) : QLabel(parent), txt(text), offset(0) {
  //setFrameStyle(WinPanel | Sunken);
  setBackgroundRole(QPalette::Base);
  setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
  timer.setInterval(20);
  connect(&timer, SIGNAL(timeout()), this, SLOT(progress()));
}

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

