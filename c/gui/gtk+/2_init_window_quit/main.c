#include <stdlib.h>
#include <gtk/gtk.h>

int main(int argc,char **argv)
{
    /* Declaration du widget */
    GtkWidget *pWindow;

    gtk_init(&argc,&argv);

    /* Creation de la fenetre */
    pWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    /* Affichage de la fenetre */
    gtk_widget_show(pWindow);
    /* Destruction de la fenetre */
    gtk_widget_destroy(pWindow);

    return EXIT_SUCCESS;
}
