#include <gtkmm/main.h>
#include <gtkmm/window.h>
#include <gtkmm/box.h>
#include <gtkmm/label.h>
#include <gtkmm/entry.h>
#include <gtkmm/button.h>

class maFenetre : public Gtk::Window
{
protected:
    Gtk::VBox vb;
    Gtk::Label l;
    Gtk::Entry e;
    Gtk::Button b;

    void on_button_clicked();
public:
	maFenetre();
	virtual ~maFenetre();
};

maFenetre::maFenetre() : b("Bonjour !")
{
    set_title("Bonjour toi !");
    set_icon_from_file("hi.png");
    vb.pack_start(l);
    l.show();
    vb.pack_start(e);
    e.show();
    b.signal_clicked().connect(SigC::slot(*this, &maFenetre::on_button_clicked));
    vb.pack_start(b);
    b.show();

    add(vb);
    vb.show();
}

maFenetre::~maFenetre()
{
}

void maFenetre::on_button_clicked()
{
	l.set_text("Bonjour " + e.get_text() + " !");
}

int main(int argc, char **argv)
{
    Gtk::Main app(argc, argv);
    maFenetre w;

    app.run(w);
    return 0;
}
