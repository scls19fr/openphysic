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

/*
 * Signal
 */
public class CSignal
{
    private double m_a0;
    private double m_f1;
    private double m_a1;
    
    private int N = 11; // nb max d'harmoniques = N-1

    private double[] m_a = new double[N];  // amplitude des harmoniques
    private double[] m_ph = new double[N]; // phase des harmoniques
  
    
    CSignal()
    {
	/* Initialisation (Inutile en Java)
	double dvalue = 0;
	m_a0=dvalue;
	m_f1=dvalue;
	m_a1=dvalue;

	for (int i=2 ; i<N ; ++i)
	    {
		m_a[i] = dvalue;
		m_ph[i] = dvalue;
	    }
	*/

    }


    double get_a0()
    {
	return m_a0;
    }

    double get_f1()
    {
	return m_f1;
    }

    double get_a1()
    {
	return m_a1;
    }

    double get_amplitude(int n)
    {
	if (n>=2 && n<=N-1)
	    {
		return m_a[n];
	    }
	else
	    {
		throw new RuntimeException("get_amplitude_exception");
	    }
    }

    double get_phase(int n)
    {
	if (n>=2 && n<=N-1)
	    {
		return m_ph[n];
	    }
	else
	    {
		throw new RuntimeException("get_phase_exception");
	    }
    }


    void set_a0(double a0)
    {
	//if (a0>=0 && a0<=1.0)
	//  {
	m_a0=a0;
	//     }
	//  else
	//  {
	//throw "set_a0_exception";
	//    }
    }

    void set_f1(double f1)
    {
	if (f1>=20.0 && f1<=20000.0)
	    {
		m_f1 = f1;
	    }
	else
	    {
		throw new RuntimeException("set_f1_exception");
	    }
    }
    
    void set_a1(double a1)
    {
	if (a1>=0) //&& a1<=1.0)
	    {
		m_a1 = a1;
	    }
	else
	    {
		throw new RuntimeException("set_a1_exception");
	    }
    }
    
    void set_amplitude(int n, double amplitude)
    {
	if (n>=2 && n<=N-1 && amplitude>=0 && amplitude<=1.0)
	    {
		m_a[n] = amplitude;
	    }
	else
	    {
		System.out.println("set exc");
		throw new RuntimeException("set_amplitude_exception");
	    }
    }
    
    void set_phase(int n, double phase)
    {
	if (n>=2 && n<=N-1 && phase>=-180.0 & phase<=180.0)
	    {
		m_ph[n] = phase;
	    }
	else
	    {
		System.out.println("set exc");

		throw new RuntimeException("set_phase_exception");
	    }
    }


    double get_value(double time)
    {
	double pi = Math.PI; //4.0 * atan (1.0) ; // pi
	double value = m_a0;
	value += m_a1*Math.sin(2*pi*m_f1*time);		
	for (int i=2 ; i<=N-1 ; i++)
	    {
		value += m_a1*get_amplitude(i)*Math.sin( 2*pi*m_f1*i*time + get_phase(i)*pi/180.0 ); 
	    } 
	return value;
    }




    void Test_Signal()
    {
	System.out.println("Test_Signal");
	
	System.out.println("a0 = " + m_a0);
	System.out.println("f1 = " + m_f1);
	System.out.println("a1 = " + m_a1);
  
	for (int i=2 ; i<N ; ++i)
	    {
		System.out.println("a" + i + " = " + m_a[i]);
		System.out.println("ph" + i + " = " + m_ph[i]);
	    }
    }
    
    void Test_value()
    {

	double T1 = 1/m_f1;
	
	for (double time=-T1/2 ; time<T1/2 ; time+=T1/100)
	    {
		System.out.println(time + "\t" + get_value(time));
	    }
    }
    


}
