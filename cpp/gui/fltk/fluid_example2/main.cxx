#include "window.h"

int main(int argc, char **argv)
{

  Fl_Double_Window *w = make_window();

  w->show();

  return Fl::run();
}
