/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 29/07/2004
 * Time: 20:18
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
	/// Description of Scale.	
	/// </summary>
	public class Scale_Linear
	{
		// From real to screen
		// Example
		// electrostatic_field = 10
		// Ereal = 1
		// Escreen = Ereal * scale.electrostatic_field
		
		public const float electrostatic_field = 200;
		
		public Physic.Electrostatic_field E1_real = new Physic.Electrostatic_field();
		public Physic.Electrostatic_field E1_screen = new Physic.Electrostatic_field();
		
		public Physic.Electrostatic_field E2_real = new Physic.Electrostatic_field();
		public Physic.Electrostatic_field E2_screen = new Physic.Electrostatic_field();
		
		public Scale_Linear()
		{
		}
		
		public float real_to_screen(float real1, float screen1, float real2, float screen2, float real)
		{
			float screen;
			if (real2 != real1)
			{
				screen = (screen2 - screen1)
			  / (real2 - real1)
			  * (real-real1)
			  + screen1;
			}			
			else
			{
				screen = real;
			}
			
			return screen;
		}
		
		public float screen_to_real(float screen1, float real1, float screen2, float real2, float screen)
		{
			float real;
			if (screen2 != screen1)
			{
				real = (real2 - real1)
			  / (screen2 - screen1)
			  * (screen-screen1)
			  + real1;
			}			
			else
			{
				real = screen;
			}
			
			return real;
			
		}
		
		public Physic.Electrostatic_field real_to_screen(Physic.Electrostatic_field E_real)
		{
			Physic.Electrostatic_field E_screen = new Physic.Electrostatic_field();
			
			E_screen.set_x (
				real_to_screen(
			    E1_real.get_x(),
				E1_screen.get_x(),
				E2_real.get_x(),
				E2_screen.get_x(),
				E_real.get_x())
			               );
			
			E_screen.set_y (
			    real_to_screen(
				E1_real.get_y(),
				E1_screen.get_y(),
				E2_real.get_y(),
				E2_screen.get_y(),
				E_real.get_y())
			               );

			E_screen.set_z (
			    real_to_screen(
				E1_real.get_z(),
				E1_screen.get_z(),
				E2_real.get_z(),
				E2_screen.get_z(),
				E_real.get_z())
			               );

			E_screen.apply_to.set_x (
				real_to_screen(
				E1_real.apply_to.get_x(),
				E1_screen.apply_to.get_x(),
				E2_real.apply_to.get_x(),
				E2_screen.apply_to.get_x(),
				E_real.apply_to.get_x())
			                        );
			
			E_screen.apply_to.set_y (
				real_to_screen(
				E1_real.apply_to.get_y(),
				E1_screen.apply_to.get_y(),
				E2_real.apply_to.get_y(),
				E2_screen.apply_to.get_y(),
				E_real.apply_to.get_y())
			                        );
			                         
			E_screen.apply_to.set_z (
				real_to_screen(
				E1_real.apply_to.get_z(),
				E1_screen.apply_to.get_z(),
				E2_real.apply_to.get_z(),
				E2_screen.apply_to.get_z(),
				E_real.apply_to.get_z())
			                        );

			return E_screen;		  
		}		
		
		public Physic.Electrostatic_field screen_to_real(Physic.Electrostatic_field E_screen)
		{
			Physic.Electrostatic_field E_real = new Physic.Electrostatic_field();
			
			E_real.set_x (
				screen_to_real(
				E1_screen.get_x(),
				E1_real.get_x(),
				E2_screen.get_x(),
				E_real.get_x(),
				E_screen.get_x())
			             );

			E_real.set_y (
				screen_to_real(
				E1_screen.get_y(),
				E1_real.get_y(),
				E2_screen.get_y(),
				E_real.get_y(),
				E_screen.get_y())
			             );

			E_real.set_z (
				screen_to_real(
				E1_screen.get_z(),
				E1_real.get_z(),
				E2_screen.get_z(),
				E_real.get_z(),
				E_screen.get_z())
			             );

			E_real.apply_to.set_x (
				screen_to_real(
				E1_screen.apply_to.get_x(),
				E1_real.apply_to.get_x(),
				E2_screen.apply_to.get_x(),
				E_real.apply_to.get_x(),
				E_screen.apply_to.get_x())
			                      );

			E_real.apply_to.set_y (
				screen_to_real(
				E1_screen.apply_to.get_y(),
				E1_real.apply_to.get_y(),
				E2_screen.apply_to.get_y(),
				E_real.apply_to.get_y(),
				E_screen.apply_to.get_y())
			                      );

			E_real.apply_to.set_z (
				screen_to_real(
				E1_screen.apply_to.get_z(),
				E1_real.apply_to.get_z(),
				E2_screen.apply_to.get_z(),
				E_real.apply_to.get_z(),
				E_screen.apply_to.get_z())
			                      );
			
			return E_real;
		}
		
		
	}
}
