/*
Des widgets en 3D avec Qt
Ref: http://www.siteduzero.com/tutoriel-3-271568-des-widgets-en-3d-avec-qt.html
*/

#include <QApplication>
#include <QtGui>

#include "form.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    Form frm;
    //frm.show();
    //frm.showFullScreen();
    frm.showMaximized();

    return app.exec();
}

/*
#include <QApplication>
#include <QtGui>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    QPushButton *bouton = new QPushButton("Mon bouton entre en scène !");
    QGraphicsScene scene;
    scene.setSceneRect(-150 , -150, 300, 300);
    
    QGraphicsProxyWidget *proxy = new QGraphicsProxyWidget();
    proxy->setWidget(bouton);
    scene.addItem(proxy);
    
    //proxy->setRotation(45);

    QTransform matrix;
    matrix.translate(150, 200);
    proxy->setTransform(matrix);
    
    matrix = QTransform().translate(proxy->x(), proxy->y());
    proxy->setTransform(matrix);
        
    QGraphicsView view(&scene);
    view.show();
    
    return app.exec();
}
*/
