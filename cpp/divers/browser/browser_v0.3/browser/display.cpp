/*
Browser
Copyright (C) 2012  Sebastien Celles

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

#include "display.h"

#include <QDebug>
#include <QSettings>

#include <QFile>
#include <QDir>
#include <QMessageBox>


Display::Display(QObject *parent) :
    QObject(parent)
{
  m_playing = true;
  m_page = 0;

  //m_fullscreen = true;

  arraySlide = new QVector<Slide *>();

  load_config();
}

void Display::play(void)
{
  m_playing = true;
  //reset_timer();
}

void Display::pause(void)
{
  m_playing = false;
  //reset_timer();
}

void Display::playpause(void)
{
  m_playing = !m_playing;
  //reset_timer();
}

void Display::next(void)
{
  //qDebug() << "next";
  if (m_page<pageTotal()-1) {
    m_page++;
  } else {
    m_page=0;
  }
}

void Display::previous(void)
{
  //qDebug() << "previous";
  if (m_page>0) {
    m_page--;
  } else {
    m_page=pageTotal()-1;
  }
}

quint8 Display::page(void) const
{
   return m_page;
}

quint8 Display::pageTotal(void) const
{
//   return m_N;
   return arraySlide->count();
}

bool Display::isPlaying(void) const
{
   return m_playing;
}

void Display::print(void)
{
    qDebug() << "page/N =" << m_page+1 << "/" << pageTotal();

    for (int i=0;i<pageTotal();i++) {
        qDebug() << i << ":" << arraySlide->at(i)->title;
    }
}

#define CFG_FILE QLatin1String("browser.ini")
#define CFG_DIR QDir::homePath()

void Display::load_config(void)
{
    QString msg;
    //QFile file( CFG_FILE );
    //QDir::setCurrent( CFG_DIR );
    //int m_attribut;
    //m_attribut = settings.value("nomDuParametre").toInt();
    //qDebug()<<m_attribut;

    // ToDo test if settings exists ?
    // ToDo default value

    if( !QFile::exists(CFG_DIR+"/"+CFG_FILE) ) // config file doesn't exist
    {
        //file.open( QIODevice::ReadOnly );
        msg = QObject::tr("Error: can't open configuration file \"")
            + CFG_FILE + "\" in \"" + CFG_DIR + "\" directory!\n"
            + QObject::tr(
                "This is probably the first time\n"
                "you run this application.\n"
                "So just click ok.\n"
                "Next time, this message shouldn't appear.\n"
            );
        qDebug() << msg;
        QMessageBox::warning(0,
            QObject::tr("Loading config file"),
            msg
        );

        Slide *s;
        s = new Slide();

        /*
        s->title = QString("Title of this slide 0");
        s->url = QString("http://www.google.fr?q=test0");
        s->message = QString("Message of slide 0");
        //s->delay = 2000;
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("Title of this slide 1");
        s->url = QString("http://www.google.fr?q=test1");
        s->message = QString("Message of slide 1");
        //s->delay = 3000;
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("Title of this slide 2");
        s->url = QString("http://www.google.fr?q=test2");
        s->message = QString("Message of slide 2");
        //s->delay = 4000;
        arraySlide->append(s);
        */

        /*
        s->title = QString("GTE 1 - S1-S2");
        s->url = QString("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus (GTE) affichage lim&code=_Z1PT11_TP1,_Z1PT11_TP2,_Z1PT11_TP3,_Z1PT11_TP4,_Z1PT11_TP5,_Z1PT11_TP6&projectId=3");
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("GTE 2 - S3");
        s->url = QString("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus (GTE) affichage lim&code=_Z2PT11_S3_TP1,_Z2PT11_S3_TP2,_Z2PT11_S3_TP3,_Z2PT11_S3_TP4,_Z2PT11_S3_TP5&projectId=3");
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("LP VERTE");
        s->url = QString("https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus (GTE) affichage lim&code=_ZWP041_TP1FI,_ZWP041_TP1FA,_ZWP041_TP2FI,_ZWP041_TP2FA&projectId=3");
        arraySlide->append(s);
        */

        s->title = QString("Title of this slide 0");
        s->url = QString("http://www.google.fr?q=test0");
        s->message = QString("Message of slide 0");
        //s->delay = 2000;
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("Title of this slide 1");
        s->url = QString("http://www.google.fr?q=test1");
        s->message = QString("Message of slide 1");
        //s->delay = 3000;
        arraySlide->append(s);

        s = new Slide();
        s->title = QString("Title of this slide 2");
        s->url = QString("http://www.google.fr?q=test2");
        s->message = QString("Message of slide 2");
        //s->delay = 4000;
        arraySlide->append(s);

        m_proxy_enabled = false;
        //m_proxy.setType(QNetworkProxy::Socks5Proxy);
        m_proxy.setType(QNetworkProxy::HttpProxy);
        m_proxy.setHostName("proxy.example.com");
        m_proxy.setPort(8080);
        m_proxy.setUser("username");
        m_proxy.setPassword("password");
        if (m_proxy_enabled) {
            QNetworkProxy::setApplicationProxy(m_proxy);
        } else {
            QNetworkProxy::setApplicationProxy(QNetworkProxy::NoProxy);
        }

        save_config(); // create a new config file with default keys/values

     } else { // config file exists = loading this config file
        msg = QObject::tr("Loading configuration file from \"") + CFG_FILE + "\" in \"" + CFG_DIR + "\" directory";
        qDebug() << msg;
        qDebug() << "if bug occurs, remove config file";

        QSettings settings(CFG_DIR+"/"+CFG_FILE, QSettings::IniFormat);

        settings.beginGroup("config");
        this->m_playing = settings.value("playing", this->m_playing).toBool();
        this->m_page = settings.value("page", this->m_page).toInt();
        settings.endGroup();

        settings.beginGroup("proxy");
        m_proxy_enabled = settings.value("enabled", m_proxy_enabled).toBool();
        m_proxy.setType((QNetworkProxy::ProxyType) settings.value("setType", m_proxy.type()).toUInt()); // ToFix ?
        m_proxy.setHostName(settings.value("setHostName", m_proxy.hostName()).toString());
        m_proxy.setPort(settings.value("setPort", m_proxy.port()).toUInt()); // ToFix:QUint16
        m_proxy.setUser(settings.value("setUser", m_proxy.user()).toString());
        m_proxy.setPassword(settings.value("setPassword", m_proxy.password()).toString());
        settings.endGroup();

        Slide *s_def;
        s_def = new Slide();
        settings.beginGroup("slide_default");
        s_def->title = settings.value("title", s_def->title).toString();
        s_def->url = settings.value("url", s_def->url).toString();
        s_def->message = settings.value("message", s_def->message).toString();
        s_def->delay = settings.value("delay", s_def->delay).toUInt();
        s_def->zoom = settings.value("zoom", s_def->zoom).toReal();
        settings.endGroup();

        settings.beginGroup("slides");
        QString show_slides;
        show_slides = settings.value("show_slides", "").toString();
        //qDebug() << show_slides;
        QStringList list;
        list = show_slides.split(",");
        //qDebug() << list;

        QStringList::Iterator stlIter;
        Slide *s;
        for( stlIter = list.begin(); stlIter != list.end(); ++stlIter ) {
            qDebug() << (*stlIter);
            s = new Slide();
            settings.beginGroup((*stlIter));
            s->title = settings.value("title", s_def->title).toString();
            s->url = settings.value("url", s_def->url).toString();
            s->message = settings.value("message", s_def->message).toString();
            s->delay = settings.value("delay", s_def->delay).toUInt();
            s->zoom = settings.value("zoom", s_def->zoom).toReal();
            settings.endGroup();
            arraySlide->append(s);

        }

        settings.endGroup();


     }

     //file.close();
    if (pageTotal()<=0) {
        qDebug() << "Config file error - delete config";
        QFile::copy(CFG_DIR+"/"+CFG_FILE, CFG_DIR+"/"+CFG_FILE+"."+QDateTime::currentDateTime().toString(QString("yyyy-MM-dd_hh-mm-ss"))+".bak");
        QFile::remove(CFG_DIR+"/"+CFG_FILE);
        load_config();
    }
}

void Display::save_config(void)
{
    qDebug() << "Save config";

    QSettings settings(CFG_DIR+"/"+CFG_FILE, QSettings::IniFormat);

    settings.beginGroup("config");
    settings.setValue("playing", this->m_playing);
    settings.setValue("page", this->m_page);
//    settings.setValue("delayRefreshSlide", ...); // 200ms
//    settings.setValue("delayChangeSlide", ...); // 5s = 5*60
//    settings.setValue("delayReloadData", ...); //
    settings.endGroup();

    settings.beginGroup("proxy");
    settings.setValue("enabled", m_proxy_enabled);
    settings.setValue("setType", m_proxy.type());
    settings.setValue("setHostName", m_proxy.hostName());
    settings.setValue("setPort", m_proxy.port());
    settings.setValue("setUser", m_proxy.user());
    settings.setValue("setPassword", m_proxy.password());
    settings.endGroup();

    Slide *s;
    s = new Slide();
    settings.beginGroup("slide_default");
    settings.setValue("title", s->title);
    settings.setValue("url", s->url);
    settings.setValue("message", s->message);
    settings.setValue("delay", s->delay);
    settings.setValue("zoom", s->zoom);
    settings.endGroup();

    settings.beginGroup("slides");

    QString show_slides = "";
    for (int i=0;i<this->pageTotal();i++) {
        if (i!=pageTotal()-1) {
            show_slides += QString::number(i) + ",";
        } else {
            show_slides += QString::number(i);
        }
    }
    settings.setValue("show_slides", show_slides);

    for (int i=0;i<this->pageTotal();i++) {
        settings.beginGroup(QString::number(i));
        settings.setValue("title", arraySlide->at(i)->title);
        settings.setValue("url", arraySlide->at(i)->url);
        settings.setValue("message", arraySlide->at(i)->message);
        settings.setValue("delay", arraySlide->at(i)->delay);
        settings.setValue("zoom", arraySlide->at(i)->zoom);
        settings.endGroup();
    }

    settings.endGroup();
}
