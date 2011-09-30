/*
Browser
Copyright (C) 2008  Sebastien CELLES
 
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

//
#include <QTimer>

#include <iostream> //for test

#include "browser.h"


#include <QFile>
#include <QDir>
#include <QTextStream>
//#include <QDomDocument>
#include <QtXml>
#include <QMessageBox>


Browser::Browser( QWidget * parent, Qt::WFlags f) : QDialog(parent, f)
{
  m_playing = false;

  setupUi(this);

// url = about:blank

  //setGeometry(0,0,320,240);
  setGeometry(0,0,640,480);
  //setWindowFlags(Qt::SplashScreen);
  //setWindowFlags(Qt::Popup);


  timer = new QTimer(this);
  connect( timer, SIGNAL( timeout() ), this, SLOT( update() ) );
  //timer->start(2000);

  load(); // load value in ~/browser.

  //play();
  //pause();
  
  //gotopage(2);

  //webView->setUrl(QUrl("about:blank"));
  //webView->setUrl(QUrl("http://acid3.acidtests.org"));
  //webView->setUrl(QUrl("http://www.google.fr"));
  //webView->setUrl(QUrl("http://www.orange.fr"));

//webView->load(QUrl("http://www.trolltech.com/"));

//webView_2->hide();
  webView->setZoomFactor(1.50);

  //page=url_list.count()-1;

  //std::cout << "page=" << page << std::endl;


  //update();
  
  //play();
  //pause();
  
  //gotopage(-1);
  //pause();
  gotopage(0);
  play();
  //gotopage(2);
  //gotopage(5);
  //gotopage(6);  
}


Browser::~Browser( )
{
  save();
}

void Browser::update(void)
{
  next();
  update_view();

  // ToDo double buffering (next) or triple buffering (next/previous)
  // use an other webView
}

void Browser::update_view(void)
{
  webView->load(url_list[page]);
  std::cout << qPrintable(tr("Showing page ")) << qPrintable(url_list[page].toString()) << std::endl;
  if (url_list[page].isValid()) {
    std::cout << qPrintable(tr("Valid URL")) << std::endl;
  } else {
    std::cout << qPrintable(tr("INVALID URL")) << std::endl;
  }
}

/*
void Browser::setUrl(const QUrl &url)
{
    webView->setUrl(url);
}
*/

/*
QUrl Browser::url() const
{
    if (d->page)
        return d->page->mainFrame()->url();
    return QUrl();
}
*/

void Browser::nextpage(void)
{
  reset_timer();
  next();
  update_view();
}

void Browser::previouspage(void)
{
 reset_timer();
 previous();
 update_view(); 
}

void Browser::keyPressEvent(QKeyEvent * event)
{
  switch ( event->key() )
    {
    case Qt::Key_K: /* next */
      nextpage();
      break;
    case Qt::Key_J: /* previous */
      previouspage();
      break;
    case Qt::Key_Q: /* quit - just for test */
      //save();
      close();
      break;
    case Qt::Key_R: /* Reload config file - just for test */
      reload();
      break;
    case Qt::Key_P:
      playpause();
      break;
    case Qt::Key_T: /* just for debug */
      test();
      break;
    default: // n'importe quelle autre touche
      std::cout << "UNDEF KEY" << std::endl;
      break;
    }
}


void Browser::next()
{
  //std::cout << "next" << std::endl;

  page++;
  if (page==url_list.count())
    page=0;

//  page = (page + 1) % url_list.count(); // next page (modulo for circular)
}

void Browser::previous()	
{
  //std::cout << "previous" << std::endl;

  page--;
  if (page==-1)
    page=url_list.count()-1;
}

void Browser::reset_timer()
{
  if (m_playing && default_interval!=0) {
    std::cout << "play" << std::endl;
    timer->start(default_interval);
  } else {
    std::cout << "pause" << std::endl;
    timer->stop();
  }
}

void Browser::play(void)
{
  m_playing = true;
  reset_timer();
}

void Browser::pause(void)
{
  m_playing = false;
  reset_timer();
}

void Browser::playpause()
{
  m_playing = !m_playing;
  reset_timer();
}


int Browser::gotopage(int new_page)
{
  if (new_page<url_list.count() && new_page>=0) {
    page=new_page;
    update_view();
    return 0; // ok  
  } else {
  	// + return to first page
  	//page=0;
  	//update_view();
  	
  	// + nothing is done
    return 1; // erreur page inexistante
  }
}

/*
int Browser::page()
{
  return page;
}
*/


void Browser::load(void)
{
  std::cout << qPrintable(tr("Loading data")) << std::endl;

  QFile file( CFG_FILE );
  QDir::setCurrent( CFG_DIR );

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

      /* Default values */
      default_interval = 5000;
      url_list.append(QUrl("http://www.google.fr/search?hl=fr&q=test%200"));
      url_list.append(QUrl("http://www.google.fr/search?hl=fr&q=test%201"));
      url_list.append(QUrl("http://www.google.fr/search?hl=fr&q=test%202"));
      url_list.append(QUrl("http://www.google.fr/search?hl=fr&q=test%203"));
      url_list.append(QUrl("http://www.google.fr/search?hl=fr&q=test%204"));
      url_list.append(QUrl("http://www.google.fr/search?hl=fr&q=test%205"));
/*

<!DOCTYPE BrowserML PUBLIC '-//CELLES//DTD Browser 0.1 //EN' 'http://www.celles.net/dtd/browser/browser_data-0_1.dtd'>
<!--This file describe data for a very light browser for dynamic display-->
<!--http://www.celles.net/wiki/Browser-->
<browser timer="5000">
 <url>http://127.0.0.1/test/0.html</url>
 <url>http://127.0.0.1/test/1.html</url>
 <url>http://127.0.0.1/test/2.html</url>
 <url>http://127.0.0.1/test/3.html</url>
 <url>http://127.0.0.1/test/4.html</url>
 <url>http://127.0.0.1/test/5.html</url>
</browser>

http://www.google.fr/search?hl=fr&q=test
http://www.google.fr/search?hl=fr&amp;q=test

*/

      //save(); // save default values
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
  if (root.tagName() != QLatin1String("browser"))
    {
      QString strErr = QObject::tr("Document should begin with <browser> and stop with </browser>");
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
      default_interval = root.attribute(QLatin1String("timer")).toInt();

      QDomElement element = node.toElement();

      if (element.tagName() == QLatin1String("url"))
        {
          std::cout << qPrintable(tr(" ")) << qPrintable(tr("Parsing"))  << qPrintable(tr(" ")) << qPrintable(element.tagName()) << std::endl;
          std::cout << "  " << qPrintable(element.text()) << std::endl;
         // QString
          QUrl url = QUrl(element.text());
          //QUrl url = QUrl(element.text(),QUrl::TolerantMode);
          //QString str = QString("http://www.google.fr/search?hl=fr&q=test");
          //QUrl url = QUrl(str);
          //url.ParsingMode=QUrl::TolerantMode;
          url_list.append(url);
          //url_list.append(element.text());
          //url_list.append(QUrl::fromEncoded(element.text().toStdString()));
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

  if (url_list.count()==0) {
    //url_list.append(QUrl("about:blank"));
    url_list.append(QUrl("http://www.google.fr"));
  }

}

void Browser::save(void)
{
  std::cout << qPrintable(tr("Saving data")) << std::endl;

  QFile file( CFG_FILE );
  QDir::setCurrent( CFG_DIR );

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

  QString name_ml = QLatin1String("BrowserML");
  QString publicId = QLatin1String("-//CELLES//DTD Browser 0.1 //EN");
  QString systemId = QLatin1String("http://www.celles.net/dtd/browser/browser_data-0_1.dtd");
  QDomDocument doc(impl.createDocumentType(name_ml,publicId,systemId));
  // add some XML comment at the beginning
  doc.appendChild(doc.createComment(QLatin1String("This file describe data for a very light browser for dynamic display")));
  doc.appendChild(doc.createTextNode(QLatin1String("\n"))); // for nicer output
  doc.appendChild(doc.createComment(QLatin1String("http://www.celles.net/wiki/Browser")));
  doc.appendChild(doc.createTextNode(QLatin1String("\n"))); // for nicer output

  QDomElement root = doc.createElement(QLatin1String("browser")); // racine
  root.setAttribute( QLatin1String("timer"), timer->interval() );
  //std::cout << "timer=" << timer->interval() << std::endl;

  doc.appendChild(root);

  for (int i=0 ; i<url_list.count() ; i++) {
    QDomElement dom_elt = doc.createElement( QLatin1String("url") );
    QDomText dom_txt = doc.createTextNode(url_list[i].toString());
    dom_elt.appendChild(dom_txt);
    root.appendChild( dom_elt );
  }

  QTextStream ts( &file );
  ts << doc.toString();

  file.close();

  std::cout << qPrintable(tr(" ")) << qPrintable(tr("Data saved")) << std::endl;
}

void Browser::reload(void)
{
  std::cout << qPrintable(tr("(RE)-Loading data")) << std::endl;
  url_list.clear();
  load();
}

void Browser::test(void)
{
  std::cout << qPrintable(tr("Test browser")) << std::endl;
  if (m_playing) {
    std::cout << qPrintable(tr(" Playing")) << std::endl;
  } else {
    std::cout << qPrintable(tr(" Not Playing")) << std::endl;
  }
  std::cout << qPrintable(tr(" There is ")) << url_list.count() << qPrintable(tr(" URL(s) in memory")) << std::endl;
  std::cout << qPrintable(tr(" Timer is set to ")) << timer->interval() << qPrintable(tr(" ms")) << std::endl;

}
