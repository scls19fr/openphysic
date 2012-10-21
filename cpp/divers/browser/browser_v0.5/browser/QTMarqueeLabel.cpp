/*
 * QTMarqueeLabel.cpp
 *
 *  Created on: Jun 17, 2010
 *      Author: halderp
 */
#include "QTMarqueeLabel.h"

QTMarqueeLabel::QTMarqueeLabel(QWidget *parent): QLabel(parent)
{	
	// initialize all the necessary variables
	// initialize m_align
	position_x = 0; //x cordinates
	position_y = 15;//y cordinates
	pixels_to_move = 2;// how many pixels to move 

	direction = RightToLeft; // default direction
	connect(&timer, SIGNAL(timeout()), this, SLOT(refreshLabel()));
	timer.start(50);	// start timer

	
}

void QTMarqueeLabel::refreshLabel()
{
	// with each timer interrupt should repaint the label
	// check if there is a deffered drawing
	repaint();	
}

QTMarqueeLabel::~QTMarqueeLabel()
{}
void QTMarqueeLabel::show()
	{
		QLabel::show();
	}
void QTMarqueeLabel::paintEvent(QPaintEvent *evt)
{
	// initialize the Painter
	QPainter p(this);

	if(direction==RightToLeft)
	{
		// calculate new X coordinate
		position_x -= pixels_to_move; 
		// if all text is displayed the reset X coordinate to extreme right
		if(position_x <= (-textLength))
			position_x = width();
	}
	else
	{
		position_x += pixels_to_move;
		// if all text is displayed the reset X coordinate to (0 - length of the text)
		if(position_x >= width())
			position_x = - textLength;
	}
    p.drawText(position_x, position_y + fontPointSize, text());
    evt=NULL; // ToFix warning
}

void QTMarqueeLabel::resizeEvent(QResizeEvent *evt)
{	
	updateCoordinates();
	QLabel::resizeEvent(evt);
}

void QTMarqueeLabel::updateCoordinates()
{
	// calculate the length of the text in Pixels
	fontPointSize = font().pointSize()/2;
	textLength = fontMetrics().width(text());
}



void QTMarqueeLabel::setDirection(int d)
{
	direction = d;
	refreshLabel();
}
