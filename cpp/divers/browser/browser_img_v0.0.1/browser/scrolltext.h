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

#ifndef SCROLLTEXT_H
#define SCROLLTEXT_H

#include <QLabel> // scls
#include <QWidget>
#include <QStaticText>
#include <QTimer>

//class ScrollText : public QLabel
class ScrollText : public QLabel
{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText)
    Q_PROPERTY(QString separator READ separator WRITE setSeparator)

public:
    explicit ScrollText(QWidget *parent = 0);

public slots:
    QString text() const;
    void setText(QString text);

    QString separator() const;
    void setSeparator(QString separator);


protected:
    virtual void paintEvent(QPaintEvent *);
    virtual void resizeEvent(QResizeEvent *);

private:
    void updateText();
    QString _text;
    QString _separator;
    QStaticText staticText;
    int singleTextWidth;
    QSize wholeTextSize;
    int leftMargin;
    bool scrollEnabled;
    int scrollPos;
    QImage alphaChannel;
    QImage buffer;
    QTimer timer;

private slots:
    virtual void timer_timeout();
};

#endif // SCROLLTEXT_H
