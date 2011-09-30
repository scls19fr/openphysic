/*
OpenChrono
Copyright (C) 2007  Sebastien CELLES
 
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
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

#include "temperature.h"
//


// °C ou F ou ...
// par défaut les tempé sont stockées en Celsius
// le changement d'unité se fait au niveau de l'affichage

Temperature::Temperature(  )
{
  set(20.0);
}

Temperature::Temperature(const Temperature &temp)
{
  // a copy constructor
  m_T = temp.m_T;
}

Temperature & Temperature::operator=(const Temperature &temp)
{
 // assignment operator
 m_T = temp.m_T;
 return *this;
}

double Temperature::value(void) const
  {
    return m_T;
  }

double Temperature::valueCelsius(void) const
  {
    return m_T;
  }

/*
double Temperature::valueFahrenheit(void) const
{
    return m_T;
}
*/

void Temperature::set(const double temperatureCelsius)
  {
    m_T=temperatureCelsius;
  }

void Temperature::setCelsius(const double temperatureCelsius)
{
  m_T=temperatureCelsius;
}

/*
void Temperature::setFahrenheit(double const temperatureFahrenheit)
{
    m_T=temperatureCelsius;
}
*/

QString Temperature::getStr(void) const
  {
    return getStrCelsius();
  }

QString Temperature::getStrCelsius(void) const
  {
    QString str;
    //str.setNum(valueCelsius());
    str.sprintf("%g ",valueCelsius());
    str = (str+QChar(0xB0))+QChar(QLatin1Char('C')); // °C (2 caractère)
    //str += QChar(0x2103); // °C (1 caractère unicode)
    return str;
  }

/*
QString Temperature::getStrFahrenheit(void) const
{
    QString str;
    str.sprintf("%g ",valueFahrenheit());
    str += QChar(0x2109); // °F
    return str;
}
*/

QDomElement Temperature::to_node( QDomDocument &dom_doc )
{
  QDomElement dom_elt = dom_doc.createElement( QLatin1String("temperature") );

  QString strBuf;

  dom_elt.setAttribute( QLatin1String("valueDegreeC"), strBuf.setNum( m_T ) );

  return dom_elt;
}



