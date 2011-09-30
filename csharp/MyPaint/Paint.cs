using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace Paint_.NET
{
	/// <summary>
	/// Summary description for Paint.
	/// </summary>
	public class Paint
	{
		private Bitmap bitmap;
		private Graphics graphics;

		public Paint(int width,int height)
		{
			//Init new paint buffers
			bitmap=new Bitmap(width,height);
			graphics=Graphics.FromImage(bitmap);
		}
		public Paint(string filename)
		{
			//Init paint buffers from file
			bitmap=new Bitmap(filename);
			graphics=Graphics.FromImage(bitmap);
		}

		public void Clear(Color color)
		{
			//Clear buffers
			graphics.Clear(color);
		}
		public void Point(Stroke stroke,Point point)
		{
			//Draw point (image)
			if(stroke!=null)
				graphics.DrawImage(stroke.Shape,new Rectangle(point.X-(int)(stroke.Width/2f),point.Y-(int)(stroke.Width/2f),(int)stroke.Width,(int)stroke.Width),0,0,stroke.Shape.Width,stroke.Shape.Height,GraphicsUnit.Pixel);
		}
		public void Line(Stroke stroke,Point point0,Point point1)
		{
			//Extremely Fast Line Algorithm
			//Copyright 2001-2002, By Po-Han Lin

			bool yLonger=false;
			int shortLen=point1.Y-point0.Y;
			int longLen=point1.X-point0.X;
			if(Math.Abs(shortLen)>Math.Abs(longLen)) 
			{
				int swap=shortLen;
				shortLen=longLen;
				longLen=swap;				
				yLonger=true;
			}
			int decInc;
			if(longLen==0)decInc=0;
			else decInc=(shortLen<<16)/longLen;

			if(yLonger) 
			{
				if(longLen>0) 
				{
					longLen+=point0.Y;
					for(int j=0x8000+(point0.X<<16);point0.Y<=longLen;++point0.Y) 
					{
						Point(stroke,new Point(j>>16,point0.Y));	
						j+=decInc;
					}
					return;
				}
				longLen+=point0.Y;
				for(int j=0x8000+(point0.X<<16);point0.Y>=longLen;--point0.Y) 
				{
					Point(stroke,new Point(j>>16,point0.Y));	
					j-=decInc;
				}
				return;	
			}

			if(longLen>0) 
			{
				longLen+=point0.X;
				for(int j=0x8000+(point0.Y<<16);point0.X<=longLen;++point0.X) 
				{
					Point(stroke,new Point(point0.X,j>>16));	
					j+=decInc;
				}
				return;
			}
			longLen+=point0.X;
			for(int j=0x8000+(point0.Y<<16);point0.X>=longLen;--point0.X) 
			{
				Point(stroke,new Point(point0.X,j>>16));	
				j-=decInc;
			}
		}

		public Bitmap Bitmap
		{
			get
			{
				return bitmap;
			}
		}
	}
}
