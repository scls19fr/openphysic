/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 14:40
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.

fieldEB an electrostatic/magnetostatic simulator
Copyright (C) 2005  Sebastien CELLES

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
	/// Description of Electrostatic_field.	
	/// </summary>
	public class Magnetostatic_field : Math.Vector3d_applied
	{
		private Physic.Constant cst = new Physic.Constant();
		
		private float n = 2;
		private float Km;
				
		public Magnetostatic_field()
		{
			this.Km=cst.Km;

			this.set_x(0);
			this.set_y(0);
			this.set_z(0);
			this.apply_to.set_x(0);
			this.apply_to.set_y(0);
			this.apply_to.set_z(0);
		}
		
		public Magnetostatic_field(Physic.Position pos)
		{
			this.Km=cst.Km;
			
			this.set_x(0);
			this.set_y(0);
			this.set_z(0);
			
			this.apply_to.set_x( pos.get_x() );
			this.apply_to.set_y( pos.get_y() );
			this.apply_to.set_z( pos.get_z() );
		}
		
		public Magnetostatic_field(Charge chg,Physic.Position pos)
		{
			this.Km=cst.Km;
			
			// E stands for Electrostatic_field
			float d = chg.get_position().distance(pos);
			
			float X = (pos-chg.get_position()).get_x();
			float Y = (pos-chg.get_position()).get_y();
			float Z = (pos-chg.get_position()).get_z();
				
			this.set_x( - Km * chg.get_charge() / ((float) System.Math.Pow(d,n+1))* Y );
			this.set_y( Km * chg.get_charge() / ((float) System.Math.Pow(d,n+1))* X );
			this.set_z(0);
			//this.set_z( Km * chg.get_charge() / ((float) System.Math.Pow(d,n+1))* Z );
			
			this.apply_to.set_x( pos.get_x() );
			this.apply_to.set_y( pos.get_y() );
			this.apply_to.set_z( pos.get_z() );
		}
		
		public static Magnetostatic_field operator + (Magnetostatic_field B1, Magnetostatic_field B2)
		{
			Magnetostatic_field B = new Magnetostatic_field();
			
			if ( (B1.apply_to.get_x() == B2.apply_to.get_x())
			    && (B1.apply_to.get_y() == B2.apply_to.get_y())
			    && (B1.apply_to.get_z() == B2.apply_to.get_z()) )
			{
				B.apply_to.set_x( B1.apply_to.get_x() );
				B.apply_to.set_y( B1.apply_to.get_y() );
				B.apply_to.set_z( B1.apply_to.get_z() );
	
				B.set_x( B1.get_x() + B2.get_x() );
				B.set_y( B1.get_y() + B2.get_y() );
				B.set_z( B1.get_z() + B2.get_z() );
			
				return B;
			}
			else
			{
				return null; // should be null
			}
		}		
	}
}
