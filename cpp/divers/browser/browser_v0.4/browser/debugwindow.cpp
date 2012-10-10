#include "debugwindow.h"
#include "ui_debugwindow.h"

#include <QDebug>


DebugWindow::DebugWindow(QWidget *parent, MainApplication *app) :
    QDialog(parent),
    ui(new Ui::DebugWindow)
{
    ui->setupUi(this);
    m_app = app;

    QRect geom = this->geometry();
    this->setGeometry(geom); // top=0 left=0

    QObject::connect( this, SIGNAL(rejected()), m_app, SLOT(quit()) );

//    this->ui->cmdQuit->setPixmap();
//    this->ui->cmdQuit->setIcon(QIcon("/Users/scls/aff_dyn/divers/browser/browser_v0.4/browser/icons/accept_32.png"));
//    this->ui->cmdQuit->setIcon(QIcon("/Users/scls/aff_dyn/divers/browser/browser_v0.4/browser/icons/accept.svg"));
//    this->ui->cmdQuit->setIcon(QIcon("./icons/accept.svg"));

}

DebugWindow::~DebugWindow()
{
    delete ui;
}

void DebugWindow::on_cmdNext_clicked()
{
    qDebug() << "Next (debug window)";
    m_app->next();
}

void DebugWindow::on_cmdDebug_clicked()
{
    qDebug() << "Debug (debug window)";
    #ifdef DEBUG
    m_app->debug();
    #endif
}

void DebugWindow::on_cmdPrevious_clicked()
{
    qDebug() << "Previous (debug window)";
    m_app->previous();
}


void DebugWindow::on_cmdPlay_clicked()
{
    qDebug() << "Play (debug window)";
    m_app->play();
}

void DebugWindow::on_cmdPause_clicked()
{
    qDebug() << "Pause (debug window)";
    m_app->stop();
}

/*
void DebugWindow::on_DebugWindow_destroyed()
{
    qDebug() << "destroyed";
}

void DebugWindow::on_DebugWindow_accepted()
{
    qDebug() << "accepted";
    m_app->exit();
}

void DebugWindow::on_DebugWindow_finished(int result)
{
    qDebug() << "finished";
}
*/

void DebugWindow::on_cmdQuit_clicked()
{
    qDebug() << "Quit (debug window)";
    m_app->quit();
}

void DebugWindow::on_cmdStop_clicked()
{
    qDebug() << "Stop (debug window)";
    m_app->stop();
}
