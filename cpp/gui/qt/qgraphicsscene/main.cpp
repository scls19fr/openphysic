/*
Des widgets en 3D avec Qt
Ref: http://www.siteduzero.com/tutoriel-3-271568-des-widgets-en-3d-avec-qt.html
*/

#include <QApplication>
#include <QtGui>
#include <QWebView>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QWebView *web = new QWebView();
    web->load(QUrl("http://www.siteduzero.com"));
    web->show();

    QGraphicsScene scene;
    //scene.setSceneRect(0 , 0, 1000, 800);
    scene.setSceneRect(-500 , -400, 2000, 1600);

    QGraphicsProxyWidget *proxy = new QGraphicsProxyWidget();
    proxy->setWidget(web);
    scene.addItem(proxy);

    proxy->setOpacity(0.5);

    QTransform matrix;
    matrix.translate(-web->geometry().width()/2,0);
    matrix.rotate(45, Qt::YAxis);
    matrix.rotate(-30, Qt::XAxis);
    proxy->setTransform(matrix);

    QGraphicsView view(&scene);
    view.show();

    view.setWindowTitle("Ma première scène");
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
