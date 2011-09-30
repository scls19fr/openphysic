#include "ticker.h"

int main(int argc, char *argv[]) {
  QApplication app(argc, argv);
  //QWidget window;
  //QGridLayout layout(&window);
  //layout.setMargin(15);
  Ticker ticker("Qt increases productivity ++");
  ticker.show();
  //layout.addWidget(&ticker, 1, 1);
  //window.show();
  return app.exec();
}


