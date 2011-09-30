/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 14:40
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
	/// Description of Electrostatic_field.	
	/// </summary>
	public class Electrostatic_field : Math.Vector3d_applied
	{
		private Physic.Constant cst = new Physic.Constant();
		float n = 2;
		float Ke;
				
		public Electrostatic_field()
		{
			this.Ke=cst.Ke;

			this.set_x(0);
			this.set_y(0);
			this.set_z(0);
			this.apply_to.set_x(0);
			this.apply_to.set_y(0);
			this.apply_to.set_z(0);
		}
		
		public Electrostatic_field(Physic.Position pos)
		{
			this.Ke=cst.Ke;
			
			this.set_x(0);
			this.set_y(0);
			this.set_z(0);
			
			this.apply_to.set_x( pos.get_x() );
			this.apply_to.set_y( pos.get_y() );
			this.apply_to.set_z( pos.get_z() );
		}
		
		public Electrostatic_field(Charge chg,Physic.Position pos)
		{
			this.Ke=cst.Ke;
			
			// E stands for Electrostatic_field
			float d = chg.get_position().distance(pos);

			float X = (pos-chg.get_position()).get_x();
			float Y = (pos-chg.get_position()).get_y();
			float Z = (pos-chg.get_position()).get_z();

			
			this.set_x( Ke * chg.get_charge() / ((float) System.Math.Pow(d,n+1))* X );
			this.set_y( Ke * chg.get_charge() / ((float) System.Math.Pow(d,n+1))* Y );
			this.set_z( Ke * chg.get_charge() / ((float) System.Math.Pow(d,n+1))* Z );
			
			this.apply_to.set_x( pos.get_x() );
			this.apply_to.set_y( pos.get_y() );
			this.apply_to.set_z( pos.get_z() );
		}
		
		public static Electrostatic_field operator + (Electrostatic_field E1, Electrostatic_field E2)
		{
			Electrostatic_field E = new Electrostatic_field();
			
			if ( (E1.apply_to.get_x() == E2.apply_to.get_x())
			    && (E1.apply_to.get_y() == E2.apply_to.get_y())
			    && (E1.apply_to.get_z() == E2.apply_to.get_z()) )
			{
				E.apply_to.set_x( E1.apply_to.get_x() );
				E.apply_to.set_y( E1.apply_to.get_y() );
				E.apply_to.set_z( E1.apply_to.get_z() );
	
				E.set_x( E1.get_x() + E2.get_x() );
				E.set_y( E1.get_y() + E2.get_y() );
				E.set_z( E1.get_z() + E2.get_z() );
			
				return E;
			}
			else
			{
				return null; // should be null
			}
		}		
	}
}
