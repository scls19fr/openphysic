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

#ifndef POSITION_HPP
#define POSITION_HPP

#include "vector3d.hpp"

//#include <iostream>  // Debug with cout << "DEBUG: " << x << "\n"; (C++ syntax)
//using namespace std;

/**
 * Position of a point
 */
class Position //: public Vector3d
{
public:
    Position (void)
    {
        //cout << "DEBUG: " << "Position1" << "\n";
        //Vector3d::Vector3d(0, 0, 0);
        m_vect = Vector3d(0,0,0);
    }

    Position (double const x, double const y, double const z)
    {
        //cout << "DEBUG: " << "Position2" << "\n";
        //Vector3d::Vector3d(x, y, z);
        m_vect = Vector3d(x,y,z);
    }

    Position (double const x, double const y)
    {
        //cout << "DEBUG: " << "Position3" << "\n";
        //Vector3d::Vector3d(x, y, 0);
        m_vect = Vector3d(x,y,0);
    }


    void set_x(double const x)
    {
        m_vect.set_x(x);
    }

    void set_y(double const y)
    {
        m_vect.set_y(y);
    }

    void set_z(float const z)
    {
        m_vect.set_z(z);
    }


    double get_x(void) const
    {
        return m_vect.get_x();
    }

    double get_y(void) const
    {
        return m_vect.get_y();
    }

    double get_z(void) const
    {
        return m_vect.get_z();
    }
    //
protected:
    //
private:
    //
    Vector3d m_vect;

};

#endif // POSITION_HPP
