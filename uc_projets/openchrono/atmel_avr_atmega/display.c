/***************************************************************************
 *   Copyright (C) 2006 by Sebastien CELLES                                *
 *   s.cls@laposte.net                                                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

static FILE lcdout = FDEV_SETUP_STREAM( (void *)lcd_putc, NULL,_FDEV_SETUP_WRITE );
//stdout = &lcdout;

enum display_mode { lcd_char_16_2 = 0, lcd_char_20_2, lcd_graph};
const enum display_mode my_display_type = lcd_char_20_2;

enum display_page { time_current_best_last_sgn_cmp = 0};
enum display_page my_display_page = time_current_best_last_sgn_cmp;

void init_hw_display(void) {
    // Port des bits de données du lcd
    PORTE=0x00; // PORTC
    DDRE=0xFF; //Port en sortie DDRC
    // Port des bits de controles du lcd
    PORTF=0x00;   // R/W=0 // PORTD
    DDRF=0xFF;//Port en sortie

    stdout = &lcdout; // Peter Fleury hack for printf

    lcd_init(LCD_DISP_ON_CURSOR_BLINK); //Initialisation curseur clignotant
    lcd_command(LCD_DISP_ON); //curseur éteint

    lcd_clrscr(); //efface l'écran
    //Active la gestion des accents français	éèêëàùçô
    lcd_ChargeAccentsFrancais(); // Charge 8 caractères accentués dans la CGRAM et active leur utilisation
}

inline void display_openchrono_center(void) {
 //lcd_EcrisAuCentre("12345678901234567890",0);
 //lcd_EcrisAuCentre("===OpenChrono===",0);
 //lcd_EcrisAuCentre("----S.CELLES----",1);
   //lcd_printf("OpenChrono");
   lcd_EcrisAuCentre("OpenChrono",0);
   lcd_EcrisAuCentre("S. CELLES",1);
   lcd_EcrisAuCentre("v 0.0.1",2);
   //_delay_ms(250);
}

inline void display_openchrono(void) {
   lcd_gotoxy(0,0); 	//Curseur  1ère colonne 1ère ligne
   lcd_puts("OpenChrono");
   lcd_gotoxy(0,1);
   lcd_puts("S. CELLES");

   //delay_ms(500); // delay (Fleury)
   _delay_ms(250);
   //lcd_clrscr();
}


inline void display_time_char_20_2(void)
{
    // clear screen
    //lcd_clrscr();

    // line 1

    print_time_mm_ss_xxx(&current_time); // ZONE 1

    printf(" ");

    print_time_mm_ss_xxx(&best_time); // ZONE 2


    printf("\n");
    // line 2

    print_time_mm_ss_xxx(&last_time); // ZONE 3

    printf(" ");

    // ZONE 4
    if( compare_time(&last_time,&before_last_time) == 0 )
    {
        printf("LST=");
    }
    if( compare_time(&last_time,&before_last_time) == 1 )
    {
        printf("LST-");
    }
    if( compare_time(&last_time,&before_last_time) == 2 )
    {
        printf("LST+");
    }

    printf(" ");

    if( compare_time(&last_time,&best_time) == 0 )
    {
        printf("BST=");
    }
    if( compare_time(&last_time,&best_time) == 1 )
    {
        printf("BST-");
    }
    if( compare_time(&last_time,&best_time) == 2 )
    {
        printf("BST+");
    }

}

inline void display_time_char_16_2(void)
{
    // clear screen
    //lcd_clrscr();

    // line 1

    print_time_m_ss_xxx(&current_time); // ZONE 1

    //printf(" ");

    print_time_m_ss_xxx(&best_time); // ZONE 2


    printf("\n");
    // line 2

    print_time_m_ss_xxx(&last_time); // ZONE 3

    //printf(" ");

    // ZONE 4
    if( compare_time(&last_time,&before_last_time) == 0 )
    {
        printf("LST=");
    }
    if( compare_time(&last_time,&before_last_time) == 1 )
    {
        printf("LST-");
    }
    if( compare_time(&last_time,&before_last_time) == 2 )
    {
        printf("LST+");
    }

    if( compare_time(&last_time,&best_time) == 0 )
    {
        printf("BST=");
    }
    if( compare_time(&last_time,&best_time) == 1 )
    {
        printf("BST-");
    }
    if( compare_time(&last_time,&best_time) == 2 )
    {
        printf("BST+");
    }

}

void print_temp_engine_char_line(void) {
   printf("T1:%3d T2:%3d",TEMP1,TEMP2);
   printf("  ");
   print_time_hh_mm(&((&current_engine)->time));
}

void display_end_of_race(void) {
   //lcd_clrscr();
   lcd_gotoxy(0,0);
   printf("# # # # # # # # # # ");
   lcd_gotoxy(0,1);
   printf(" # # # # # # # # # #");
   lcd_gotoxy(0,2);
   printf("# # # # # # # # # # ");
   lcd_gotoxy(0,3);
   printf(" # # # # # # # # # #");
}


void display_page_time(void) {
   //display_openchrono_center();

   if ( my_display_type == lcd_char_16_2 )
   {
     if ( my_display_page == time_current_best_last_sgn_cmp )
     {
       display_time_char_16_2();
     }
   }
   if ( my_display_type == lcd_char_20_2 )
   {
     if ( my_display_page == time_current_best_last_sgn_cmp )
     {
       display_time_char_20_2();
     }
   }

   printf("\n");
   //print_temp_engine_char_line();
   print_rpm_char_line();
   printf("\n");
   //lcd_gotoxy(0,3);
   print_temp_engine_char_line();
   //print_rpm_char_line();
}


struct page_typ
{
   char* name;

   struct page_typ * page_parent;
   struct page_typ * page_brother_next;
   struct page_typ * page_brother_previous;
   struct page_typ * page_child_first;

   void (*display) (); // pointeur de fonction sur fonction d'affichage

   void (*on_ok) ();     // ptr de fct sur evenement appui touche ok
   void (*on_cancel) (); // ptr de fct sur evenement appui touche cancel
   void (*on_left) ();   // ptr de fct sur evenement appui touche gauche
   void (*on_right) ();  // ptr de fct sur evenement appui touche droite
   void (*on_up) ();     // ptr de fct sur evenement appui touche haut
   void (*on_down) ();   // ptr de fct sur evenement appui touche bas

};

struct page_typ page_title;
struct page_typ page_time;
struct page_typ page_reset_time;
struct page_typ page_engine_menu;
struct page_typ page_engine_select;
struct page_typ page_engine_stroke;
struct page_typ page_engine_reset_time;
struct page_typ page_track_menu;
struct page_typ page_recall_menu;

struct page_typ * ptr_current_page;
struct page_typ * ptr_page_goto;

void display_page_reset_time(void) {
   printf("RESET TIME");
   printf("\n");
   printf("(OK/CANCEL?)");
   printf("\n");
}

void display_page_engine_menu(void) {
   printf("ENGINE MENU");
   printf("\n");
}

void display_page_engine_select(void) {
   printf("SELECT ENGINE");
   printf("\n");
   printf("1"); // TO FIX
   printf("\n");
   printf("(UP/DOWN?)");
   printf("\n");
}

void display_page_engine_stroke(void) {
   printf("ENGINE 1"); // TO FIX
   printf("\n");
   printf("2 (UP/DOWN?)"); // TO FIX
   printf("\n");
   printf("STROKES");
   printf("\n");
}

void display_page_engine_reset_time(void) {
   printf("ENGINE 1"); // TO FIX
   printf("\n");
   printf("RESET ENGINE TIME");
   printf("\n");
   printf("(OK/CANCEL?)");
   printf("\n");
}

void display_page_track_menu(void) {
   printf("TRACK MENU");
   printf("\n");
}

void display_page_recall_menu(void) {
   printf("RECALL MENU");
   printf("\n");
}

void navigate_on_ok(void) {
   //ptr_current_page = &page_engine_menu;
   ptr_page_goto = ptr_current_page->page_child_first;
}

void navigate_on_cancel(void) {
   ptr_page_goto = ptr_current_page->page_parent;
}

void navigate_on_left(void) {
   ptr_page_goto = ptr_current_page->page_brother_previous;
}

void navigate_on_right(void) {
   ptr_page_goto = ptr_current_page->page_brother_next;
}

void navigate_on_up(void) {
}

void navigate_on_down(void) {
}

void init_page(struct page_typ* page, char* pgname) {
   page->name = pgname;
   page->page_parent = NULL;
   page->page_brother_next = NULL;
   page->page_brother_previous = NULL;
   page->page_child_first = NULL;

   page->display = &display_page_time;

   page->on_ok = &navigate_on_ok;
   page->on_cancel = &navigate_on_cancel;
   page->on_left = &navigate_on_left;
   page->on_right = &navigate_on_right;
   page->on_up = &navigate_on_up;
   page->on_down = &navigate_on_down;
}

void init_all_the_pages(void)  {
   init_page(&page_title, "page_title");

   init_page(&page_time, "page_time");

   init_page(&page_reset_time, "page_reset_time");

   init_page(&page_engine_menu, "page_engine_menu");
       init_page(&page_engine_select, "page_engine_select");
       init_page(&page_engine_stroke, "page_engine_stroke");
       init_page(&page_engine_reset_time, "page_engine_reset_time");

   init_page(&page_track_menu, "page_track_menu");

   init_page(&page_recall_menu, "page_recall_menu");

   // parent init
   (&page_time)->page_parent = &page_time; //NULL;
   (&page_reset_time)->page_parent = &page_time; //NULL;
   (&page_engine_menu)->page_parent = &page_time; //NULL;
      (&page_engine_select)->page_parent = &page_engine_menu;
      (&page_engine_stroke)->page_parent = &page_engine_menu;
      (&page_engine_reset_time)->page_parent = &page_engine_menu;
   (&page_track_menu)->page_parent = &page_time; //NULL;
   (&page_recall_menu)->page_parent = &page_time; //NULL;


   // first child initialisation
   (&page_time)->page_child_first = NULL;
   (&page_reset_time)->page_child_first = NULL;
   (&page_engine_menu)->page_child_first = (&page_engine_select);
      (&page_engine_select)->page_child_first = NULL;
      (&page_engine_stroke)->page_child_first = NULL;
      (&page_engine_reset_time)->page_child_first = NULL;
   (&page_track_menu)->page_child_first = NULL;
   (&page_recall_menu)->page_child_first = NULL;

   // next brother init
   (&page_time)->page_brother_next = &page_reset_time;
   (&page_reset_time)->page_brother_next = &page_engine_menu;
   (&page_engine_menu)->page_brother_next = &page_track_menu;
      (&page_engine_select)->page_brother_next = &page_engine_stroke;
      (&page_engine_stroke)->page_brother_next = &page_engine_reset_time;
      (&page_engine_reset_time)->page_brother_next = &page_engine_select;
   (&page_track_menu)->page_brother_next = &page_recall_menu;
   (&page_recall_menu)->page_brother_next = &page_time;

   // previous brother init
   (&page_time)->page_brother_previous = &page_recall_menu;
   (&page_reset_time)->page_brother_previous = &page_time;
   (&page_engine_menu)->page_brother_previous = &page_reset_time;
      (&page_engine_select)->page_brother_previous = &page_engine_reset_time;
      (&page_engine_stroke)->page_brother_previous = &page_engine_select;
      (&page_engine_reset_time)->page_brother_previous = &page_engine_select;
   (&page_track_menu)->page_brother_previous = &page_engine_menu;
   (&page_recall_menu)->page_brother_previous = &page_track_menu;

   // display init
   (&page_title)->display = &display_openchrono_center;
   (&page_time)->display = &display_page_time;
   (&page_reset_time)->display = &display_page_reset_time;
   (&page_engine_menu)->display = &display_page_engine_menu;
   (&page_engine_select)->display = &display_page_engine_select;
   (&page_engine_stroke)->display = &display_page_engine_stroke;
   (&page_engine_reset_time)->display = &display_page_engine_reset_time;
   (&page_track_menu)->display = &display_page_track_menu;
   (&page_recall_menu)->display = &display_page_recall_menu;

   //init_key_function();

   // ask key init
   /*
   (&page_time)->waitkeypad = &;
   (&page_reset_time)->waitkeypad = &;
   (&page_engine_menu)->waitkeypad = &;
   (&page_engine_select)->waitkeypad = &;
   (&page_engine_stroke)->waitkeypad = &;
   (&page_engine_reset_time)->waitkeypad = &;
   (&page_track_menu)->waitkeypad = &;
   (&page_recall_menu)->waitkeypad = &;
   */


    //ptr_current_page = &page_time; //&page_engine_menu;
}





void display(void) {
   lcd_clrscr(); // efface ecran

	//display_page_time();
   //display_end_of_race();

   (ptr_current_page->display)();
   //update_key_pressed(); // TO DO !!!!!
}




