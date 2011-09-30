/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 04/08/2004
 * Time: 11:48
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

namespace fieldE
{
	/// <summary>
	/// Description of Rectangle.	
	/// </summary>
	public class Rectangle_draw
	{
		public Math.Vector3d position = new Math.Vector3d(0,0,0);
		
		public float width = 0;
		public float height = 0;
		
		public System.Drawing.Color color = System.Drawing.Color.White;
		
		
		public Math.Vector3d get_position()
		{
			return position;
		}
		
		public Rectangle_draw()
		{
		}
		
		public void Draw(System.Drawing.Graphics myGraphics)
		{
			System.Drawing.Brush myBrush = new System.Drawing.SolidBrush(this.color);
			
			myGraphics.FillRectangle(myBrush,
			                         this.position.get_x()-this.width/2,
			                         this.position.get_y()-this.height/2,
			  this.width,
			  this.height);
		}
	}
}
