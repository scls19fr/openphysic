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

#include "questionsimpl.h"
//

QuestionsImpl::QuestionsImpl( QWidget * parent, Qt::WFlags f, Data * data ) : QDialog(parent, f)
{
  setupUi(this);
  m_Data = data;

  setGeometry(750,320,320,240);

  //setTitle("Question");
  //setQuestion("Do you understand the question ?");
  //setAnswers
  //QStringList strLstAnswers;
  //strLstAnswers << "Yes" << "No";
  //setAnswers(strLstAnswers);
}

void QuestionsImpl::setTitle(QString str)
{
  lblTitle->setText(str);
  setWindowTitle(str);
}

void QuestionsImpl::setQuestion(QString str)
{
  lblQuestion->setText(str);
}

void QuestionsImpl::setAnswers(QStringList strLstAnswers)
{
  cboAnswers->addItems(strLstAnswers);
}

void QuestionsImpl::setAnswersYesNo(void)
{
  QStringList strLstAnswers;
  strLstAnswers << "Yes" << "No";
  setAnswers(strLstAnswers);
}

//

