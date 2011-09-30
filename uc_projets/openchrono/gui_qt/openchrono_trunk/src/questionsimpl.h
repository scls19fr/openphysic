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

#ifndef QUESTIONSIMPL_H
#define QUESTIONSIMPL_H
//
#include "ui_questions.h"
//
#include "data.h"

#include <QString>

class QuestionsImpl : public QDialog, public Ui::frmQuestions
  {
    Q_OBJECT

  public:
    QuestionsImpl( QWidget * parent = 0, Qt::WFlags f = 0, Data * data = 0 );

  public slots:
    void setTitle(QString str);
    void setQuestion(QString str);
    void setAnswers(QStringList strLstAnswers);
    void setAnswersYesNo();

  private:
    Data * m_Data;
  };
#endif

