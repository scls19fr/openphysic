#include <FL/Fl.h>
#include <FL/Fl_Window.h>

int main(int argc, char **argv) {
	Fl_Window *window = new Fl_Window(250,100,"hello");
	window->show(argc, argv);
	return Fl::run();
}
