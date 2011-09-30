#include <stdlib.h>
#include <gtk/gtk.h>

#define EXEMPLE_1 0
#define EXEMPLE_2 1
#define EXEMPLE_3 2

void add_btn(GtkWidget *pWindow, gint iExemple);

int main(int argc, char **argv)
{
    GtkWidget* pWindow;

    gtk_init(&argc, &argv);

    /* Creation de la fenetre */
    pWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_default_size(GTK_WINDOW(pWindow), 320 ,200);
    gtk_container_set_border_width(GTK_CONTAINER(pWindow), 10);

    /* Connexion du signal "destroy" de la fenetre */
    g_signal_connect(G_OBJECT(pWindow), "destroy", G_CALLBACK(gtk_main_quit), NULL);

    /* Insertion du bouton */
    add_btn(pWindow, EXEMPLE_1);

    /* Affichage de la fenetre */
    gtk_widget_show_all(pWindow);

    /* Demarrage de la boucle evenementielle */
    gtk_main();

    return EXIT_SUCCESS;
}

/*
/* void add_btn(GtkWidget *pWindow, gint iExemple)
/*
/* Fonction en charge d'inserer le bouton dans la fenetre
/*
/* Parametre :
/* - pWindow : fenetre parente
/* - iExemple : mode de creation
/* EXEMPLE_1 pour un bouton label
/* EXEMPLE_2 pour un bouton EXEMPLE_1 + raccourci
/* EXEMPLE_3 pour un bouton EXEMPLE_2 + image
*/

void add_btn(GtkWidget *pWindow, gint iExemple)
{
    GtkWidget *pQuitBtn;

    switch(iExemple)
    {
    default:
    case EXEMPLE_1:
        /* Bouton avec un label */
        pQuitBtn = gtk_button_new_with_label("Quitter");
        gtk_window_set_title(GTK_WINDOW(pWindow), "Les boutons - Exemple 1");
        break;
    case EXEMPLE_2:
        /* Bouton avec un label et un raccourci */
        pQuitBtn = gtk_button_new_with_mnemonic("_Quitter");
        gtk_window_set_title(GTK_WINDOW(pWindow), "Les boutons - Exemple 2");
        break;
    case EXEMPLE_3:
        /* Bouton avec un label, un raccourci et une image */
        pQuitBtn = gtk_button_new_from_stock(GTK_STOCK_QUIT);
        gtk_window_set_title(GTK_WINDOW(pWindow), "Les boutons - Exemple 3");
        break;
    }

    /* Connexion du signal "clicked" du bouton */
    g_signal_connect(G_OBJECT(pQuitBtn), "clicked", G_CALLBACK(gtk_main_quit), NULL);

    /* Insertion du bouton dans la fenetre */
    gtk_container_add(GTK_CONTAINER(pWindow), pQuitBtn);
}
