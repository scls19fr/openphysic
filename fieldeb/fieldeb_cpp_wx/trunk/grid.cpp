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

#include "grid.hpp"


#include <iostream>  // Debug with cout << "print\n"; (C++ syntax)
using namespace std;


void Grid::Draw(wxWindowDC *dc)
{
    wxPen pen = wxPen("BLACK",2,wxSOLID); // "BLACK"='#000000'='RRGGBB'
    dc->SetPen(pen);
    //dc->DrawPoint( 200, 200 );

    if (Is_visible())
    {
        for (double y = get_y_min() + get_y_space()/2 ; y <= get_y_max() ; y = y + get_y_space())
        {
            for (double x = get_x_min() + get_x_space()/2 ; x <= get_x_max() ; x = x + get_x_space())
            {
                dc->DrawPoint( (int) x, (int) y );
            }
        }
    }
}
