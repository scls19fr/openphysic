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

#include "slide.h"

#include <QDebug>

Slide::Slide(QObject *parent) :
    QObject(parent)
{
    title = QString("Titre par defaut");
    url = QString("http://www.google.fr?q=defaut");
    message = QString("Pas de message"); // in ini file use "..."
    delay = 5000;
    transition_type = 1; // 0=no transition ; 1=opacity ; 2=scroll from right to left
    transition_duration = 1000;
    zoom = 1.0;

    delay_refresh = 200;
}
