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

#include "data.h"
//
#include <QFile>
#include <QDir>
#include <QTextStream>
//#include <QDomDocument>
#include <QtXml>
#include <QMessageBox>

Data::Data(  )
{

  connect(this, SIGNAL( starting_first_lap() ),
          this, SLOT( on_starting_first_lap() ) );

  connect(this, SIGNAL( is_new_etap() ),
          this, SLOT( on_new_etap() ) );

  connect(this, SIGNAL( is_new_lap() ),
          this, SLOT( on_new_lap() ) );

  connect(this, SIGNAL( is_last_lap() ),
          this, SLOT( on_last_lap() ) );

  connect(this, SIGNAL( race_is_over() ),
          this, SLOT( on_race_over() ) );

  load(); // load data
}

Data::~Data(  )
{
  save(); // save data
}

void Data::start(void)
{
  if ( position.etap() == track.etaps() ) // passage ligne depart/arrivee
    {
      position.clearEtap();

      if ( position.lap() == 0 )
        {
          emit starting_first_lap();
        }

      if ( position.lap() == track.laps()-1 ) // debut du dernier tour de course
        {
          emit is_last_lap();
        }

      if ( position.lap() == track.laps() ) // fin du dernier tour de course
        {
          position.clearLap();
          if ( track.laps() > 1 )
            {
              emit race_is_over();
            }
        }

      position.newLap();
      emit is_new_lap();


    } else // passage ligne temps intermediaire
    {
      position.newEtap();
      emit is_new_etap();
    }

}


void Data::test(void)
{
  std::cout << qPrintable(tr("Test Data")) << std::endl;
  vehicule.engine.state.show();
  //std::cout << qPrintable(tr("Nb of temperatures = ")) << vehicule.engine.temperature.count() << std::endl;
  //std::cout << qPrintable(tr("Temperature 1 ")) << vehicule.engine.temperature_1.value() << std::endl;
  //std::cout << qPrintable(tr("Temperature 2 ")) << vehicule.engine.temperature_2.value() << std::endl;
  chrono.show();
}

void Data::on_starting_first_lap(void)
{
  std::cout << qPrintable(tr("Starting first lap")) << std::endl;
}

void Data::on_new_etap(void)
{
  std::cout << " " << qPrintable(tr("New etap")) << std::endl;
  //chrono.etap(etap);
}

void Data::on_new_lap(void)
{
  std::cout << qPrintable(tr("New lap")) << std::endl;


  chrono.start();
}

void Data::on_last_lap(void)
{
  std::cout << qPrintable(tr("Last lap")) << std::endl;
}

void Data::on_race_over(void)
{
  std::cout << qPrintable(tr("Race over")) << std::endl;
}

void Data::load(void)
{
  std::cout << qPrintable(tr("Loading data")) << std::endl;

  QFile file( OC_CFG_FILE );
  QDir::setCurrent( OC_CFG_DIR );

  if( !file.open( QIODevice::ReadOnly ) )
    {
      QString strErr = QObject::tr("Error: Can't open config file !\n"
                                   "This is probably the first time\n"
                                   "you run this application.\n"
                                   "So just click ok.\n"
                                   "Next time, this message shouldn't appear.\n"
                                  );
      std::cerr << " " << qPrintable(strErr) << std::endl;
      QMessageBox::warning(0,
                           QObject::tr("Loading config file"),
                           strErr
                          );
      file.close();
      return;
    }

  std::cout << " " << qPrintable(tr("Loading...")) << std::endl;
  //std::cout << " ToDo" << std::endl;

  /* validating document using dtd : not possible easily using Qt4 */

  /* En test */
  QDomDocument doc;
  QString errorStr;
  int errorLine;
  int errorColumn;

  /* looking for malformed xml file */
  if( !doc.setContent( &file, true, &errorStr, &errorLine, &errorColumn ) )
    {
      QString strErr = QObject::tr("Parse error at line %1, "
                                   "column %2:\n%3")
                       .arg(errorLine)
                       .arg(errorColumn)
                       .arg(errorStr);
      std::cerr << " " << qPrintable(strErr) << std::endl;
      QMessageBox::warning(0,
                           QObject::tr("DOM Parser"),
                           strErr
                          );
      file.close();
      return;
    }

  QDomElement root = doc.documentElement();

  /* looking for the root name 'ocdata' */
  //std::cout << "root = " << qPrintable(root.tagName()) << std::endl;
  if (root.tagName() != QLatin1String("ocdata"))
    {
      QString strErr = QObject::tr("Document should begin with <ocdata> and stop with </ocdata>");
      std::cerr << " " << qPrintable(strErr) << std::endl;
      QMessageBox::warning(0,
                           QObject::tr("DOM Parser"),
                           strErr
                          );

      file.close();
      return;
    }

  /* parsing file */

  QDomNode node = root.firstChild();
  while ( !node.isNull() )
    {
      QDomElement element = node.toElement();

      if (element.tagName() == QLatin1String("track"))
        {
          //Track::parse(node.toElement(), this->track);
          std::cout  << qPrintable(tr(" ")) << qPrintable(tr("Parsing"))  << qPrintable(tr(" ")) << qPrintable(element.tagName()) << std::endl;

          //std::cout << "laps=" << qPrintable(element.attribute("laps")) << std::endl;
          this->track.setLaps(element.attribute(QLatin1String("laps")).toInt());
          this->track.setEtaps(element.attribute(QLatin1String("etaps")).toInt());
          this->track.setName(element.attribute(QLatin1String("etaps")));
        }
      else if (element.tagName() == QLatin1String("position"))
        {
          std::cout << qPrintable(tr(" ")) << qPrintable(tr("Parsing")) << qPrintable(tr(" ")) << qPrintable(element.tagName()) << std::endl;
          this->position.setLap(element.attribute(QLatin1String("lap")).toInt());
          this->position.setEtap(element.attribute(QLatin1String("etap")).toInt());
        }
      else if (element.tagName() == QLatin1String("vehicule"))
        {
          std::cout << qPrintable(tr(" ")) << qPrintable(tr("Parsing")) << qPrintable(tr(" ")) << qPrintable(element.tagName()) << std::endl;
          // ToDo
        }
      else if (element.tagName() == QLatin1String("chrono"))
        {
          std::cout << qPrintable(tr(" ")) << qPrintable(tr("Parsing")) << qPrintable(tr(" ")) << qPrintable(element.tagName()) << std::endl;
          // ToDo
        }
      else
        {
          QString strErr = QObject::tr("Error: Undefined element tagName");
          std::cerr << qPrintable(tr(" ")) << qPrintable(strErr) << std::endl;
          QMessageBox::warning(0,
                               QObject::tr("DOM Parser"),
                               strErr
                              );
        }

      node = node.nextSibling();
    }

  file.close();

  std::cout << qPrintable(tr(" ")) << qPrintable(tr("Data loaded")) << std::endl;
}

void Data::save(void)
{
  std::cout << qPrintable(tr("Saving data")) << std::endl;

  QFile file( OC_CFG_FILE );
  QDir::setCurrent( OC_CFG_DIR );

  if( !file.open( QIODevice::WriteOnly ) )
    {
      QString strErr = QObject::tr("Error: Can't save config file !");
      std::cerr << " " << qPrintable(strErr) << std::endl;
      QMessageBox::warning(0,
                           QObject::tr("Saving config file"),
                           strErr
                          );
      file.close();
      return;
    }

  std::cout << qPrintable(tr(" ")) << qPrintable(tr("Saving...")) << std::endl;

  QDomImplementation impl = QDomDocument().implementation();

  QString name_ml = QLatin1String("OpenChronoML");
  QString publicId = QLatin1String("-//CELLES//DTD OpenChrono 0.1 //EN");
  QString systemId = QLatin1String("http://www.celles.net/dtd/openchrono/openchrono_data-0_1.dtd");
  QDomDocument doc(impl.createDocumentType(name_ml,publicId,systemId));
  // add some XML comment at the beginning
  doc.appendChild(doc.createComment(QLatin1String("This file describe data for OpenChrono a chronometer for mechanical sports")));
  doc.appendChild(doc.createTextNode(QLatin1String("\n"))); // for nicer output
  doc.appendChild(doc.createComment(QLatin1String("http://www.celles.net/wikini/wakka.php?wiki=OpenChrono")));
  doc.appendChild(doc.createTextNode(QLatin1String("\n"))); // for nicer output

  QDomElement root = doc.createElement(QLatin1String("ocdata")); // racine

  doc.appendChild(root);
  root.appendChild( track.to_node(doc) );
  root.appendChild( position.to_node(doc) );
  root.appendChild( vehicule.to_node(doc) );
  root.appendChild( chrono.to_node(doc) );

  QTextStream ts( &file );
  ts << doc.toString();
  //std::cout << doc.toString();

  file.close();

  std::cout << qPrintable(tr(" ")) << qPrintable(tr("Data saved")) << std::endl;
}


void Data::reset(void)
{
  chrono.reset();
  position.reset();
}

//

