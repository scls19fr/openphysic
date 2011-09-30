using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;

namespace Paint_.NET
{
	/// <summary>
	/// Summary description for Form2.
	/// </summary>
	public class Form2 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.PictureBox pictureBox1;
		private int mpx,mpy;
		private float scale;
		private Paint paint;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public void NewImage()
		{
			pictureBox1.Width=paint.Bitmap.Width;
			pictureBox1.Height=paint.Bitmap.Height;
			pictureBox1.Image=paint.Bitmap;
			scale=1f;
			Resizing();
		}

		public Form2(string filename)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//

			Text=filename;
			paint=new Paint(filename);
			NewImage();
		}
		public Form2(string text,int width,int height,Color backgroundcolor)
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();

			//
			// TODO: Add any constructor code after InitializeComponent call
			//

			Text=text;
			paint=new Paint(width,height);
			paint.Clear(backgroundcolor);
			NewImage();
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent() {
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.SuspendLayout();
			// 
			// pictureBox1
			// 
			this.pictureBox1.BackColor = System.Drawing.SystemColors.ControlLightLight;
			this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Hand;
			this.pictureBox1.Location = new System.Drawing.Point(0, 0);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(376, 320);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 0;
			this.pictureBox1.TabStop = false;
			this.pictureBox1.Resize += new System.EventHandler(this.pictureBox1_Resize);
			this.pictureBox1.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseMove);
			this.pictureBox1.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox1_MouseDown);
			// 
			// Form2
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.AutoScroll = true;
			this.AutoScrollMargin = new System.Drawing.Size(8, 8);
			this.BackColor = System.Drawing.SystemColors.ControlLightLight;
			this.ClientSize = new System.Drawing.Size(368, 310);
			this.Controls.Add(this.pictureBox1);
			this.Name = "Form2";
			this.ShowInTaskbar = false;
			this.Text = "New";
			this.TransparencyKey = System.Drawing.Color.Red;
			this.Resize += new System.EventHandler(this.Form2_Resize);
			this.Load += new System.EventHandler(this.Form2Load);
			this.ResumeLayout(false);
		}
		#endregion

		private void Resizing()
		{
			//Center picturebox on form
			pictureBox1.Location=new Point(Math.Max(8,Width/2-pictureBox1.Width/2-4),Math.Max(8,Height/2-pictureBox1.Height/2-16));
		}

		private void Form2_Resize(object sender, System.EventArgs e)
		{
			Resizing();
		}

		private void pictureBox1_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if(e.Button==MouseButtons.Left)
			{
				//Mouse scale coords
				int mx=(int)(((float)e.X)*scale);
				int my=(int)(((float)e.Y)*scale);
				//Paint/Draw point
				paint.Point(((Form1)this.MdiParent).Stroke,new Point(mx,my));
				//Save point coords
				mpx=mx;mpy=my;

				pictureBox1.Invalidate();
			}
		}

		private void pictureBox1_MouseMove(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if(e.Button==MouseButtons.Left)
			{
				//Mouse scale coords
				int mx=(int)(((float)e.X)*scale);
				int my=(int)(((float)e.Y)*scale);
				//Paint/Draw line
				paint.Line(((Form1)this.MdiParent).Stroke,new Point(mpx,mpy),new Point(mx,my));
				//Save point coords
				mpx=mx;mpy=my;

				pictureBox1.Invalidate();
			}
		}

		private void pictureBox1_Resize(object sender, System.EventArgs e)
		{
			Resizing();
		}

		public Paint Paintt
		{
			get
			{
				return paint;
			}
			set
			{
				paint=value;
			}
		}

		public PictureBox PictureBox1
		{
			get
			{
				return pictureBox1;
			}
			set
			{
				pictureBox1=value;
			}
		}

		public float PaintScale
		{
			get
			{
				return scale;
			}
			set
			{
				scale=value;
			}
		}
		void Form2Load(object sender, System.EventArgs e)
		{
			
		}
		
	}
}
