#include "window.h"

int main(int argc, char **argv)
{

  UserInterface *window = new UserInterface();
  Fl_Double_Window *w = window->make_window();

  w->show();

  return Fl::run();
}
