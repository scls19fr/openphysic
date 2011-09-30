#include <QtGui>

class Ticker : public QLabel {

  Q_OBJECT
  Q_PROPERTY(QString text READ text WRITE setText)
  Q_PROPERTY(int speed READ speed WRITE setSpeed)

public:
  Ticker(const QString &text, QWidget *parent = 0);
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

