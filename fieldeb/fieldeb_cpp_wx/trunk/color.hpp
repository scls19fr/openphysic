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

#ifndef COLOR_HPP
#define COLOR_HPP

#include <wx/wx.h>

#include <iostream>  // Debug (C++ syntax) with cout << "DEBUG: " << x << "\n";
using namespace std;

/**
 * This is a scale for colors, black and white,...
 */
class Color : public wxColor
{
public:
    Color( )
    {
        set_color(0,0,0);
    }

    /*
    Color::Color(float N, float N_min, float N_max)
      {
        // Default is step color
        set_step(N,N_min,N_max);
      }
    */

    void set_color_linear (double N, double N_min, double N_max);  // color
    void set_color_step (double N, double N_min, double N_max);

    void set_bwg_linear (double N, double N_min, double N_max); // black white gray
    void set_bwg_step (double N, double N_min, double N_max);

    void set_bw_step (double N, double N_min, double N_max); // black OR white
    void set_bw (double N, double N_min, double N_max);

    /*
    int get_R()
    {
      return m_R;
    }

    int get_G()
    {
      return m_G;
    }

    int get_B()
    {
      return m_B;
    }
    */

protected:

private:
    void set_color(int R, int G, int B)
    {
        //m_color = wxColor(R,G,B);
        //wxColor(R,G,B);

        //this->m_R = R;
        //this->m_G = G;
        //this->m_B = B;

        this->Set(R,G,B);
    }

    // int m_R, m_G, m_B;

    //wxColor m_color;

};

#endif // COLOR_HPP
