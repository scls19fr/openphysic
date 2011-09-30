#include <gtkmm/main.h>
#include <gtkmm/window.h>
c
int main(int argc, char **argv)
{
  Gtk::Main app(argc, argv);
  Gtk::Window w;
  app.run(w);
  return 0;
}
