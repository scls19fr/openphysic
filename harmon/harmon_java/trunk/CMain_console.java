
/**************************************************************************
 *   Copyright (C) 2005 by Sebastien CELLES                                *
 *   s.cls@laposte.net                                                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

/** Harmon
 * Simulateur d'harmoniques
 * @author Sebastien CELLES
 * @author http://s.cls.free.fr
 * @version 0.1
 */
class CMain_console {
    public static void main (String[] args)
    {
	//	try {
	//System.out.println("Harmon");

	//System.out.println("new CSignal");
	    CSignal sgn = new CSignal(); 


	    //System.out.println("Definition d'un signal");


	    // Signal sinusoidal pur
	    //sgn.set_f1(10000.0);
	    //sgn.set_a1(1.0);

	    /*
	    // Signal sinusoidal pur 5f
	    sgn.set_f1(5000.0);
	    sgn.set_a1(0.0);
	    sgn.set_a0(0.0);
	    sgn.set_amplitude(5,1.0);
	    */
	    
	    
	    /*
	    // Signal carre
	    sgn.set_f1(5000.0);
	    sgn.set_a0(0.0);
	    sgn.set_a1(1.0);
	    sgn.set_amplitude(3,1/3.0);
	    sgn.set_phase(3,0.0);
	    sgn.set_amplitude(5,1/5.0);
	    sgn.set_amplitude(7,1/7.0);
	    sgn.set_amplitude(9,1/9.0);
	    */

	    
	    // Signal triangle
	    /*
	    sgn.set_f1(5000.0);
	    sgn.set_a0(0.0);
	    sgn.set_a1(1.0);
	    sgn.set_amplitude(3,1/(3.0*3.0));
	    sgn.set_phase(3,180);
	    sgn.set_amplitude(5,1/(5.0*5.0));
	    sgn.set_phase(5,0);
	    sgn.set_amplitude(7,1/(7.0*7.0));
	    sgn.set_phase(7,180);
	    sgn.set_amplitude(9,1/(9.0*9.0));
	    sgn.set_phase(9,0);
	    */

	    // Triangle avec offset
	    sgn.set_f1(5000.0);
	    sgn.set_a0(-0.5);
	    sgn.set_a1(1.0);
	    sgn.set_amplitude(3,1/(3.0*3.0));
	    sgn.set_phase(3,180);
	    sgn.set_amplitude(5,1/(5.0*5.0));
	    sgn.set_phase(5,0);
	    sgn.set_amplitude(7,1/(7.0*7.0));
	    sgn.set_phase(7,180);
	    sgn.set_amplitude(9,1/(9.0*9.0));
	    sgn.set_phase(9,0);


	    // 
	    //System.out.println("Tests");

	    //sgn.Test_Signal();
	    sgn.Test_value();
	    
    }
}
