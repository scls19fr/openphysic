#include <stdbool.h>
#include <gtk/gtk.h>

static GdkPixmap *pixmap = NULL		;

static gboolean realisation( GtkWidget *aire_de_dessin, GdkEventConfigure *event )
{
  pixmap = gdk_pixmap_new( aire_de_dessin->window, 
			   aire_de_dessin->allocation.width, aire_de_dessin->allocation.height, -1 )			;

  gdk_draw_rectangle( pixmap, aire_de_dessin->style->white_gc, TRUE, 0, 0,
		      aire_de_dessin->allocation.width, aire_de_dessin->allocation.height )				;


  gdk_draw_line( pixmap, aire_de_dessin->style->black_gc, 0, 0, 50,50 )						;

  gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, TRUE, 50, 50, 100, 10 )				;

  gdk_draw_arc( pixmap, aire_de_dessin->style->black_gc, TRUE, 101, 179, 100, 50, 0, 180*64 )			;

  GdkPoint quadrilatere[4]											;
  quadrilatere[0].x = 100												;
  quadrilatere[0].y = 200												;
  quadrilatere[1].x = quadrilatere[0].x + 100									;
  quadrilatere[1].y = quadrilatere[0].y										;
  quadrilatere[2].x = quadrilatere[1].x + 50									;
  quadrilatere[2].y = quadrilatere[0].y + 100									;
  quadrilatere[3].x = quadrilatere[0].x - 50									;
  quadrilatere[3].y = quadrilatere[2].y				 						;
  gdk_draw_polygon( pixmap, aire_de_dessin->style->black_gc, true, quadrilatere, 4 )				;


  gtk_widget_queue_draw( aire_de_dessin )										;

  return TRUE													;
}

static gboolean rafraichissement( GtkWidget *aire_de_dessin, GdkEventExpose *event )
{
  gdk_draw_drawable( aire_de_dessin->window, 
		     aire_de_dessin->style->fg_gc[GTK_WIDGET_STATE(aire_de_dessin)],
		     pixmap, event->area.x, event->area.y, event->area.x, event->area.y, -1, -1 )				;
  return FALSE													;
}



int main(int argc, char **argv)
{
  GtkWidget *fenetre												;
  GtkWidget *aire_de_dessin											;

  gtk_init(&argc, &argv)												;


  fenetre = gtk_window_new(GTK_WINDOW_TOPLEVEL)									;
  gtk_window_set_title( GTK_WINDOW(fenetre), "petit dessin" )							;
  gtk_widget_set_size_request( fenetre, 500, 400 )								;
  g_signal_connect( G_OBJECT(fenetre), "destroy", G_CALLBACK(gtk_main_quit), NULL )				;


  aire_de_dessin = gtk_drawing_area_new() 		                       					;
  gtk_container_add( GTK_CONTAINER(fenetre), aire_de_dessin )				                        ;
  g_signal_connect( G_OBJECT(aire_de_dessin), "realize", G_CALLBACK(realisation), NULL )		 		;
  g_signal_connect( G_OBJECT(aire_de_dessin), "expose_event", G_CALLBACK(rafraichissement), NULL )		;


  gtk_widget_show_all(fenetre)											;
  gtk_main()													;

  return 0;
}
