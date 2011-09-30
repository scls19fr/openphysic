/**************************************************************************
 *   Copyright (C) 2005 by Sebastien CELLES                                *
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


#include <iostream>
using namespace std;

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>

#include "main.h"
#include "raquette.h"
#include "balle.h"
#include "espace.h"
#include "partie.h"


char* strName = "Pong by S.Celles under GNU GPL";

Espace *espace;
Raquette *r_p1;
Raquette *r_p2;
Balle *balle;



SDL_Surface *screen;
SDL_Surface *temp_image;
SDL_Surface *background;
SDL_Surface *ball;
SDL_Surface *raq_p1;
SDL_Surface *raq_p2;

SDL_Event event;
SDL_Rect rect;
SDL_Rect rect_ball;
SDL_Rect rect_p1;
SDL_Rect rect_p2;



void initialiser_sdl(Espace *espace)
{
  SDL_EnableUNICODE(1);
  //SDL_ShowCursor(SDL_DISABLE);



  // répétition des touches
  //SDL_EnableKeyRepeat(SDL_DEFAULT_REPEAT_DELAY, SDL_DEFAULT_REPEAT_INTERVAL); 
  SDL_EnableKeyRepeat(5, 5); // delay, repeat_intervall

  //Uint32 color = SDL_MapRGB(screen->format, 10, 10, 10); // RGB

  int flags = SDL_DOUBLEBUF | SDL_SWSURFACE;


  /* Cleanup at exit */
  atexit(SDL_Quit);

  SDL_Init(SDL_INIT_VIDEO);

  screen = SDL_SetVideoMode((int) espace->get_x(), (int) espace->get_y(), 0, flags);
  if(!screen)
    {
      cerr << "Failed to open screen !" << endl;
      exit(-1);
    }
  
  SDL_WM_SetCaption(strName, strName);
  if(flags & SDL_FULLSCREEN) SDL_ShowCursor(0);


  
  temp_image = IMG_Load("background.png");
  if(!temp_image)
    {
      cerr << "Could not load background !" << endl;
      exit(-1);
    }
  background = SDL_DisplayFormat(temp_image);
  SDL_FreeSurface(temp_image);



  temp_image = IMG_Load("ball.png");
  if(!temp_image)
    {
      cerr << "Could not load ball !" << endl;
      exit(-1);
    }
  ball = SDL_DisplayFormat(temp_image);
  SDL_FreeSurface(temp_image);


  temp_image = IMG_Load("raquette_p1.png");
  if(!temp_image)
    {
      cerr << "Could not load raquette_p1 !" << endl;
      exit(-1);
    }
  raq_p1 = SDL_DisplayFormat(temp_image);
  SDL_FreeSurface(temp_image);


  temp_image = IMG_Load("raquette_p2.png");
  if(!temp_image)
    {
      cerr << "Could not load raquette_p2 !" << endl;
      exit(-1);
    }
  raq_p2 = SDL_DisplayFormat(temp_image);
  SDL_FreeSurface(temp_image);
}




void afficher(void)
{
	  // draw the background
	  rect.x = 0;
	  rect.y = 0;
	  SDL_BlitSurface(background, NULL, screen, &rect);
	  //SDL_SetGamma(l_gamma, l_gamma, l_gamma);


	  rect_ball.x = (int) (balle->get_x() - balle->get_radius());
	  rect_ball.y = (int) (balle->get_y() - balle->get_radius());
	  SDL_BlitSurface(ball, NULL, screen, &rect_ball);
	  //SDL_UpdateRect(screen, 0, 0, ball-> 


	  rect_p1.x = (int) (r_p1->get_x() - r_p1->get_xsize()/2.0);
	  rect_p1.y = (int) (r_p1->get_y() - r_p1->get_ysize()/2.0);
	  SDL_BlitSurface(raq_p1, NULL, screen, &rect_p1);


	  rect_p2.x = (int) (r_p2->get_x() - r_p2->get_xsize()/2.0);
	  rect_p2.y = (int) (r_p2->get_y() - r_p2->get_ysize()/2.0);
	  SDL_BlitSurface(raq_p2, NULL, screen, &rect_p2);


	  SDL_Flip(screen);
}



int main(int argc, char *argv[])
{
  //  char* strName = "Pong by S.Celles under GNU GPL";
  cout << strName << endl;

  espace = new Espace();
  //Espace *espace = new Espace();
  //cout << espace->get_x() << "\t" << espace->get_y() << endl;

  r_p1 = new Raquette(espace,1);
  //cout << r_p1->get_x() << "\t" << r_p1->get_y() << endl;

  r_p2 = new Raquette(espace,2);
  //cout << r_p2->get_x() << "\t" << r_p2->get_y() << endl;

  balle = new Balle(espace);
  //cout << balle->get_x() << "\t" << balle->get_y() << endl;



  Partie *partie = new Partie();

  if (argc-1>0)
    {
      // argument 0 = nom de l'exe
      // argument 1
      argv++;
      //cout << *argv << endl;
      if (strcmp(*argv,"nolose")==0)
	{
	  cout << "nolose is active" << endl;
	  partie->set_jamais_perdre();
	}
    }
  else
    {
      partie->unset_jamais_perdre();
    }



  initialiser_sdl(espace);


  while( partie->partie_en_cours() )
    {
      Uint32 time_now = 0;
      Uint32 time_before = SDL_GetTicks();
      double delta_t = time_now - time_before;
      while(partie->point_en_cours())
	{
	  //cout << winner << endl;

	  SDL_Delay(15);
	  //double delta_t = 15; // en ms TO_FIX doit être calculé avec get_time() !
	  time_now = SDL_GetTicks();
	  delta_t = time_now - time_before;
	  time_before = time_now;
	  //cout << "delta_t=" << delta_t << endl;



	  //r_p1->move_up(espace, delta_t);
	  //r_p2->move_down(espace, delta_t);

	  // Intercepte les évènements
	  if(SDL_PollEvent(&event) > 0)
	    {
	      if (event.key.keysym.sym==SDLK_ESCAPE)
		{
		  exit(0);
		  break;
		}

	      switch(event.type)
		{
		case SDL_QUIT:
		  exit(0);
		  break;
		  //case SDL_KEYDOWN:
		default:

		  if (event.key.keysym.sym==SDLK_w)
		    {
		      //cout << "La touche " << SDL_GetKeyName(event.key.keysym.sym) << " a été pressée" << endl;; 
		      r_p1->move_down(espace, delta_t);
		    }
		  if (event.key.keysym.sym==SDLK_q)
		    {
		      //cout << "La touche " << SDL_GetKeyName(event.key.keysym.sym) << " a été pressée" << endl;; 
		      r_p1->move_up(espace, delta_t);
		    }
		  if (event.key.keysym.sym==SDLK_n)
		    {
		      //cout << "La touche " << SDL_GetKeyName(event.key.keysym.sym) << " a été pressée" << endl;; 
		      r_p2->move_down(espace, delta_t);
		    }
		  if (event.key.keysym.sym==SDLK_j)
		    {
		      //cout << "La touche " << SDL_GetKeyName(event.key.keysym.sym) << " a été pressée" << endl;; 
		      r_p2->move_up(espace, delta_t);
		    }
		}
	    }


	  afficher();
      
	  balle->move(espace, r_p1, r_p2, delta_t, partie);
	}


      partie->nouveau_point_a_jouer();
      r_p1->placer(espace,1);
      r_p2->placer(espace,2);
      balle->lancer(espace);

      afficher();

      SDL_Delay(1000);

    }

  SDL_FreeSurface(background);
  SDL_FreeSurface(ball);


  SDL_Quit();
  

  partie->afficher_score();


  delete r_p1; r_p1 = NULL;
  delete r_p2; r_p2 = NULL;
  delete balle; balle = NULL;
  delete espace; espace = NULL;
  delete partie; partie = NULL;

  return EXIT_SUCCESS;

}
