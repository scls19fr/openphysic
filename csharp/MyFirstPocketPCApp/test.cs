// project created on 17/12/2003 at 22:47
using System;
using System.Windows.Forms;

namespace MyFormProject 
{
	class MainForm : System.Windows.Forms.Form
	{
		public MainForm()
		{
			InitializeComponent();
		}
	
		// THIS METHOD IS MAINTAINED BY THE FORM DESIGNER
		// DO NOT EDIT IT MANUALLY! YOUR CHANGES ARE LIKELY TO BE LOST
		void InitializeComponent()
		{
			// 
			//  Set up generated class MainForm
			// 
			//this.SuspendLayout();		**** A cause du compact FrameWork
			//this.Name = "MainForm";	**** A cause du compact FrameWork
			this.Text = "My C# form";
			this.Size = new System.Drawing.Size(300, 300);
			//this.ResumeLayout(false);	**** A cause du compact FrameWork
		}
			
		[STAThread]
		public static void Main(string[] args)
		{
			Application.Run(new MainForm());
		}
	}			
}