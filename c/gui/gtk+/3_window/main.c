#include <stdlib.h>
#include <gtk/gtk.h>

void OnDestroy(GtkWidget *pWidget, gpointer pData);

int main(int argc,char **argv)
{
    /* Declaration du widget */
    GtkWidget *pWindow;

    gtk_init(&argc,&argv);

    /* Creation de la fenetre */
    pWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    /* Connexion du signal "destroy" */
    g_signal_connect(G_OBJECT(pWindow), "destroy", G_CALLBACK(OnDestroy), NULL);
    /* Affichage de la fenetre */
    gtk_widget_show(pWindow);

    /* Demarrage de la boucle evenementielle */
    gtk_main();

    return EXIT_SUCCESS;
}

void OnDestroy(GtkWidget *pWidget, gpointer pData)
{
    /* Arret de la boucle evenementielle */
    gtk_main_quit();
}
