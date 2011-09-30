using System;
using System.Drawing;

namespace Paint_.NET
{
	/// <summary>
	/// Summary description for Stroke.
	/// </summary>
	public class Stroke
	{
		private Bitmap shape;
		private float width;

		public Stroke(Bitmap bitmap,Color color,float a,float b,float c,float soft,bool flat,bool square)
		{
			//Create shape
			shape=(Bitmap)bitmap.Clone();
			for(int i=0;i<shape.Width;i++)
			{
				for(int j=0;j<shape.Height;j++)
				{
					float x=(float)(i-shape.Width/2);
					float y=(float)(j-shape.Height/2);
					float len2=x*x+y*y;
					float r=Math.Min(shape.Width/2,shape.Height/2);
					float r2=r*r;
					if(square||len2<=r2)
					{
						Color col=shape.GetPixel(i,j);
						float ii=(((float)(col.R+col.G+col.B))/3f)/255f;
						int aa=(int)(((a*ii*ii+b*ii+c)*(((float)color.A)/255f)*255f));
						if(aa<0)
							aa=0;
						if(aa>255)
							aa=255;
						float sa=1f;
						if(soft>0f)
						{
							sa=1f-(len2/r2)*soft;
							if(sa<0f)
								sa=0f;
							if(sa>1f)
								sa=1f;
						}
						if(flat)
							shape.SetPixel(i,j,Color.FromArgb((int)(((float)aa)*sa),color));
						else
						{
							Color cc=shape.GetPixel(i,j);
							int rr=(int)((((float)cc.R)/255f)*(((float)color.R)/255f)*255f);
							if(rr<0)
								rr=0;
							if(rr>255)
								rr=255;
							int gg=(int)((((float)cc.G)/255f)*(((float)color.G)/255f)*255f);
							if(gg<0)
								gg=0;
							if(gg>255)
								gg=255;
							int bb=(int)((((float)cc.B)/255f)*(((float)color.B)/255f)*255f);
							if(bb<0)
								bb=0;
							if(bb>255)
								bb=255;
							shape.SetPixel(i,j,Color.FromArgb((int)(((float)aa)*sa),rr,gg,bb));
						}

					}
					else
						shape.SetPixel(i,j,Color.FromArgb(0,0,0,0));
				}
			}
		}

		public Bitmap Shape
		{
			get
			{
				return shape;
			}
		}

		public float Width
		{
			get
			{
				return width;
			}
			set
			{
				width=value;
			}
		}
	}
}
