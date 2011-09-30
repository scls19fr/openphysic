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
import java.awt.Rectangle; 
import java.awt.Color;

/*
 * Grille
 */
public class CGrid //implements IDrawable
{
    private double m_x_min = 0;
    private double m_x_max = 200;
    private double m_x_space = 50;

    private double m_y_min = 0;
    private double m_y_max = 200;
    private double m_y_space = 50;

    private double m_z_min = 0;
    private double m_z_max = 0;
    private double m_z_space = 100;

    private boolean m_visible;

    CGrid() {

    }

    CGrid(double x_min, double x_max, double x_space,
	  double y_min, double y_max, double y_space,
	  double z_min, double z_max, double z_space,
	  boolean visible )
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


    double get_x_min()
    {
	return m_x_min;
    }

    void set_x_min(double value)
    {
	m_x_min = value;
    }



    double get_x_max()
    {
	return m_x_max;
    }

    void set_x_max(double value)
    {
	m_x_max = value;
    }



    double get_x_space()
    {
	return m_x_space;
    }

    void set_x_space(double value)
    {
	m_x_space = value;
    }



    double get_y_min()
    {
	return m_y_min;
    }

    void set_y_min(double value)
    {
	m_y_min = value;
    }



    double get_y_max()
    {
	return m_y_max;
    }

    void set_y_max(double value)
    {
	m_y_max = value;
    }



    double get_y_space()
    {
	return m_y_space;
    }

    void set_y_space(double value)
    {
	m_y_space = value;
    }



    double get_z_min()
    {
	return m_z_min;
    }

    void set_z_min(double value)
    {
	m_z_min = value;
    }



    double get_z_max()
    {
	return m_z_max;
    }

    void set_z_max(double value)
    {
	m_z_max = value;
    }



    double get_z_space() 
    {
	return m_z_space;
    }

    void set_z_space(double value)
    {
	m_z_space = value;
    }



    boolean Is_visible()
    {
	return m_visible;
    }

    boolean get_visible()
    {
	return m_visible;
    }

    void set_visible(boolean value)
    {
	m_visible = value;
    }

    void set_visible()
    {
	m_visible = true;
    }

    void unset_visible()
    {
	m_visible = false;
    }



    public Rectangle getRectangle(){
	Rectangle rect = new Rectangle();
	return rect;
    } 

    public void draw(Graphics g) {

	double x = 100; // test
	double y = 100; // test

	if ( Is_visible() )
	    {
		g.setColor(Color.black);
		
		//	g.drawPoint(x, y); // TO FIX : drawPoint !!!
	    }
    }

}
