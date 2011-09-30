#include "signal.hxx"

using namespace std;
#include <iostream>

#include <math.h>  // atan pour pi, cos, etc...

#include <fstream> // ofstream

namespace Error{
  struct error{
    const char* p;
    error(const char* q)
    {
      p = q;
      cerr << q << endl;
    }
  };
}


Signal::Signal(void)
{
  double dvalue = 0;
  this->m_a0=dvalue;
  this->m_f1=dvalue;
  this->m_a1=dvalue;

  for (int i=2 ; i<N ; ++i)
    {
      this->m_a[i]=dvalue;
      this->m_ph[i]=dvalue;
    }
}

//Signal::Signal(double a0)
//{
  //  Signal::Signal();
//}


Signal::~Signal(void)
{

}

double Signal::get_a0() const
{
  return m_a0;
}

double Signal::get_f1() const
{
  return m_f1;
}

double Signal::get_a1() const
{
  return m_a1;
}

double Signal::get_amplitude(int n) const
{
  if (n>=2 && n<=N-1)
    {
      return m_a[n];
    }
  else
    {
      throw Error::error("get_amplitude_exception");
    }
}

double Signal::get_phase(int n) const
{
  if (n>=2 && n<=N-1)
    {
      return m_ph[n];
    }
  else
    {
      throw Error::error("get_phase_exception");
    }
}


void Signal::set_a0(double const a0)
{
  //if (a0>=0 && a0<=1.0)
  //  {
      m_a0=a0;
      //     }
      //  else
      //  {
      //throw Error::error("set_a0_exception");
      //    }
}

void Signal::set_f1(double const f1)
{
  if (f1>=20.0 and f1<=20000.0)
    {
      m_f1=f1;
    }
  else
    {
      throw Error::error("set_f1_exception");
    }
}

void Signal::set_a1(double const a1)
{
  if (a1>=0) //&& a1<=1.0)
    {
      m_a1=a1;
    }
  else
    {
      throw Error::error("set_a1_exception");
    }
}

void Signal::set_amplitude(int const n, double const amplitude)
{
  if (n>=2 && n<=N-1 && amplitude>=0 && amplitude<=1.0)
    {
      m_a[n]=amplitude;
    }
  else
    {
      throw Error::error("set_amplitude_exception");
    }
}

void Signal::set_phase(int const n, double const phase)
{
  if (n>=2 && n<=N-1 && phase>=-180.0 & phase<=180.0)
    {
      m_ph[n]=phase;
    }
  else
    {
      throw Error::error("set_phase_exception");
    }
}


double Signal::get_value(double const time) // TO FIX !!!
{
  double pi = 4.0 * atan (1.0) ; // pi
  double value = m_a0;
  value += m_a1*sin(2*pi*m_f1*time);		
  for (int i=2 ; i<=N-1 ; i++)
    {
      value += m_a1*get_amplitude(i)*sin( 2*pi*m_f1*i*time + get_phase(i)*pi/180.0 ); 
    } 
  return value;
}




void Signal::Test_Signal(void)
{
  cout << "Test_Signal" << endl;

  cout << "a0 = " << m_a0 << endl;
  cout << "f1 = " << m_f1 << endl;
  cout << "a1 = " << m_a1 << endl;
  
  for (int i=2 ; i<N ; ++i)
    {
      cout << "a" << i << " = " << m_a[i] << endl;
      cout << "ph" << i << " = " << m_ph[i] << endl;
    }
}

void Signal::Test_value(void)
{
  // fichier de donnees
  ofstream of("test_value.dat");

  double const T1 = 1/m_f1;

  for (double time=-T1/2 ; time<T1/2 ; time+=T1/100)
    {
      cout << time << "\t" << get_value(time) << endl;
      of << time << "\t" << get_value(time) << endl;
    }
}
