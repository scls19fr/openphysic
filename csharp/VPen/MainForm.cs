// project created on 18/12/2003 at 18:03
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
		void InitializeComponent() {
			// 
			// MainForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.BackColor = System.Drawing.Color.White;
			this.ClientSize = new System.Drawing.Size(504, 373);
			this.Name = "MainForm";
			this.Text = "";
			this.TransparencyKey = System.Drawing.Color.White;
			this.Load += new System.EventHandler(this.MainFormLoad);
		}
			
		[STAThread]
		public static void Main(string[] args)
		{
			Application.Run(new MainForm());
		}
		void MainFormLoad(object sender, System.EventArgs e)
		{
			
		}
		
	}			
}
