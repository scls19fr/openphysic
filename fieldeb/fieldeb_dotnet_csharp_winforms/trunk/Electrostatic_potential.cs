/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 14:56
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
using System.Xml;
using System.Xml.Serialization;

namespace Physic
{
	/// <summary>
	/// Description of Electrostatic_potential.	
	/// </summary>
	public class Electrostatic_potential
	{
		float n = 2;
		float Ke = 200;

		public float value = 0;
		
		[XmlIgnore]
		public Math.Vector3d apply_to = new Math.Vector3d();
		
		public Electrostatic_potential(Charge chg,Physic.Position pos)
		{
			float d = chg.get_position().distance(pos);
			
			this.value = Ke * chg.get_charge() / ((float) System.Math.Pow(d,n-1));
			
			this.apply_to.set_x( pos.get_x() );
			this.apply_to.set_y( pos.get_y() );
			this.apply_to.set_z( pos.get_z() );
		}
		
		public Electrostatic_potential()
		{
			this.value = 0;
			this.apply_to.set_x(0);
			this.apply_to.set_y(0);
			this.apply_to.set_z(0);
		}
		
		public Electrostatic_potential(Physic.Position pos)
		{
			this.value = 0;
			this.apply_to.set_x( pos.get_x() );
			this.apply_to.set_y( pos.get_y() );
			this.apply_to.set_z( pos.get_z() );
		}

		public static Physic.Electrostatic_potential operator + (Physic.Electrostatic_potential V1,Physic.Electrostatic_potential V2)
		{
			Physic.Electrostatic_potential V = new Physic.Electrostatic_potential();
			
			if ( (V1.apply_to.get_x() == V2.apply_to.get_x())
			    && (V1.apply_to.get_y() == V2.apply_to.get_y())
			    && (V1.apply_to.get_z() == V2.apply_to.get_z()) )
			{
				V.apply_to.set_x( V1.apply_to.get_x() );
				V.apply_to.set_y( V1.apply_to.get_y() );
				V.apply_to.set_z( V1.apply_to.get_z() );
				V.value = V1.value + V2.value;
				
				return V;
			}
			else
			{
				return null; // return null;
			}
		}

	}
}
