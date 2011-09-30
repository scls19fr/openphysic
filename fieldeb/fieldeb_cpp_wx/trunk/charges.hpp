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

#ifndef CHARGES_HPP
#define CHARGES_HPP

#include "charge.hpp"

#include <list>
#include <vector>

#include <math.h>

#include <wx/wx.h>

/**
 * List of charges
 */
class Charges
{
public:
    Charges(void)
    {
    }

    //typedef list <Charge>::const_iterator LI_chg;


    list <Charge>::const_iterator begin()
    {
        return m_charges.begin();
    }

    list <Charge>::const_iterator end()
    {
        return m_charges.end();
    }

    void add(Charge const & chg);

    bool get_near_of_a_charge(Position const & p);


    list <Charge>::iterator Charges::get_nearest_charge(Position const& pos);

    void remove(Position const & p);

    void set_movable(Position const& p);

    //void unset_movable(Position const& p);
    void unset_movable();

    void move(Position const& pos);

    void Draw(wxWindowDC *ptr_dc, int const mode);



protected:

private:
    list <Charge> m_charges;
    //vector <Charge> m_charges;

    bool distance_equal(const Charge & chge);



};

#endif // CHARGES_HPP
