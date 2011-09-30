/**************************************************************************
 *   Copyright (C) 2004 by Sebastien CELLES                                *
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


#include "color.hpp"


void Color::set_color_linear (double N, double N_min, double N_max)
{
    //  wxColor default_color = "BLACK";
    // wxColor color = default_color;

    double n;
    int n2;

    int R;
    int G;
    int B;
    R = 0;
    G = 0;
    B = 0;

    if (N_max!=N_min && N_max>N_min)
    {
        n = (N-N_min)/(N_max-N_min)*100;

        if (n<0)
        {
            n = 0;
        }
        if (n>100)
        {
            n = 100;
        }

        n = n-5; // shifting to fit with step

        if (n<10)
        {
            n2 = (int) n*127/10;
            if (n<0) // due to trick for shifting
            {
                n2 = 0;
            }
            //color = System.Drawing.Color.FromArgb(255,255-n2,0,255);  // violet
            R = 255-n2;
            G = 0;
            B = 255;
        }
        if (n>=10 && n<20)
        {
            n2 = (int) (n-10)*127/10;
            //color = System.Drawing.Color.FromArgb(255,127-n2,0,255);
            R = 127-n2;
            G = 0;
            B = 255;
        }
        if (n>=20 && n<30)
        {
            n2 = (int) (n-20)*127/10;
            //color = System.Drawing.Color.FromArgb(255,0,n2,255); // blue
            R = 0;
            G = n2;
            B = 255;
        }
        if (n>=30 && n<40)
        {
            n2 = (int) (n-30)*127/10;
            //color = System.Drawing.Color.FromArgb(255,0,127+n2,255);
            R = 0;
            G = 127+n2;
            B = 255;
        }
        if (n>=40 && n<50)
        {
            n2 = (int) (n-40)*127/10;
            //color = System.Drawing.Color.FromArgb(255,0,255,255-n2); // cyan
            R = 0;
            G = 255;
            B = 255-n2;
        }
        if (n>=50 && n<60)
        {
            n2 = (int) (n-50)*127/10;
            //color = System.Drawing.Color.FromArgb(255,0,255,127-n2);
            R = 0;
            G = 255;
            B = 127-n2;
        }
        if (n>=60 && n<70)
        {
            n2 = (int) (n-60)*255/10;
            //color = System.Drawing.Color.FromArgb(255,n2,255,0); // green
            R = n2;
            G = 255;
            B = 0;
        }
        if (n>=70 && n<80)
        {
            n2 = (int) (n-70)*255/10;
            //color = System.Drawing.Color.FromArgb(255,255,255-n2,0); // yellow
            R = 255;
            G = 255-n2/2;
            B = 0;
            //R = 0;
            //G = 0;
            //B = 0;
        }
        if (n>=80 && n<90)
        {
            n2 = (int) (n-80)*127/10;
            //color = System.Drawing.Color.FromArgb(255,255,127-n2,0); // orange
            R = 255;
            G = 127-n2;
            B = 0;
        }
        if (n>=90)
        {
            n2 = (int) (n-90)*127/10;
            //color = System.Drawing.Color.FromArgb(255,255,0,0); // red
            R = 255;
            G = 0;
            B = 0;
        }

    }
    else
    {
        //return default_color;
        R = 0;
        G = 0;
        B = 0;
    }

    set_color(R,G,B);
}



void Color::set_color_step (double N, double N_min, double N_max)
{
    //wxColor default_color = "BLACK";

    int R;
    int G;
    int B;

    R = 0;
    G = 0;
    B = 0;

    double n;

    if (N_max!=N_min && N_max>N_min)
    {
        n = (N-N_min)/(N_max-N_min)*100;

        if (n<0)
        {
            n = 0;
        }
        if (n>100)
        {
            n = 100;
        }

        if (n<10)
        {

            //color = System.Drawing.Color.FromArgb(255,255,0,255);  // violet
            R = 255;
            G = 0;
            B = 255;
        }
        if (n>=10 && n<20)
        {
            //color = System.Drawing.Color.FromArgb(255,127,0,255);
            R = 127;
            G = 0;
            B = 255;
        }
        if (n>=20 && n<30)
        {
            //color = System.Drawing.Color.FromArgb(255,0,0,255); // blue
            R = 0;
            G = 0;
            B = 255;
        }
        if (n>=30 && n<40)
        {
            //color = System.Drawing.Color.FromArgb(255,0,127,255);
            R = 0;
            G = 127;
            B = 255;
        }
        if (n>=40 && n<50)
        {
            //color = System.Drawing.Color.FromArgb(255,0,255,255); // cyan
            R = 0;
            G = 255;
            B = 255;
        }
        if (n>=50 && n<60)
        {
            //color = System.Drawing.Color.FromArgb(255,0,255,127);
            R = 0;
            G = 255;
            B = 127;
        }
        if (n>=60 && n<70)
        {
            //color = System.Drawing.Color.FromArgb(255,0,255,0); // green
            R = 0;
            G = 255;
            B = 0;
        }
        if (n>=70 && n<80)
        {
            //color = System.Drawing.Color.FromArgb(255,255,255,0); // yellow
            R = 255;
            G = 255;
            B = 0;
        }
        if (n>=80 && n<90)
        {
            //color = System.Drawing.Color.FromArgb(255,255,127,0); // orange
            R = 255;
            G = 127;
            B = 0;
        }
        if (n>=90)
        {
            //color = System.Drawing.Color.FromArgb(255,255,0,0); // red
            R = 255;
            G = 0;
            B = 0;
        }

    }

    else
    {
        //return  default_color;
        R = 0;
        G = 0;
        B = 0;
    }

    set_color(R,G,B);
}


void Color::set_bwg_linear (double N, double N_min, double N_max) // BWG = Black White Gray
{
    int R;
    int G;
    int B;

    R = 0;
    G = 0;
    B = 0;

    double n;

    if (N_max!=N_min && N_max>N_min)
    {
        n = (N-N_min)/(N_max-N_min)*100;

        if (n<0)
        {
            n = 0;
        }
        if (n>100)
        {
            n = 100;
        }

        n = 255 - n * 255 / 100; // n little = color near white ; n big = color near black

        R = (int) n;
        G = (int) n;
        B = (int) n;

    }
    else
    {
        R = 0;
        G = 0;
        B = 0;
    }

    set_color(R,G,B);
}


void Color::set_bwg_step (double N, double N_min, double N_max) // BWG = Black White Gray
{
    int R;
    int G;
    int B;

    int level_max = 9; // 10 levels (start with level=0)
    int level = 0;

    R = 0;
    G = 0;
    B = 0;

    float n;

    if (N_max!=N_min && N_max>N_min)
    {
        n = (N-N_min)/(N_max-N_min)*100;

        if (n<0)
        {
            n = 0;
        }
        if (n>100)
        {
            n = 100;
        }


        if (n<10)
        {
            level = 0;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=10 && n<20)
        {
            level = 1;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=20 && n<30)
        {
            level = 2;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=30 && n<40)
        {
            level = 3;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=40 && n<50)
        {
            level = 4;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=50 && n<60)
        {
            level = 5;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=60 && n<70)
        {
            level = 6;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=70 && n<80)
        {
            level = 7;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=80 && n<90)
        {
            level = 8;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }
        if (n>=90)
        {
            level = 9;
            R = 255 - level * 255 / level_max;
            G = R;
            B = R;
        }


    }
    else
    {
        R = 0;
        G = 0;
        B = 0;
    }

    set_color(R,G,B);
}


void Color::set_bw_step (double N, double N_min, double N_max)
{
    double N_lim = (N_max - N_min)/2;
    int R,G,B;

    if (N<N_lim)
    {
        R = 255;
        G = 255;
        B = 255;
    }
    else
    {
        R = 0;
        G = 0;
        B = 0;
    }

    set_color(R,G,B);
}

void Color::set_bw (double N, double N_min, double N_max)
{
    set_bw_step ( N, N_min, N_max);
}
