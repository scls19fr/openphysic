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


#include "draw_rectangle.hpp"

#include <iostream>  // Debug (C++ syntax) with cout << "DEBUG: " << x << "\n";
using namespace std;


void Draw_Rectangle::Draw(wxWindowDC *dc)
{
    //wxPen pen = wxPen("GREEN",1,wxSOLID);
    wxPen pen = wxPen(get_color(),1,wxSOLID);
    wxBrush brush = wxBrush(get_color(),wxSOLID);

    dc->SetPen(pen);
    dc->SetBrush(brush);

    dc->DrawRectangle(
        (int) ( get_x() - get_width()/2 ),
        (int) ( get_y() - get_height()/2 ),
        (int) ( get_width() ),
        (int) ( get_height() )
    );


}


