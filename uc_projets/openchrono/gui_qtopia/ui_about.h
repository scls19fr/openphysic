/********************************************************************************
** Form generated from reading ui file 'about.ui'
**
** Created: Tue May 22 19:33:32 2007
**      by: Qt User Interface Compiler version 4.2.3
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
********************************************************************************/

#ifndef UI_ABOUT_H
#define UI_ABOUT_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QLabel>
#include <QtGui/QPushButton>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

class Ui_ExampleBase
{
public:
    QVBoxLayout *vboxLayout;
    QLabel *TextLabel1;
    QPushButton *quit;

    void setupUi(QWidget *ExampleBase)
    {
    ExampleBase->setObjectName(QString::fromUtf8("ExampleBase"));
    vboxLayout = new QVBoxLayout(ExampleBase);
    vboxLayout->setSpacing(6);
    vboxLayout->setMargin(11);
    vboxLayout->setObjectName(QString::fromUtf8("vboxLayout"));
    TextLabel1 = new QLabel(ExampleBase);
    TextLabel1->setObjectName(QString::fromUtf8("TextLabel1"));
    TextLabel1->setLayoutDirection(Qt::LeftToRight);
    TextLabel1->setAlignment(Qt::AlignCenter);
    TextLabel1->setWordWrap(true);

    vboxLayout->addWidget(TextLabel1);

    quit = new QPushButton(ExampleBase);
    quit->setObjectName(QString::fromUtf8("quit"));

    vboxLayout->addWidget(quit);


    retranslateUi(ExampleBase);

    QSize size(196, 245);
    size = size.expandedTo(ExampleBase->minimumSizeHint());
    ExampleBase->resize(size);


    QMetaObject::connectSlotsByName(ExampleBase);
    } // setupUi

    void retranslateUi(QWidget *ExampleBase)
    {
    ExampleBase->setWindowTitle(QApplication::translate("ExampleBase", "Example", 0, QApplication::UnicodeUTF8));
    TextLabel1->setText(QApplication::translate("ExampleBase", "OpenChrono", 0, QApplication::UnicodeUTF8));
    quit->setText(QApplication::translate("ExampleBase", "Quit", 0, QApplication::UnicodeUTF8));
    Q_UNUSED(ExampleBase);
    } // retranslateUi

};

namespace Ui {
    class ExampleBase: public Ui_ExampleBase {};
} // namespace Ui

#endif // UI_ABOUT_H
