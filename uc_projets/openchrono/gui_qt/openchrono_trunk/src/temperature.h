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

#ifndef TEMPERATURE_H
#define TEMPERATURE_H
//
#include <QObject>
#include <QString>
#include <QtXml>
//


class Temperature : public QObject
  {
    Q_OBJECT

  public:
    Temperature( ); // default constructor

    Temperature(const Temperature &temp); // a copy constructor

    Temperature &operator=(const Temperature &temp); // assignment operator


    double value(void) const; // in celcius
    void set(double const temperatureCelsius);

    /* ToDo Temperature alarm
        double max(void);
        void setMax(double const temperature);
        double min(void);
        void setMin(double const temperature);
    */

    double valueCelsius(void) const;
//    double valueFahrenheit(void);

    void setCelsius(double const temperatureCelsius);
//    void setFarenheit(double const temperatureFahrenheit);

    QString getStr(void) const;
    QString getStrCelsius(void) const;
//    QString getStrFahrenheit(void) const;

    QDomElement to_node( QDomDocument &dom_doc );

  private:
    double m_T;
//    double m_Tmax;
//    double m_Tmin;

//    bool alarm;
  };

/*
°C = (°F − 32) / 1,8
°C = 5/9 × (°F + 40) − 40
°F = °C × 1,8 + 32
°F = 9/5 × (°C + 40) − 40
*/

#endif

