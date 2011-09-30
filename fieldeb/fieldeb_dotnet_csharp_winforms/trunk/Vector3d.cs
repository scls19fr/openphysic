/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 11:43
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
	/// Description of Vector3d.	
	/// </summary>
	public class Vector3d
	{
		private float m_x;
		private float m_y;
		private float m_z;
		
		public void set_x(float x)
		{
			m_x = x;
		}
		public void set_y(float y)
		{
			m_y = y;
		}
		public void set_z(float z)
		{
			m_z = z;
		}

		public float get_x()
		{
			return m_x;
		}
		public float get_y()
		{
			return m_y;
		}
		public float get_z()
		{
			return m_z;
		}
		
		
		public Vector3d(float x, float y, float z)
		{
			m_x = x;
			m_y = y;
			m_z = z;
		}
		
		public Vector3d() // surcharge de mthode
		{
			m_x = 0;
			m_y = 0;
			m_z = 0;
		}
		
		public float norm // (Vector3d vct)
		{
			// norm = sqrt ( x^2 + y^2 + z^2 )
			
			get{return ((float)
				System.Math.Sqrt(m_x*m_x+m_y*m_y+m_z*m_z));}
			
		}
		
		public static Vector3d operator + (Vector3d vct1, Vector3d vct2)
		{
			Vector3d vct = new Vector3d(0,0,0);
			
			vct.m_x = vct1.get_x() + vct2.get_x();
			vct.m_y = vct1.get_y() + vct2.get_y();
			vct.m_z = vct1.get_z() + vct2.get_z();
			
			return vct;
		}

/*
 		public static bool operator ==(Vector3d vct1, Vector3d vct2)
		{
			return (vct1 - vct2).norm==0;
		}
		
		public static bool operator !=(Vector3d vct1, Vector3d vct2)
		{
			return (vct1 - vct2).norm!=0;
		}

				
		public bool equal(Vector3d vct2)
		{
			return (this - vct2).norm==0;
		}
*/
		
		public static Vector3d operator - (Vector3d vct1,Vector3d vct2)
		{
			Vector3d vct = new Vector3d(0,0,0);
			
			vct.m_x = vct1.m_x - vct2.m_x;
			vct.m_y = vct1.m_y - vct2.m_y;
			vct.m_z = vct1.m_z - vct2.m_z;
			
			return vct;
		}		
		
		public static Vector3d operator * (float N,Vector3d vct2)
		{
			Vector3d vct = new Vector3d(0,0,0);
			
			vct.m_x = N*vct2.get_x();
			vct.m_y = N*vct2.get_y();
			vct.m_z = N*vct2.get_z();
			
			return vct;
		}
		
		public float distance(Vector3d vct2)
		{
			float d=0;
			Vector3d vct = new Vector3d(0,0,0);
			
			vct = vct2 - this;
			
			d = vct.norm; // norm is a property
			
			return d;
		}
		
		public float distance(float x, float y, float z)
		{
			float d=0;
			Vector3d vct = new Vector3d(0,0,0);
			Vector3d vct2 = new Vector3d(x,y,z);
			
			vct = vct2 - this;
			
			d = vct.norm; // norm is a property
			
			return d;			
		}

		public float distance(float x, float y)
		{
			float d=0;
			Vector3d vct = new Vector3d(0,0,0);
			Vector3d vct2 = new Vector3d(x,y,0);
			
			vct = vct2 - this;
			
			d = vct.norm; // norm is a property
			
			return d;			
		}		
		
		public float dot_product(Vector3d vct2)
		{
			// v1->.v2-> = x1*x2 + y1*y2 + z1*z2
			// How to call :
			// Vector3d v1 = new Vector3d(1,0,0);
			// Vector3d v2 = new Vector3d(0,1,0);
			// v1.dot_product(v2) return float 0
			
			return this.get_x()*vct2.get_x()
				+ this.get_y()*vct2.get_y()
				+ this.get_z()*vct2.get_z();
		}
		
		public Vector3d cross_product(Vector3d vct2)
		{
			// How to call :
			// Vector3d v1 = new Vector3d(1,0,0);
			// Vector3d v2 = new Vector3d(0,1,0);
			// v1.cross_product(v2) return Vector3d (0 0 1)

			Vector3d vct = new Vector3d(0,0,0);
			
			// v1->^v2-> = v->
			
			// vx = y1 z2 - y2 z1
			vct.set_x( this.get_y() * vct2.get_z() - vct2.get_y() * this.get_z() );
			
			// vy = z1 x2 - x1 z2
			vct.set_y( this.get_z() * vct2.get_x() - this.get_x() * vct2.get_z() );
			
			// vz = x1 y2 - y1 x2
			vct.set_z( this.get_x() * vct2.get_y() - this.get_y() * vct2.get_x() );
			
			return vct;
		}
		
	}
}
