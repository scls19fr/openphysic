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

#include "charge.hpp"
#include "charges.hpp"

#include <wx/wx.h>

#include "position.hpp"

#include <algorithm>
//#include <functional> // foncteur ?


void Charges::Draw(wxWindowDC *ptr_dc, int mode)
{
    // Debug
    cout << "Draw_Charges" << endl;

    for (list <Charge>::iterator i = m_charges.begin() ; i != m_charges.end() ; ++i)
    {
        i->Draw(ptr_dc, mode);

        // Debug
        cout << "x = " << (i->get_position()).get_x() << " "
        << "y = " << (i->get_position()).get_y() << " "
        << "z = " << (i->get_position()).get_z() << " "
        << "q = " << (i->get_charge())
        << endl;
    }
}

void Charges::add(Charge const& chg)
{
    m_charges.push_back(chg);
}

/* suggestion de Fabien Le Lez sur fr.comp.lang.c++ le 21/01/2005 */

template <class T> T square (T const& t) // Square
{
    return t*t;
}

double calculate_square_distance(Position const& p1, Position const& p2)
{
    return square(p1.get_x()-p2.get_x())
           + square(p1.get_y()-p2.get_y())
           + square(p1.get_z()-p2.get_z());
}


double calculate_distance(Position const & p1, Position const & p2)
{
    return sqrt(calculate_square_distance(p1, p2));
}


class compare_distance // This is a fonctor (foncteur)
{
public:
    compare_distance (Position const& p) : reference (p) {}
    bool operator() (Charge const& c1, Charge const& c2) const
    {
        return calculate_square_distance(c1.get_position(),reference)
               < calculate_square_distance(c2.get_position(),reference);
    }
private:
    Position reference;
};

list <Charge>::iterator Charges::get_nearest_charge(Position const& pos)
{
    return std::min_element(m_charges.begin(), m_charges.end(), compare_distance(pos));
}

void Charges::remove(Position const& pos)
{
    // remove the nearest element
    list <Charge>::iterator it_charge = get_nearest_charge(pos);
    if (it_charge != end())
    {
        m_charges.erase(it_charge);
    }
}


void Charges::set_movable(Position const& pos)
{
    list <Charge>::iterator it_charge = get_nearest_charge(pos);
    it_charge->set_movable();
}


/*
void Charges::unset_movable(Position const& pos)
{
  list <Charge>::iterator it_charge = get_nearest_charge(pos);
  it_charge->unset_movable();
}
*/

void Charges::unset_movable()
{ // unset all charges as movable
    for (list <Charge>::iterator i = m_charges.begin() ; i != m_charges.end() ; ++i)
    {
        i->unset_movable();
    }
}

void Charges::move(Position const& pos) // position TO
{
    for (list <Charge>::iterator it_charge = m_charges.begin() ; it_charge != m_charges.end() ; ++it_charge)
    {
        if ( it_charge->get_movable() )
        {
            cout << "chge is movable" << endl;

            it_charge->get_position().set_x(pos.get_x());
            it_charge->get_position().set_y(pos.get_y());
            it_charge->get_position().set_z(pos.get_z());
            break;
        }
        else
        {
            cout << "chge is NOT movable" << endl;
        }
    }
}


bool Charges::get_near_of_a_charge(Position const & p)
{
    for (list <Charge>::iterator it_charge = m_charges.begin() ; it_charge != m_charges.end() ; ++it_charge)
    {
        if ( calculate_square_distance(it_charge->get_position(),p)
                < square( it_charge->get_radius() ) )
        {
            return true;
        }
    }
    return false;
}
