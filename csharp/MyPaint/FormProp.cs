// created on 18/12/2003 at 17:22
using System;
using System.Windows.Forms;

namespace MyForm {
	public class CreatedForm : System.Windows.Forms.Form
	{
		public CreatedForm()
		{
			InitializeComponent();
		}
		
		// THIS METHOD IS MAINTAINED BY THE FORM DESIGNER
		// DO NOT EDIT IT MANUALLY! YOUR CHANGES ARE LIKELY TO BE LOST
		void InitializeComponent() {
			// 
			// FormProp
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(632, 621);
			this.Name = "FormProp";
			this.Load += new System.EventHandler(this.FormPropLoad);
		}
		void FormPropLoad(object sender, System.EventArgs e)
		{
			
		}
		
	}
}
