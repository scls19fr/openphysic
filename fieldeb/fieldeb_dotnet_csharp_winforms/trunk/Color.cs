/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 28/07/2004
 * Time: 13:51
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
	/// Description of Color.	
	/// </summary>
	public class Color
	{
		public Color()
		{
		}
		
		public System.Drawing.Color color (string mode, float N, float N_min, float N_max)
		{
			System.Drawing.Color default_color = System.Drawing.Color.Black;
			System.Drawing.Color myColor = default_color;
			
			switch(mode.ToLower())
			{
				case "linear":
					myColor = color_linear (N, N_min, N_max);
					break;
				case "step":
					myColor = color_step (N, N_min, N_max);
					break;
				default:
					myColor = default_color;
					break;
			}
			
			return myColor;
		}
		
		public System.Drawing.Color color_linear (float N, float N_min, float N_max)
		{
			System.Drawing.Color default_color = System.Drawing.Color.Black;
			//System.Drawing.Color color = default_color;
			
			float n;
			int n2;
			
			const int A = 255;
			int R = default_color.R;
			int G = default_color.G;
			int B = default_color.B;			
			
			if (N_max!=N_min && N_max>N_min)
			{
        		n = (N-N_min)/(N_max-N_min)*100;
			}
    		else
    		{
        		return default_color;
    		}
			
			if (n<0)
			{
				n = 0;	
			}
			if (n>100)
			{
				n = 100;
			}
		
			if (n>=0 && n<10)
			{
				n2 = (int) n*127/10;
				R = 255 - n2;
				G = 0;
				B = 255;
				//color = System.Drawing.Color.FromArgb(255,255-n2,0,255);  // violet
			}
			if (n>=10 && n<20)
			{
				n2 = (int) (n-10)*127/10;
				R = 127 - n2;
				G = 0;
				B = 255;
		        //color = System.Drawing.Color.FromArgb(255,127-n2,0,255);
			}
		    if (n>=20 && n<30)
		    {
		    	n2 = (int) (n-20)*127/10;
				R = 0;
				G = n2;
				B = 255;
		        //color = System.Drawing.Color.FromArgb(255,0,n2,255); // blue
		    }
		    if (n>=30 && n<40)
		    {
		    	n2 = (int) (n-30)*127/10;
				R = 0;
				G = 127+n2;
				B = 255;
		        //color = System.Drawing.Color.FromArgb(255,0,127+n2,255);
		    }
		    if (n>=40 && n<50)
		    {
		    	n2 = (int) (n-40)*127/10;
				R = 0;
				G = 255;
				B = 255-n2;
		        //color = System.Drawing.Color.FromArgb(255,0,255,255-n2); // cyan
		    }
		    if (n>=50 && n<60)
		    {
		    	n2 = (int) (n-50)*127/10;
				R = 0;
				G = 255;
				B = 127-n2;
		        //color = System.Drawing.Color.FromArgb(255,0,255,127-n2);
		    }
		    if (n>=60 && n<70)
		    {
		    	n2 = (int) (n-60)*255/10;
				R = n2;
				G = 255;
				B = 0;
				//color = System.Drawing.Color.FromArgb(255,n2,255,0); // green
		    }
		    if (n>=70 && n<80)
		    {
		    	n2 = (int) (n-70)*255/10;
				R = 255;
				G = 255-n2/2;
				B = 0;
		        //color = System.Drawing.Color.FromArgb(255,255,255-n2,0); // yellow
		    }
		    if (n>=80 && n<90)
		    {
		    	n2 = (int) (n-80)*127/10;
				R = 255;
				G = 127-n2;
				B = 0;
		        //color = System.Drawing.Color.FromArgb(255,255,127-n2,0); // orange
		    }
		    if (n>=90)
		    {
		    	n2 = (int) (n-90)*127/10;
				R = 255;
				G = 0;
				B = 0;
		        //color = System.Drawing.Color.FromArgb(255,255,0,0); // red
		    }
			
			//return color;
			return System.Drawing.Color.FromArgb(A,R,G,B);
		}
		
		public System.Drawing.Color color_step (float N, float N_min, float N_max)
		{
			System.Drawing.Color default_color = System.Drawing.Color.Black;
			System.Drawing.Color color = default_color;
			
			float n;
			
			if (N_max!=N_min && N_max>N_min)
			{
        		n = (N-N_min)/(N_max-N_min)*100;
			}
    		else
    		{
        		return default_color;
    		}
			
			const int A = 255;
			int R = 255;
			int G = 255;
			int B = 255;
			
			if (n<0)
			{
				n = 0;	
			}
			if (n>100)
			{
				n = 100;
			}
		
			if (n>=0 && n<10)
			{
				R = 255;
				G = 0;
				B = 255;
				//color = System.Drawing.Color.FromArgb(255,255,0,255);  // violet
			}
			if (n>=10 && n<20)
			{
				R = 127;
				G = 0;
				B = 255;
		        //color = System.Drawing.Color.FromArgb(255,127,0,255);
			}
		    if (n>=20 && n<30)
		    {
				R = 0;
				G = 0;
				B = 255;
		        //color = System.Drawing.Color.FromArgb(255,0,0,255); // blue
		    }
		    if (n>=30 && n<40)
		    {
				R = 0;
				G = 127;
				B = 255;
				//color = System.Drawing.Color.FromArgb(255,0,127,255);
		    }
		    if (n>=40 && n<50)
		    {
				R = 0;
				G = 255;
				B = 255;
		        //color = System.Drawing.Color.FromArgb(255,0,255,255); // cyan
		    }
		    if (n>=50 && n<60)
		    {
				R = 0;
				G = 255;
				B = 127;
				//color = System.Drawing.Color.FromArgb(255,0,255,127);
		    }
		    if (n>=60 && n<70)
		    {
				R = 0;
				G = 255;
				B = 0;
		        //color = System.Drawing.Color.FromArgb(255,0,255,0); // green
		    }
		    if (n>=70 && n<80)
		    {
				R = 255;
				G = 255;
				B = 0;
				//color = System.Drawing.Color.FromArgb(255,255,255,0); // yellow
		    }
		    if (n>=80 && n<90)
		    {
				R = 255;
				G = 127;
				B = 0;
		        //color = System.Drawing.Color.FromArgb(255,255,127,0); // orange
		    }
		    if (n>=90)
		    {
				R = 255;
				G = 0;
				B = 0;
		        //color = System.Drawing.Color.FromArgb(255,255,0,0); // red
		    }
			
			return System.Drawing.Color.FromArgb(A,R,G,B);
		}
	}
}
