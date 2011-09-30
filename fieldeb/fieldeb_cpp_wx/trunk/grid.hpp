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

#ifndef GRID_HPP
#define GRID_HPP

#include "wx/wx.h"

#include <iostream>  // Debug with cout << "DEBUG: " << x << "\n"; (C++ syntax)
using namespace std;


/*
 * This class describes a grid.
 * This grid can be draw on the screen or not.
 * It defines, for example, the relative position of 2 points of measure.
 */
class Grid
{
public:
    Grid (void)
    {
        set_x_min(0);
        set_x_max(300);
        set_x_space(10);

        set_y_min(0);
        set_y_max(300);
        set_y_space(10);

        set_z_min(0);
        set_z_max(0);
        set_z_space(0);

        set_visible();
        //unset_visible();
        //set_vibible(true);
    }

    Grid(double const x_min, double const x_max, double const x_space,
         double const y_min, double const y_max, double const y_space,
         double const z_min, double const z_max, double const z_space,
         bool const visible )
    {
        set_x_min(x_min);
        set_x_max(x_max);
        set_x_space(x_space);

        set_y_min(y_min);
        set_y_max(y_max);
        set_y_space(y_space);

        set_z_min(z_min);
        set_z_max(z_max);
        set_z_space(z_space);

        set_visible(visible);
    }

    void Draw(wxWindowDC *dc);




    double get_x_min(void) const
    {
        return m_x_min;
    }

    void set_x_min(double const value)
    {
        m_x_min = value;
    }



    double get_x_max(void) const
    {
        return m_x_max;
    }

    void set_x_max(double const value)
    {
        m_x_max = value;
    }



    double get_x_space(void) const
    {
        return m_x_space;
    }

    void set_x_space(double const value)
    {
        m_x_space = value;
    }



    double get_y_min(void) const
    {
        return m_y_min;
    }

    void set_y_min(double const value)
    {
        m_y_min = value;
    }



    double get_y_max(void) const
    {
        return m_y_max;
    }

    void set_y_max(double const value)
    {
        m_y_max = value;
    }



    double get_y_space(void) const
    {
        return m_y_space;
    }

    void set_y_space(double const value)
    {
        m_y_space = value;
    }



    double get_z_min(void) const
    {
        return m_z_min;
    }

    void set_z_min(double const value)
    {
        m_z_min = value;
    }



    double get_z_max(void) const
    {
        return m_z_max;
    }

    void set_z_max(double const value)
    {
        m_z_max = value;
    }



    double get_z_space(void) const
    {
        return m_z_space;
    }

    void set_z_space(double const value)
    {
        m_z_space = value;
    }



    bool Is_visible(void) const
    {
        return m_visible;
    }

    bool get_visible(void) const
    {
        return m_visible;
    }

    void set_visible(bool const value)
    {
        m_visible = value;
    }

    void set_visible(void)
    {
        m_visible = true;
    }

    void unset_visible(void)
    {
        m_visible = false;
    }



protected:

private:
    double m_x_min;
    double m_x_max;
    double m_x_space;

    double m_y_min;
    double m_y_max;
    double m_y_space;

    double m_z_min;
    double m_z_max;
    double m_z_space;

    bool m_visible;

};

#endif // GRID_HPP
