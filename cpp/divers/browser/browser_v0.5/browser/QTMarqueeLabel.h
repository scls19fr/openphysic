#ifndef QTMARQUEELABEL_H
#define QTMARQUEELABEL_H


#include <QTimer>
#include <QPainter>
#include <QLabel>

// Custom Label Derived from QLabel
class QTMarqueeLabel : public QLabel
{
	Q_OBJECT

	public: //Member Functions
		enum Direction{LeftToRight,RightToLeft};
		QTMarqueeLabel(QWidget *parent = 0);
		~QTMarqueeLabel();	
        //void setAlignment(Qt::Alignment);
        void show();

	public slots: //Public Member Slots
		// utility method to set the direction of movement
		void setDirection(int d);
		
	protected: //Member Functions
		void paintEvent(QPaintEvent *evt);
		void resizeEvent(QResizeEvent *evt);
		void updateCoordinates();

	private: //Data Members
		int position_x; 
		int position_y;
		QTimer timer;
		int pixels_to_move;
		int direction;
		int fontPointSize;
		int textLength;

	private slots: //Private Member Slots
		void refreshLabel();
};

#endif //QTMARQUEELABEL_H
