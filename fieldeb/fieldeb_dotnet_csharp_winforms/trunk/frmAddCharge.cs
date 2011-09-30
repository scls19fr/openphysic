/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 20/09/2004
 * Time: 11:59
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */

using System;
using System.Drawing;
using System.Windows.Forms;

namespace fieldE
{
	/// <summary>
	/// Description of Form1.
	/// </summary>
	public class frmAddCharge : System.Windows.Forms.Form
	{
		private System.Windows.Forms.Button butCancel;
		private System.Windows.Forms.Button butOk;
		private System.Windows.Forms.TextBox txtInput;
		private System.Windows.Forms.TextBox txtLabel;
		
		public bool Ok = false;
		public bool Cancel = false;
		public string Input = "1000";
		
		public frmAddCharge()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		#region Windows Forms Designer generated code
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent() {
			this.txtLabel = new System.Windows.Forms.TextBox();
			this.txtInput = new System.Windows.Forms.TextBox();
			this.butOk = new System.Windows.Forms.Button();
			this.butCancel = new System.Windows.Forms.Button();
			this.SuspendLayout();
			// 
			// txtLabel
			// 
			this.txtLabel.AutoSize = false;
			this.txtLabel.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.txtLabel.Location = new System.Drawing.Point(8, 8);
			this.txtLabel.Multiline = true;
			this.txtLabel.Name = "txtLabel";
			this.txtLabel.ReadOnly = true;
			this.txtLabel.Size = new System.Drawing.Size(232, 32);
			this.txtLabel.TabIndex = 5;
			this.txtLabel.Text = "Enter electrical charge\r\n(Value between -100 000 and +100 000)";
			// 
			// txtInput
			// 
			this.txtInput.Location = new System.Drawing.Point(8, 48);
			this.txtInput.Name = "txtInput";
			this.txtInput.Size = new System.Drawing.Size(232, 20);
			this.txtInput.TabIndex = 2;
			this.txtInput.Text = "";
			this.txtInput.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.TxtInputTextKeyPress);
			this.txtInput.TextChanged += new System.EventHandler(this.TxtInputTextChanged);
			// 
			// butOk
			// 
			this.butOk.Location = new System.Drawing.Point(8, 80);
			this.butOk.Name = "butOk";
			this.butOk.TabIndex = 3;
			this.butOk.Text = "&Ok";
			this.butOk.Click += new System.EventHandler(this.ButOkClick);
			// 
			// butCancel
			// 
			this.butCancel.Location = new System.Drawing.Point(160, 80);
			this.butCancel.Name = "butCancel";
			this.butCancel.TabIndex = 4;
			this.butCancel.Text = "&Cancel";
			this.butCancel.Click += new System.EventHandler(this.ButCancelClick);
			// 
			// frmAddCharge
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(248, 109);
			this.Controls.Add(this.txtLabel);
			this.Controls.Add(this.butCancel);
			this.Controls.Add(this.butOk);
			this.Controls.Add(this.txtInput);
			this.Name = "frmAddCharge";
			this.Text = "New electrical charge";
			this.Load += new System.EventHandler(this.FrmAddChargeLoad);
			this.ResumeLayout(false);
		}
		#endregion

				
		void ButCancelClick(object sender, System.EventArgs e)
		{
			//Console.WriteLine("Cancel");
			this.Ok = false;
			this.Cancel = true;
			this.Input = "";
			this.Close();
		}
		
		
		void FrmAddChargeLoad(object sender, System.EventArgs e)
		{
			this.txtInput.Text = this.Input;
		}
		
		void ButOkClick(object sender, System.EventArgs e)
		{
			//Console.WriteLine("Ok");
			this.Ok = true;
			this.Cancel = false;
			this.Input = this.txtInput.Text;
			// TO_DO test value
			if ( IsValidInput() )
			{
				this.Close();
			}
		}
		
		bool IsValidInput()
		{
			bool valid = true;
			
			// TO_DO
			
			return valid;
		}	
		
		void TxtInputTextKeyPress(object sender, KeyPressEventArgs e)
		{
			//Console.WriteLine(e.KeyChar);
			
			if ( e.KeyChar == '+' || e.KeyChar == '-'
			    || e.KeyChar == '0' || e.KeyChar == '1'
			    || e.KeyChar == '2' || e.KeyChar == '3'
			    || e.KeyChar == '4' || e.KeyChar == '5'
			    || e.KeyChar == '6' || e.KeyChar == '7'
			    || e.KeyChar == '8' || e.KeyChar == '9' )
				// backspace & del \u0066 
			{
				//Console.WriteLine("ok");
			}
			else
			{
				//string str = this.txtInput.Text;
				//this.txtInput.Text = str;
			}
		}
		
		void TxtInputTextChanged(object sender, System.EventArgs e)
		{
			
		}
		
	}
}
