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

#ifndef DRAW_RECTANGLE_HPP
#define DRAW_RECTANGLE_HPP

#include <wx/wx.h>

#include <iostream>  // Debug (C++ syntax) with cout << "DEBUG: " << x << "\n";
using namespace std;

/**
 * A sort of rectangle (with color) that is usefull to reprensent electrical potential
 */
class Draw_Rectangle
{
public:
    Draw_Rectangle(double const x, double const y, double const width, double const height)
    {
        //cout << "DEBUG: " << "1" << "\n";
        set_x(x);
        set_y(y);

        set_width(width);
        set_height(height);

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

    double get_x(void) const
    {
        return m_x;
    }

    double get_y(void) const
    {
        return m_y;
    }


    wxColor get_color(void) const
    {
        return m_color;
    }

    void set_color(wxColor const value)
    {
        m_color = value;
    }


    double get_width(void) const
    {
        return m_width;
    }

    void set_width(double const value)
    {
        m_width = value;
    }

    double get_height(void) const
    {
        return m_height;
    }

    void set_height(double const value)
    {
        m_height = value;
    }


protected:

private:
    double m_x;
    double m_y;

    double m_width;
    double m_height;

    wxColor m_color;

};

#endif // DRAW_RECTANGLE_HPP
