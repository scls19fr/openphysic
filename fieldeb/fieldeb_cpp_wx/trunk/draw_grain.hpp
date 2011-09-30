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

#ifndef DRAW_GRAIN_HPP
#define DRAW_GRAIN_HPP

#include <wx/wx.h>

//#include <iostream>  // Debug (C++ syntax) with cout << "DEBUG: " << x << "\n";
//using namespace std;

/**
 * A sort of grain that can represent elctrical field or magnetic field
 */
class Draw_Grain
{
public:
    Draw_Grain(void)
    {
        set_x(0);
        set_y(0);
        set_z(0);

        set_ux(0);
        set_uy(0);
        set_uz(0);

        set_len(10);

        set_color("BLACK");
    }

    Draw_Grain(double const x, double const y, double const z, double const ux, double const uy, double const uz)
    {
        set_x(x);
        set_y(y);
        set_z(z);

        set_ux(ux);
        set_uy(uy);
        set_uz(uz);

        set_len(10);

        set_color("BLACK");
    }

    Draw_Grain(double const x, double const y, double const ux, double const uy)
    {
        set_x(x);
        set_y(y);
        set_z(0);

        set_ux(ux);
        set_uy(uy);
        set_uz(0);

        set_len(10);

        set_color("BLACK");
    }

    void Draw(wxWindowDC *dc);

    void set_x(double const value)
    {
        m_x = value;
    }

    void set_y(double const value)
    {
        m_y = value;
    }

    void set_z(double const value)
    {
        m_z = value;
    }

    double get_x(void) const
    {
        return m_x;
    }

    double get_y(void) const
    {
        return m_y;
    }

    double get_z(void) const
    {
        return m_z;
    }




    void set_ux(double const value)
    {
        m_ux = value;
    }

    void set_uy(double const value)
    {
        m_uy = value;
    }

    void set_uz(double const value)
    {
        m_uz = value;
    }

    double get_ux(void) const
    {
        return m_ux;
    }

    double get_uy(void) const
    {
        return m_uy;
    }

    double get_uz(void) const
    {
        return m_uz;
    }


    double get_width(void) const
    {
        return m_width;
    }

    double get_len(void) const
    {
        return m_len;
    }

    void set_len(double const value)
    {
        m_len = value;
    }

    void set_width(double const value)
    {
        m_width = value;
    }



    wxColor get_color(void) const
    {
        return m_color;
    }

    void set_color(wxColor const value)
    {
        m_color = value;
    }


protected:

private:
    double m_x;
    double m_y;
    double m_z;

    double m_ux;
    double m_uy;
    double m_uz;

    double m_width;
    double m_len;

    wxColor m_color;

};

#endif // DRAW_GRAIN_HPP
