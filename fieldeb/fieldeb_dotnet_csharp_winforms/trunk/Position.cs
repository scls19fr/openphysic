/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 15:53
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
	/// Description of Position.	
	/// </summary>
	public class Position : Math.Vector3d
	{
		/*
		public float get_x()
		{
			return this.get_x();
		}
		public float get_y()
		{
			return this.get_y();
		}
		public float get_z()
		{
			return this.get_z();
		}
		*/


		public Position()
		{
		}

		public Position(float x, float y, float z)
		{
			this.set_x(x);
			this.set_y(y);
			this.set_z(z);
		}
		
/*		public static explicit operator Math.Vector3d(Position pos)
		{
			// for implicit cast
			// see also
			// for explicit cast
			
		}
*/		
		
		
	}
}
