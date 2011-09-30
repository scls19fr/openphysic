/**************************************************************************
 *   Copyright (C) 2006 by Sebastien CELLES                                *
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

import java.awt.Graphics; 
//import java.awt.Rectangle; 
import java.awt.Color;

class CCharge extends CChargeCurrent {

    CCharge(){
	// Constructeur
    }

    public void draw(Graphics g) {
	drawCircle(g);

	double x = this.get_position().get_x();
	double y = this.get_position().get_y();
	double R = this.get_radius();

	g.setColor(Color.black);
	g.drawLine((int) (x - R/2),
		   (int) y,
		   (int) (x + R/2),
		   (int) y);
    }

    /*
    public Rectangle getRectangle(){
	Rectangle rect = new Rectangle();
	return rect;
    }
    */
}