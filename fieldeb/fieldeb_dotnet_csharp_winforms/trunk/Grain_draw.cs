/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 26/07/2004
 * Time: 23:38
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.

fieldE an electrostatic simulator
Copyright (C) 2004  Sebastien CELLES

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

 */

using System;
//using Math;

namespace Physic
{
	/// <summary>
	/// Description of Grain.	
	/// </summary>
	public class Grain_draw
	{
		public Physic.Position position = new Physic.Position();
		
		public Physic.Position direction = new Physic.Position();
		
		public float len = 20;
		
		public float width = 1;
		
		public System.Drawing.Color color = System.Drawing.Color.Black;
		
		
		public Physic.Position get_position()
		{
			return position;
		}

		public Physic.Position get_direction()
		{
			return direction;
		}

		
		public Grain_draw()
		{
		}
		
		public void Draw(System.Drawing.Graphics myGraphics)
		{
			System.Drawing.Pen myPen = new System.Drawing.Pen(color,width);
			
			if (direction.get_x()*direction.get_x()
			    + direction.get_y()*direction.get_y()
			 != 0) // Not null vector
			{            	
            	myGraphics.DrawLine(myPen
					, position.get_x()-len/2*direction.get_x()
						/((float) System.Math.Sqrt(
						direction.get_x()*direction.get_x()+direction.get_y()*direction.get_y()))
					, position.get_y()-len/2*direction.get_y()
						/((float) System.Math.Sqrt(
						direction.get_x()*direction.get_x()+direction.get_y()*direction.get_y()))
					, position.get_x()+len/2*direction.get_x()
            	      	/((float) System.Math.Sqrt(
						direction.get_x()*direction.get_x()+direction.get_y()*direction.get_y()))
					, position.get_y()+len/2*direction.get_y()
						/((float) System.Math.Sqrt(
						direction.get_x()*direction.get_x()+direction.get_y()*direction.get_y())));
			}
        	else
        	{
            	// dc.DrawPoint(self.x,self.y)
        	}			
		}
	}
}
