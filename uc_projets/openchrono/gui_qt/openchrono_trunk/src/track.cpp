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

#include "track.h"
//

Track::Track(  )
{
  setName(tr("MyTrack"));
  setLaps(5);
  setEtaps(2);
}

QString Track::name(void) const
  {
    return m_name;
  }

void Track::setName(const QString name)
{
  m_name = name;
}

int Track::laps(void) const
  {
    return m_laps_number;
  }

void Track::setLaps(const int laps)
{
  m_laps_number = laps;
}

int Track::etaps(void) const
  {
    return m_etaps_number;
  }

void Track::setEtaps(const int etaps)
{
  if (etaps >= 1)
    {
      m_etaps_number = etaps;
    }
  else
    {
      m_etaps_number = 1;
    }
}

QDomElement Track::to_node( QDomDocument &dom_doc )
{
  // Using attributes

  QDomElement dom_elt = dom_doc.createElement( QLatin1String("track") );

  QString strBuf;

  dom_elt.setAttribute( QLatin1String("etaps"), strBuf.setNum( etaps() ) );
  dom_elt.setAttribute( QLatin1String("laps"), strBuf.setNum( laps() ) );
  dom_elt.setAttribute( QLatin1String("name"), name() );

  return dom_elt;


  /*
    // Using QDomElement and QDomText
   
    QDomElement dom_elt = dom_doc.createElement( "track" );
    QString strBuf;
    strBuf = "test";
   
    QDomElement name = dom_doc.createElement("name");
      //QDomText _name = dom_doc.createTextNode( "A track" );
      //QDomText _name = dom_doc.createTextNode( name() );
      //strBuf = name();
      QDomText _name = dom_doc.createTextNode( strBuf );
    QDomElement etaps = dom_doc.createElement("etaps");
    //  QDomText _etaps = dom_doc.createTextNode( strBuf.setNum( etaps() ) );
    QDomElement laps = dom_doc.createElement("laps");
    //  QDomText _laps = dom_doc.createTextNode( strBuf.setNum( laps() ) );
   
    dom_elt.appendChild(name);
      name.appendChild(_name);
    dom_elt.appendChild(laps);
    //  laps.appendChild(_laps);
    dom_elt.appendChild(etaps);
    //  etaps.appendChild(_etaps);
   
    return dom_elt;
  */
}


/*
void Track::parse(const QDomElement &element, Track &track)
{
 
}
*/

