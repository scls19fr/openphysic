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

#include "vehicule.h"
//

Vehicule::Vehicule(  )
{
  setName(tr("My go-kart"));
}

QString Vehicule::name(void) const
  {
    return m_name;
  }

void Vehicule::setName(const QString name)
{
  m_name = name;
}

QDomElement Vehicule::to_node( QDomDocument &dom_doc )
{
  // Using attributes

  QDomElement dom_elt = dom_doc.createElement( QLatin1String("vehicule") );

  //QString strBuf;

  dom_elt.setAttribute( QLatin1String("name"), name() );

  dom_elt.appendChild( engine.to_node(dom_doc) );


  return dom_elt;
}

