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

#ifndef SLIDE_H
#define SLIDE_H

#include <QObject>
#include <QDateTime>

class Slide : public QObject
{
    Q_OBJECT
public:
    explicit Slide(QObject *parent = 0);

    QString title;
    QString url;
    QString message;
    int delay; // delay to change slide
    qreal zoom;
    // model

    QDateTime lastupdate;
    int delay_refresh; // delay to refresh window (200ms)

signals:
    
public slots:
    
};

#endif // SLIDE_H
