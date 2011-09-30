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

#ifndef MAINAPPLICATIONADAPTOR_H
#define MAINAPPLICATIONADAPTOR_H

/*
http://doc.trolltech.com/4.4/qdbusadaptorexample.html
 */

#include <Qt>
#include <QtDBus>

class MainApplicationAdaptor: public QDBusAbstractAdaptor
         {
             Q_OBJECT
             Q_CLASSINFO("D-Bus Interface", "com.example.DBus.MainApplication")
             Q_CLASSINFO("D-Bus Interface", "org.kde.DBus.MainApplication")
             Q_PROPERTY(QString caption READ caption WRITE setCaption)
             Q_PROPERTY(QString organizationName READ organizationName)
             Q_PROPERTY(QString organizationDomain READ organizationDomain)

         private:
             QApplication *app;

         public:
             MainApplicationAdaptor(QApplication *application)
                 : QDBusAbstractAdaptor(application), app(application)
             {
                 connect(application, SIGNAL(aboutToQuit()), SIGNAL(aboutToQuit()));
                 connect(application, SIGNAL(focusChanged(QWidget*, QWidget*)),
                         SLOT(focusChangedSlot(QWidget*, QWidget*)));
             }

/*
             QString caption()
             {
                 if (app->hasMainWindow())
                     return app->mainWindow()->caption();
                 return QString(""); // must not return a null QString
             }

             void setCaption(const QString &newCaption)
             {
                 if (app->hasMainWindow())
                     app->mainWindow()->setCaption(newCaption);
             }
*/

             QString organizationName()
             {
                 return app->organizationName();
             }

             QString organizationDomain()
             {
                 return app->organizationDomain();
             }

         public slots:
             Q_NOREPLY void quit()
             { app->quit(); }

/*
             void reparseConfiguration()
             { app->reparseConfiguration(); }

             QString mainWindowObject()
             {
                 if (app->hasMainWindow())
                     return QString("/%1/mainwindow").arg(app->applicationName());
                 return QString();
             }

             void setSessionManagement(bool enable)
             {
                 if (enable)
                    app->enableSessionManagement();
                 else
                    app->disableSessionManagement();
             }
*/

         private slots:
/*
             void focusChangedSlot(QWidget *, QWidget *now)
             {
                 if (now == app->mainWindow())
                     emit mainWindowHasFocus();
             }
*/
         signals:
             void aboutToQuit();
             void mainWindowHasFocus();
         };

#endif
