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

namespace Physic
{
	/// <summary>
	/// Description of Charge.	
	/// </summary>
	public class Charge
	{
		private Physic.Position m_position = new Physic.Position();				
		private float m_charge = 1000;
		private float m_radius = 6;
		private bool m_movable = false;
		
		//private int mode = 0; // E=0 B=1
		
		public void set_position(Physic.Position position)
		{
			m_position = position;
		}
		
		public Physic.Position get_position()
		{
			return m_position;
		}
		
		
		public void set_charge(float charge)
		{
			m_charge = charge;
		}
		
		public float get_charge()
		{
			return m_charge;
		}

		
		public void set_radius(float radius)
		{
			m_radius = radius;
		}
		
		public float get_radius()
		{
			return m_radius;
		}		

		
		public void set_movable(bool movable)
		{
			m_movable = movable;
		}
		
		public void set_movable()
		{
			m_movable = true;
		}

		public void unset_movable()
		{
			m_movable = false;
		}
		
		public bool get_movable()
		{
			return m_movable;
		}		
		
		public Charge()
		{
		}
		
		public Charge(float charge, Physic.Position position, float radius)
		{
			this.m_charge = charge;
			this.m_position = position;
			this.m_radius = radius;
		}
		
		public Charge(float charge, float x, float y)
		{
			this.m_charge = charge;
			this.m_position.set_x(x);
			this.m_position.set_y(y);
		}
/*
		public void Draw(System.Drawing.Graphics myGraphics)
		{
			Draw(myGraphics, 0); // mode=0 pour E ; mode=1 pour B
		}
		*/
		
		public void Draw(System.Drawing.Graphics myGraphics, int mode)
		{
			// mode=0 pour E ; mode=1 pour B
			
			// Red or blue
			System.Drawing.Color myColor = new System.Drawing.Color();
			
			// +/- txt
			//System.Drawing.Brush txtBrush = new System.Drawing.SolidBrush(System.Drawing.Color.White);
			//System.Drawing.Font myFont = new System.Drawing.Font("Times new Roman", 16, System.Drawing.FontStyle.Bold);
						
			if (m_charge<0) // Draw a red charge if charge is positive
				myColor = System.Drawing.Color.Red;
			if (m_charge>0) // Draw a blue charge if charge is negative
				myColor = System.Drawing.Color.Blue;
			if (m_charge==0) // Draw a black charge if charge is null
				myColor = System.Drawing.Color.Black;
			
			System.Drawing.Brush myBrush = new System.Drawing.SolidBrush(myColor);
			myGraphics.FillEllipse(myBrush,m_position.get_x()-m_radius,m_position.get_y()-m_radius,2*m_radius,2*m_radius);

			System.Drawing.Pen myPenTxt = new System.Drawing.Pen(System.Drawing.Color.White,1);
			
			myGraphics.DrawEllipse(myPenTxt,m_position.get_x()-m_radius,m_position.get_y()-m_radius,2*m_radius,2*m_radius);

			if (mode==0)
			{
				if (m_charge<0) // Draw a negative (red) charge with a -
				{
					//myGraphics.DrawString("-",myFont,txtBrush,position.x-radius*6/10,position.y-radius*14/10);
					myGraphics.DrawLine(myPenTxt,m_position.get_x()-m_radius/2,m_position.get_y(),m_position.get_x()+m_radius/2,m_position.get_y());
				}
				if (m_charge>0) // Draw a positive (blue) charge with a +
				{
					//myGraphics.DrawString("+",myFont,txtBrush,position.x-radius*9/10,position.y-radius*12/10);
					myGraphics.DrawLine(myPenTxt,m_position.get_x()-m_radius/2,m_position.get_y(),m_position.get_x()+m_radius/2,m_position.get_y());
					myGraphics.DrawLine(myPenTxt,m_position.get_x(),m_position.get_y()-m_radius/2,m_position.get_x(),m_position.get_y()+m_radius/2);
				}
			}
			else if (mode==1)
			{
				if (m_charge<0) // Draw a negative (red) current
				{
				}
				if (m_charge>0) // Draw a positive (red) current
				{
				}
			}


		}
	}
}
