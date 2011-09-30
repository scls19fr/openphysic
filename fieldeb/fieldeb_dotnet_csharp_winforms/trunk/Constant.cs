/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 14:21
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
	/// Description of Constant.	
	/// </summary>
	public class Constant
	{
		public const float mu_0 = 1;
		
		public const float epsilon_0 = 1;
		
		public const float c = 3*10^8;
		
		public float Ke;
		public float Km;
		
		public Constant()
		{
			Ke = 200;
/*			Ke =  1
				/ (4*((float) System.Math.PI ) * epsilon_0);
*/			
			Km = 200;
			//Km = mu_0 / (4* (float) System.Math.PI);
		}
	}
}
