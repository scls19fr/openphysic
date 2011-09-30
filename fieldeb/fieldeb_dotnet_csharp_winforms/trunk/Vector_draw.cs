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

namespace Math
{
	/// <summary>
	/// Description of Vector.	
	/// </summary>
	public class Vector_draw
	{
		public Math.Vector3d position_start = new Math.Vector3d(0,0,0);
		public Math.Vector3d position_end = new Math.Vector3d(0,0,0);
				
		public float arrow_len = 10; // len of the 2 little segments of the arrow
		public float arrow_angle = 20 * (float) System.Math.PI / 180; // angle between a little segment and a long segment (must be in rad)
		public float arrow_ratio = 10; // ratio between a long segment ant a little segment
		
		public System.Drawing.Color color = System.Drawing.Color.Black;
		
		public float width = 1;
		
		public bool is_variable_len = false;
		// false if len is only defined by arrow_len
        // true  if len is defined by arrow_ratio and len
        
		public Vector_draw()
		{
		}
		
		public float len
		{
			// return the length of the vector
			get{ return ( (float) System.Math.Sqrt((position_end.get_x()-position_start.get_x())*(position_end.get_x()-position_start.get_x()) + (position_end.get_y()-position_start.get_y())*(position_end.get_y()-position_start.get_y())) );}
		}
		
		
		public float angle()
		{
			// return the angle between x (horizontal up) and vector
        	// return value belongs to 0->360 degree or 0->2*pi rad
        	// use the cos to get a value between 0 and 180 deg
        	// trick with sign of delta y to get angle between 180 and 360 deg
        	// result is given in rad
        	// error code is -1
        	
			if ( (position_end.get_x() - position_start.get_x())*(position_end.get_x() - position_start.get_x()) + (position_end.get_y() - position_start.get_y())*(position_end.get_y() - position_start.get_y()) == 0 )
			{
            	// null vector
            	// should return undef (coded by -1)
            	return -1;
			}

			if (position_end.get_y()-position_start.get_y()>0)
        	{
            	return (float) (
				                System.Math.Acos((position_end.get_x()-position_start.get_x())
				                / System.Math.Sqrt((position_end.get_x()-position_start.get_x())*(position_end.get_x()-position_start.get_x()) + (position_end.get_y()-position_start.get_y())*(position_end.get_y()-position_start.get_y())))
            		 );
        	}
        	
			if (position_end.get_y()-position_start.get_y()<0)
        	{
            	return (float) (
					2 * System.Math.PI -
				    System.Math.Acos((position_end.get_x()-position_start.get_x())
					/ System.Math.Sqrt((position_end.get_x()-position_start.get_x())
					* (position_end.get_x()-position_start.get_x())
					+ (position_end.get_y()-position_start.get_y())
					* (position_end.get_y()-position_start.get_y())))
            		 		 	);
            	
        	}
        	
        	else //y_end-y_start==0
        	{
            	return 0;
        	}
			
		}
		
		
		public void Draw(System.Drawing.Graphics myGraphics)
		{
			System.Drawing.Pen myPen = new System.Drawing.Pen(color,width);
			
			if ( this.len !=0 ) // not null vector
			{
	            myGraphics.DrawLine(myPen
				                    ,position_start.get_x()
				                    ,position_start.get_y()
				                    ,position_end.get_x()
				                    ,position_end.get_y()
		            );

				float Len = 0;
				if (!is_variable_len) // Len is the len of the 2 shorts segments of an arrow
                	Len = this.arrow_len;
            	else
                	Len = this.len / this.arrow_ratio;
				
			float epsilonX;
            float epsilonY;
				
            epsilonX = Len
            	* (float) System.Math.Cos(this.arrow_angle
            	         + this.angle() );
				
			epsilonY = Len
				* (float) System.Math.Sin(this.arrow_angle
				         + this.angle() );
            
            myGraphics.DrawLine(myPen
				                    ,position_end.get_x()
				                    ,position_end.get_y()
				                    ,position_end.get_x()-epsilonX
				                    ,position_end.get_y()-epsilonY
	            );

            epsilonX = Len
            	* (float) System.Math.Cos(this.arrow_angle
            	         - this.angle() );
				
            epsilonY = Len
            	* (float) System.Math.Sin(this.arrow_angle
            	         - this.angle() );

            myGraphics.DrawLine(myPen
				                    ,position_end.get_x()
				                    ,position_end.get_y()
				                    ,position_end.get_x()-epsilonX
				                    ,position_end.get_y()+epsilonY
	            );
								
			}
			else
			{
				// null vector
				// drawpoint ?
			}
			
			// TO DO
		}
	}
}
