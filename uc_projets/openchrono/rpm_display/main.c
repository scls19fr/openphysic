#include <stdbool.h>
#include <stdint.h>

#include <stdio.h>

#include <gtk/gtk.h>

#include <math.h>
inline uint8_t roundp(double n)
{
    return floor(n+0.5);
}

#define Npc_Min 20
#define Npc_Max 100

#define N_Bar 80 /* nombre de barres du RPMmetre */
#define Bar_Width 2 /* largeur de la barre */
#define Bar_Height 100 /* hauteur de la barre */
#define Bar_X_Space 2 /* ecartement horizontal entre les barres */

#define Vertical_Offset 10 /* decalage vertical des barres */
#define Horizontal_Offset 10 /* decalage vertical des barres */

#define Bar_Height_Min 20 /* hauteur mini de la barre */
#define Bar_Height_Max 100 /* hauteur maxi de la barre */

#define Bar_Height_Mid 35 /* hauteur de la barre du milieu*/

/* 
Mode d'affichage du compte-tour RPM
 rpm_constant : la hauteur des barres est toujours la meme
 rpm_linear_down_inc : les barres sont alignes sur le haut et la hauteur des barres augmente lineairement
 rpm_parabolic_inc : les barres sont alignes sur le haut et la hauteur des barres augmente paraboliquement 
 */
enum rpm_display_mode { rpm_constant = 0, rpm_linear_down_inc, rpm_parabolic_down_inc};
const enum rpm_display_mode my_rpm_display_type = rpm_parabolic_down_inc;

/*
Fonctionnement de l'afficheur
 rpm_func_linear : fonctionnement linéaire de 0 à 100%
 rpm_func_linear_down_truncated : fonctionnement linéaire de Npc_Min à 100%
  ce fonctionnement permet une plus grande precision dans les tours élevés
  et évite l'affichage lorsque le moteur est au ralenti
 */
enum rpm_function_mode { rpm_func_linear = 0, rpm_func_linear_down_truncated};
const enum rpm_function_mode my_rpm_function_type = rpm_func_linear_down_truncated;

/* Exemples de quelques régimes max de moteurs de kart
 Rotax Max Racing 13500
 Rotax Max J125   12200 
 Iame Leopard X30      .....
 */

double Npc; /* Pourcentage par rapport au max de l'afficheur */

static GdkPixmap *pixmap = NULL;

static gboolean realisation( GtkWidget *aire_de_dessin, GdkEventConfigure *event )
{
  if ( Npc < 0 ) {
    Npc = 0;
  }
  if (Npc > 100) {
    Npc = 100;
  }

  if (my_rpm_function_type == rpm_func_linear_down_truncated) {
    Npc = (Npc-Npc_Min) * 100 / (Npc_Max-Npc_Min); /* permet de ne pas afficher RPM < 20% */
  }

  pixmap = gdk_pixmap_new( aire_de_dessin->window, 
			   aire_de_dessin->allocation.width, aire_de_dessin->allocation.height, -1 );

  /* Fond blanc */
  gdk_draw_rectangle( pixmap, aire_de_dessin->style->white_gc, TRUE, 0, 0,
		      aire_de_dessin->allocation.width, aire_de_dessin->allocation.height );

  /* Tailles de reference */
  /*
  gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, TRUE,
		      Bar_X_Space + (N_Bar+1) * (Bar_Width + Bar_X_Space) , Vertical_Offset,
		      Bar_Width, Bar_Height_Min );
  gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, TRUE,
		      Bar_X_Space + (N_Bar+2) * (Bar_Width + Bar_X_Space) , Vertical_Offset,
		      Bar_Width, Bar_Height_Max );
  */

  /* barres non eclairees */
  uint8_t i;
  for ( i=0 ; i < N_Bar ; i++ ) {
    if ( my_rpm_display_type == rpm_constant ) {
      gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, FALSE,
			  Horizontal_Offset + Bar_X_Space + i * (Bar_Width + Bar_X_Space) , Vertical_Offset,
			  Bar_Width, Bar_Height );
    }
    if ( my_rpm_display_type == rpm_linear_down_inc ) {
      gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, FALSE,
			  Horizontal_Offset + Bar_X_Space + i * (Bar_Width + Bar_X_Space) , Vertical_Offset,
			  Bar_Width, Bar_Height_Min + (Bar_Height_Max - Bar_Height_Min)/N_Bar*i );
    }
    if ( my_rpm_display_type == rpm_parabolic_down_inc ) {
      gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, FALSE,
			  Horizontal_Offset + Bar_X_Space + i * (Bar_Width + Bar_X_Space) , Vertical_Offset,
			  Bar_Width,
			  (((Bar_Height_Max-Bar_Height_Min)*(N_Bar/2-1)-(Bar_Height_Mid-Bar_Height_Min)*(N_Bar-1))
			   /(pow((N_Bar-1),2)*(N_Bar/2-1)-(pow(N_Bar/2-1,2)*(N_Bar-1))))*pow(i,2)
			  + (((Bar_Height_Max-Bar_Height_Min)*pow(N_Bar/2-1,2)-(Bar_Height_Mid-Bar_Height_Min)*pow(N_Bar-1,2))
			     /((N_Bar-1)*pow(N_Bar/2-1,2)-(N_Bar/2-1)*pow(N_Bar-1,2)))*i
			  + Bar_Height_Min );
      /*
      gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, FALSE,
			  Bar_X_Space + i * (Bar_Width + Bar_X_Space) , Vertical_Offset,
			  Bar_Width, param*pow(i,2) + ((Bar_Height_Max-Bar_Height_Min)/(N_Bar-1)-param*(N_Bar-1))*i + 20 );
      */
      /* 0.77777*pow(i,2) + 1.88888*i + 20 */
      /* 0.27777*i*i + 6.38888*i + 20 */
    }
  }

  uint8_t j;
  /* texte */
  if (my_rpm_function_type == rpm_func_linear) {
    if ( my_rpm_display_type == rpm_constant ) {
    }
    if ( my_rpm_display_type == rpm_linear_down_inc ) {
    }
    if ( my_rpm_display_type == rpm_parabolic_down_inc ) {
      for ( j=0 ; j < 5 ; j++ ) {
	printf("%d ",j*5); /* 0 5 10 15 20 */
      }
    }    
  }
  if (my_rpm_function_type == rpm_func_linear_down_truncated) {
    if ( my_rpm_display_type == rpm_constant ) {
    }
    if ( my_rpm_display_type == rpm_linear_down_inc ) {
    }
    if ( my_rpm_display_type == rpm_parabolic_down_inc ) {
      for ( j=0 ; j < 5 ; j++ ) {
	printf("%d ",j*4+4); /* 4 8 12 16 20 */
      }
    }    
  }


  /* barres eclairees */
  uint8_t N_On;
  N_On = roundp((Npc / 100)*N_Bar); /* TO TEST */

  for ( i=0 ; i < N_On ; i++ ) {
    if ( my_rpm_display_type == rpm_constant ) {
      gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, TRUE,
			  Horizontal_Offset + Bar_X_Space + i * (Bar_Width + Bar_X_Space) , Vertical_Offset,
			  Bar_Width, Bar_Height );
    }
    if ( my_rpm_display_type == rpm_linear_down_inc ) {
      gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, TRUE,
			  Horizontal_Offset + Bar_X_Space + i * (Bar_Width + Bar_X_Space) , Vertical_Offset,
			  Bar_Width, Bar_Height_Min + (Bar_Height_Max - Bar_Height_Min)/N_Bar*i );
    }
    if ( my_rpm_display_type == rpm_parabolic_down_inc ) {
      gdk_draw_rectangle( pixmap, aire_de_dessin->style->black_gc, TRUE,
			  Horizontal_Offset + Bar_X_Space + i * (Bar_Width + Bar_X_Space) , Vertical_Offset,
			  Bar_Width,
			  (((Bar_Height_Max-Bar_Height_Min)*(N_Bar/2-1)-(Bar_Height_Mid-Bar_Height_Min)*(N_Bar-1))
			   /(pow((N_Bar-1),2)*(N_Bar/2-1)-(pow(N_Bar/2-1,2)*(N_Bar-1))))*pow(i,2)
			  + (((Bar_Height_Max-Bar_Height_Min)*pow(N_Bar/2-1,2)-(Bar_Height_Mid-Bar_Height_Min)*pow(N_Bar-1,2))
			     /((N_Bar-1)*pow(N_Bar/2-1,2)-(N_Bar/2-1)*pow(N_Bar-1,2)))*i
			  + Bar_Height_Min );
    }
  }

  gtk_widget_queue_draw( aire_de_dessin );

  return TRUE;
}

static gboolean rafraichissement( GtkWidget *aire_de_dessin, GdkEventExpose *event )
{
  gdk_draw_drawable( aire_de_dessin->window, 
		     aire_de_dessin->style->fg_gc[GTK_WIDGET_STATE(aire_de_dessin)],
		     pixmap, event->area.x, event->area.y, event->area.x, event->area.y, -1, -1 );
  return FALSE;
}



int main(int argc, char **argv)
{
  /*
  scanf("%lf", &Npc);

  printf("%lf",Npc);
  */

  Npc = 30;


  GtkWidget *fenetre;
  GtkWidget *aire_de_dessin;

  gtk_init(&argc, &argv);


  fenetre = gtk_window_new(GTK_WINDOW_TOPLEVEL);
  gtk_window_set_title( GTK_WINDOW(fenetre), "RPM Display" );
  gtk_widget_set_size_request( fenetre, 500, 400 );
  g_signal_connect( G_OBJECT(fenetre), "destroy", G_CALLBACK(gtk_main_quit), NULL );


  aire_de_dessin = gtk_drawing_area_new();
  gtk_container_add( GTK_CONTAINER(fenetre), aire_de_dessin );
  g_signal_connect( G_OBJECT(aire_de_dessin), "realize", G_CALLBACK(realisation), NULL );
  g_signal_connect( G_OBJECT(aire_de_dessin), "expose_event", G_CALLBACK(rafraichissement), NULL );


  gtk_widget_show_all(fenetre);
  gtk_main();

  return 0;
}
