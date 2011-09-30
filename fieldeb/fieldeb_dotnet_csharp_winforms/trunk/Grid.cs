/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 26/07/2004
 * Time: 23:37
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

namespace Physic
{
	/// <summary>
	/// Description of Grid.	
	/// </summary>
	public class Grid
	{		
		private Math.Vector3d m_space = new Math.Vector3d(20,20,20);			
		private Math.Vector3d m_min = new Math.Vector3d(0,0,0);
		private Math.Vector3d m_max = new Math.Vector3d(400,300,0);
		
		private float m_marker_len = 4;	
		private bool m_visible = true;
		private System.Drawing.Color m_color = System.Drawing.Color.Black;
		private float m_width = 1;

		
		public float get_marker_len()
		{
			return m_marker_len;
		}

		public void set_marker_len(float marker_len)
		{
			m_marker_len = marker_len;
		}
		

		public bool get_visible()
		{
			return true;
		}

		public void set_visible(bool visible)
		{
			m_visible = visible;
		}			

		public void set_visible()
		{
			m_visible = true;
		}			

		public void unset_visible()
		{
			m_visible = false;
		}
		
		
		public System.Drawing.Color get_color()
		{
			return m_color;
		}
		
		public void set_color(System.Drawing.Color color)
		{
			m_color = color;
		}

		

		public Math.Vector3d get_min()
		{
			return m_min;
		}
		
		public void set_min(Math.Vector3d min)
		{
			m_min = min;
		}
		

		
		public Math.Vector3d get_max()
		{
			return m_max;
		}
		
		public void set_max(Math.Vector3d max)
		{
			m_max = max;
		}
		
		public Math.Vector3d get_space()
		{
			return m_space;
		}
		
		public void set_space(Math.Vector3d space)
		{
			m_space = space;
		}		
		
		
		public Grid()
		{
			this.m_visible = true;
			this.m_color = System.Drawing.Color.Gray;
			this.m_space.set_x(20);
			this.m_space.set_y(20);
			this.m_color = System.Drawing.Color.Gray;
		}
		
		public System.Collections.ArrayList get_positions()
		{
			System.Collections.ArrayList lst_of_points_of_grid = new System.Collections.ArrayList();
						
			for (float y=m_min.get_y()+m_space.get_y()/2 ; y<=m_max.get_y() ; y=y+m_space.get_y())
			{
				for (float x=m_min.get_x()+m_space.get_x()/2 ; x<=m_max.get_x() ; x=x+m_space.get_x())
				{
					Physic.Position myPosition = new Physic.Position(x,y,0);
					lst_of_points_of_grid.Add(myPosition);
				}
			}
			
			return lst_of_points_of_grid;
		}
		
		public void Draw(System.Drawing.Graphics myGraphics)
		{
			if (m_visible)
			{		
				System.Drawing.Pen myPen = new System.Drawing.Pen(m_color,m_width);
							
				foreach (Physic.Position pos in this.get_positions())
				{
					myGraphics.DrawLine(myPen,pos.get_x(),pos.get_y()-m_marker_len/2,pos.get_x(),pos.get_y()+m_marker_len/2);
					myGraphics.DrawLine(myPen,pos.get_x()-m_marker_len/2,pos.get_y(),pos.get_x()+m_marker_len/2,pos.get_y());
				}
			}
		}
		
	}
}
