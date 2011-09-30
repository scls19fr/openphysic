/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 15:38
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

namespace Math
{
	/// <summary>
	/// Description of Vector3d_applied.	
	/// </summary>
	public class Vector3d_applied : Vector3d
	{
		[XmlIgnore]
		public Math.Vector3d apply_to; // = new Math.Vector3d();
		
		public Vector3d_applied()
		{
			this.set_x(0);
			this.set_y(0);
			this.set_z(0);
			this.apply_to = new Math.Vector3d();
			this.apply_to.set_x(0);
			this.apply_to.set_y(0);
			this.apply_to.set_z(0);
		}
		
		public Vector3d_applied(Math.Vector3d vct)
		{
			this.set_x(vct.get_x());
			this.set_y(vct.get_y());
			this.set_z(vct.get_z());
			this.apply_to = new Math.Vector3d();
			this.apply_to.set_x(0);
			this.apply_to.set_y(0);
			this.apply_to.set_z(0);
		}
		
		public Vector3d_applied(Math.Vector3d vct, Math.Vector3d apply_to)
		{
			this.set_x(vct.get_x());
			this.set_y(vct.get_y());
			this.set_z(vct.get_z());
			this.apply_to.set_x(apply_to.get_x());
			this.apply_to.set_y(apply_to.get_y());
			this.apply_to.set_z(0);
		}
		
		public static Vector3d_applied operator + (Vector3d_applied v1,Vector3d_applied v2)
		{
			Vector3d_applied v = new Vector3d_applied();
			
			if ( (v1.apply_to.get_x() == v2.apply_to.get_x())
			    && (v1.apply_to.get_y() == v2.apply_to.get_y())
			    && (v1.apply_to.get_z() == v2.apply_to.get_z()) )
			{
				v.apply_to.set_x( v1.apply_to.get_x() );
				v.apply_to.set_y( v1.apply_to.get_y() );
				v.apply_to.set_z( v1.apply_to.get_z() );
				v.set_x( v1.get_x() + v2.get_x() );
				v.set_y( v1.get_y() + v2.get_y() );
				v.set_z( v1.get_z() + v2.get_z() );
				return v;
			}
			else
			{
				return null; // return null;
			}
		}
		
	}
}
