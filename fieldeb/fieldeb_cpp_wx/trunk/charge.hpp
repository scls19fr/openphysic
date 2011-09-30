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

#ifndef CHARGE_HPP
#define CHARGE_HPP

#include "position.hpp"

#include "wx/wx.h"


//#include <iostream>  // Debug with cout << "DEBUG: " << x << "\n"; (C++ syntax)
//using namespace std;


/**
 * Describe an electical charge or an electrical current
 */
class Charge
{
public:
    Charge(void)
    {
    }

    Charge(double const charge, double const radius, double const x, double const y, double const z)
    {
        set_charge(charge);
        set_radius(radius);
        set_position(x, y, z);

        unset_movable();
    }

    Charge(double const charge, double const radius, double const x, double const y)
    {
        Charge(charge, radius, x, y, 0);
    }



    void Draw(wxWindowDC *dc, int mode);



    double get_charge(void)
    {
        return m_charge;
    }

    void set_charge(double const charge)
    {
        m_charge=charge;
    }


    double get_radius(void)
    {
        return m_radius;
    }

    void set_radius(double const radius)
    {
        m_radius=radius;
    }



    bool get_movable() const
    {
        return m_movable;
    }

    void set_movable(void)
    {
        m_movable = true;
    }

    void unset_movable(void)
    {
        m_movable = false;
    }

    void set_movable(bool const value)
    {
        m_movable = value;
    }



    void set_position(double const x, double const y, double const z)
    {
        m_position = Position(x, y, z);
    }

    Position get_position() const
    {
        return m_position;
    }

protected:

private:
    double m_charge;
    double m_radius;
    Position m_position;
    bool m_movable;
};

#endif // CHARGE_HPP
