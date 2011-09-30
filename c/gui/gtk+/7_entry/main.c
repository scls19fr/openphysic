#include <stdlib.h>
#include <gtk/gtk.h>

struct _MainWindow
{
    GtkWidget *pWindow;
    GtkWidget *pVBox;
    GtkWidget *pEntry;
    GtkWidget *pButton;
    GtkWidget *pLabel;
};

typedef struct _MainWindow MainWindow;

void OnUpdate(GtkWidget *pEntry, gpointer data);

int main(int argc, char **argv)
{
    MainWindow *pApp;

    gtk_init(&argc, &argv);
    
    pApp = g_malloc(sizeof(MainWindow));

    pApp->pWindow = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(pApp->pWindow), "Le widget GtkEntry");
    gtk_window_set_default_size(GTK_WINDOW(pApp->pWindow), 320, 200);
    g_signal_connect(G_OBJECT(pApp->pWindow), "destroy", G_CALLBACK(gtk_main_quit), NULL);

    pApp->pVBox = gtk_vbox_new(TRUE, 0);
    gtk_container_add(GTK_CONTAINER(pApp->pWindow), pApp->pVBox);

    /* Creation du GtkEntry */
    pApp->pEntry = gtk_entry_new();
    /* Insertion du GtkEntry dans la GtkVBox */
    gtk_box_pack_start(GTK_BOX(pApp->pVBox), pApp->pEntry, TRUE, FALSE, 0);

    pApp->pButton = gtk_button_new_with_label("Copier");
    gtk_box_pack_start(GTK_BOX(pApp->pVBox), pApp->pButton, TRUE, FALSE, 0);

    pApp->pLabel = gtk_label_new(NULL);
    gtk_box_pack_start(GTK_BOX(pApp->pVBox), pApp->pLabel, TRUE, FALSE, 0);

    /* Connexion du signal "activate" du GtkEntry */
    g_signal_connect(G_OBJECT(pApp->pEntry), "activate", G_CALLBACK(OnUpdate), (gpointer) pApp);

    /* Connexion du signal "clicked" du GtkButton */
    /* La donnee supplementaire est la GtkVBox pVBox */
    g_signal_connect(G_OBJECT(pApp->pButton), "clicked", G_CALLBACK(OnUpdate), (gpointer*) pApp);

    gtk_widget_show_all(pApp->pWindow);

    gtk_main();

    g_free(pApp);

    return EXIT_SUCCESS;
}

/* Fonction callback execute lors du signal "activate" */
void OnUpdate(GtkWidget *pEntry, gpointer data)
{
    const gchar *sText;
    MainWindow *pApp;
    
    /* Recuperation de data */
    pApp = (MainWindow*) data;

    /* Recuperation du texte contenu dans le GtkEntry */
    sText = gtk_entry_get_text(GTK_ENTRY(pApp->pEntry));

    /* Modification du texte contenu dans le GtkLabel */
    gtk_label_set_text(GTK_LABEL(pApp->pLabel), sText);
}
