using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.IO;

namespace Paint_.NET
{
	/// <summary>
	/// Summary description for Form1.
	/// </summary>
	public class Form1 : System.Windows.Forms.Form
	{
		private System.Windows.Forms.GroupBox groupBox4;
		private System.Windows.Forms.GroupBox groupBox2;
		private System.Windows.Forms.MenuItem menuItem12;
		private System.Windows.Forms.MenuItem menuItem13;
		private System.Windows.Forms.MenuItem menuItem10;
		private System.Windows.Forms.MenuItem menuItem11;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.PictureBox pictureBox1;
		private System.Windows.Forms.MenuItem menuItem4;
		private System.Windows.Forms.NumericUpDown numericUpDown4;
		private System.Windows.Forms.MainMenu mainMenu1;
		private System.Windows.Forms.NumericUpDown numericUpDown8;
		private System.Windows.Forms.CheckBox checkBox1;
		private System.Windows.Forms.ColorDialog colorDialog1;
		private System.Windows.Forms.NumericUpDown numericUpDown1;
		private System.Windows.Forms.NumericUpDown numericUpDown3;
		private System.Windows.Forms.NumericUpDown numericUpDown2;
		private System.Windows.Forms.NumericUpDown numericUpDown5;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.NumericUpDown numericUpDown7;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.Label label12;
		private System.Windows.Forms.Label label13;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label label11;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.OpenFileDialog openFileDialog1;
		private System.Windows.Forms.NumericUpDown numericUpDown6;
		private System.Windows.Forms.TrackBar trackBar3;
		private System.Windows.Forms.TrackBar trackBar2;
		private System.Windows.Forms.TrackBar trackBar1;
		private System.Windows.Forms.MenuItem menuItem3;
		private System.Windows.Forms.MenuItem menuItem2;
		private System.Windows.Forms.MenuItem menuItem1;
		private System.Windows.Forms.NumericUpDown numericUpDown9;
		private System.Windows.Forms.MenuItem menuItem7;
		private System.Windows.Forms.MenuItem menuItem6;
		private System.Windows.Forms.MenuItem menuItem5;
		private System.Windows.Forms.SaveFileDialog saveFileDialog1;
		private System.Windows.Forms.MenuItem menuItem9;
		private System.Windows.Forms.MenuItem menuItem8;
		private System.Windows.Forms.ListBox listBox1;
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.CheckBox checkBox2;
		private Stroke stroke;
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Form1()
		{
			//
			// Required for Windows Form Designer support
			//
			InitializeComponent();
			InitializeComponent2();
			//
			// TODO: Add any constructor code after InitializeComponent call
			//
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if (components != null) 
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
		/// 
		
		private void InitializeComponent2() {
			// this.BackColor = System.Drawing.Color.White;
			// this.Opacity = 0.1;
			
		}
		
		private void InitializeComponent() {
			this.checkBox2 = new System.Windows.Forms.CheckBox();
			this.panel1 = new System.Windows.Forms.Panel();
			this.listBox1 = new System.Windows.Forms.ListBox();
			this.menuItem8 = new System.Windows.Forms.MenuItem();
			this.menuItem9 = new System.Windows.Forms.MenuItem();
			this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
			this.menuItem5 = new System.Windows.Forms.MenuItem();
			this.menuItem6 = new System.Windows.Forms.MenuItem();
			this.menuItem7 = new System.Windows.Forms.MenuItem();
			this.numericUpDown9 = new System.Windows.Forms.NumericUpDown();
			this.menuItem1 = new System.Windows.Forms.MenuItem();
			this.menuItem2 = new System.Windows.Forms.MenuItem();
			this.menuItem3 = new System.Windows.Forms.MenuItem();
			this.trackBar1 = new System.Windows.Forms.TrackBar();
			this.trackBar2 = new System.Windows.Forms.TrackBar();
			this.trackBar3 = new System.Windows.Forms.TrackBar();
			this.numericUpDown6 = new System.Windows.Forms.NumericUpDown();
			this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
			this.label2 = new System.Windows.Forms.Label();
			this.label11 = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			this.label13 = new System.Windows.Forms.Label();
			this.label12 = new System.Windows.Forms.Label();
			this.label8 = new System.Windows.Forms.Label();
			this.label9 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.label6 = new System.Windows.Forms.Label();
			this.label7 = new System.Windows.Forms.Label();
			this.label1 = new System.Windows.Forms.Label();
			this.numericUpDown7 = new System.Windows.Forms.NumericUpDown();
			this.label3 = new System.Windows.Forms.Label();
			this.numericUpDown5 = new System.Windows.Forms.NumericUpDown();
			this.numericUpDown2 = new System.Windows.Forms.NumericUpDown();
			this.numericUpDown3 = new System.Windows.Forms.NumericUpDown();
			this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
			this.colorDialog1 = new System.Windows.Forms.ColorDialog();
			this.checkBox1 = new System.Windows.Forms.CheckBox();
			this.numericUpDown8 = new System.Windows.Forms.NumericUpDown();
			this.mainMenu1 = new System.Windows.Forms.MainMenu();
			this.numericUpDown4 = new System.Windows.Forms.NumericUpDown();
			this.menuItem4 = new System.Windows.Forms.MenuItem();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.button1 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.button3 = new System.Windows.Forms.Button();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.menuItem11 = new System.Windows.Forms.MenuItem();
			this.menuItem10 = new System.Windows.Forms.MenuItem();
			this.menuItem13 = new System.Windows.Forms.MenuItem();
			this.menuItem12 = new System.Windows.Forms.MenuItem();
			this.groupBox2 = new System.Windows.Forms.GroupBox();
			this.groupBox4 = new System.Windows.Forms.GroupBox();
			this.panel1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown9)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar2)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar3)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown6)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown7)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown5)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown3)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown8)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown4)).BeginInit();
			this.SuspendLayout();
			// 
			// checkBox2
			// 
			this.checkBox2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.checkBox2.Location = new System.Drawing.Point(24, 552);
			this.checkBox2.Name = "checkBox2";
			this.checkBox2.Size = new System.Drawing.Size(144, 24);
			this.checkBox2.TabIndex = 40;
			this.checkBox2.Text = "Square";
			this.checkBox2.Click += new System.EventHandler(this.checkBox2_Click);
			// 
			// panel1
			// 
			this.panel1.AutoScroll = true;
			this.panel1.BackColor = System.Drawing.SystemColors.Control;
			this.panel1.Controls.Add(this.numericUpDown9);
			this.panel1.Controls.Add(this.label13);
			this.panel1.Controls.Add(this.checkBox2);
			this.panel1.Controls.Add(this.trackBar3);
			this.panel1.Controls.Add(this.label3);
			this.panel1.Controls.Add(this.label11);
			this.panel1.Controls.Add(this.trackBar2);
			this.panel1.Controls.Add(this.trackBar1);
			this.panel1.Controls.Add(this.listBox1);
			this.panel1.Controls.Add(this.groupBox4);
			this.panel1.Controls.Add(this.label12);
			this.panel1.Controls.Add(this.numericUpDown8);
			this.panel1.Controls.Add(this.label10);
			this.panel1.Controls.Add(this.numericUpDown7);
			this.panel1.Controls.Add(this.label9);
			this.panel1.Controls.Add(this.numericUpDown6);
			this.panel1.Controls.Add(this.button3);
			this.panel1.Controls.Add(this.label8);
			this.panel1.Controls.Add(this.checkBox1);
			this.panel1.Controls.Add(this.label7);
			this.panel1.Controls.Add(this.numericUpDown5);
			this.panel1.Controls.Add(this.label6);
			this.panel1.Controls.Add(this.numericUpDown4);
			this.panel1.Controls.Add(this.label5);
			this.panel1.Controls.Add(this.numericUpDown3);
			this.panel1.Controls.Add(this.numericUpDown2);
			this.panel1.Controls.Add(this.numericUpDown1);
			this.panel1.Controls.Add(this.label1);
			this.panel1.Controls.Add(this.button2);
			this.panel1.Controls.Add(this.button1);
			this.panel1.Controls.Add(this.pictureBox1);
			this.panel1.Controls.Add(this.groupBox2);
			this.panel1.Controls.Add(this.label2);
			this.panel1.Controls.Add(this.groupBox1);
			this.panel1.Controls.Add(this.label4);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Right;
			this.panel1.Location = new System.Drawing.Point(512, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(184, 617);
			this.panel1.TabIndex = 1;
			// 
			// listBox1
			// 
			this.listBox1.BorderStyle = System.Windows.Forms.BorderStyle.None;
			this.listBox1.Location = new System.Drawing.Point(24, 264);
			this.listBox1.Name = "listBox1";
			this.listBox1.Size = new System.Drawing.Size(144, 91);
			this.listBox1.TabIndex = 34;
			this.listBox1.SelectedIndexChanged += new System.EventHandler(this.listBox1_SelectedIndexChanged);
			// 
			// menuItem8
			// 
			this.menuItem8.Index = 6;
			this.menuItem8.Text = "Exit";
			this.menuItem8.Click += new System.EventHandler(this.menuItem8_Click);
			// 
			// menuItem9
			// 
			this.menuItem9.Index = 1;
			this.menuItem9.MdiList = true;
			this.menuItem9.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.menuItem10,
						this.menuItem11,
						this.menuItem12});
			this.menuItem9.Text = "Window";
			// 
			// saveFileDialog1
			// 
			this.saveFileDialog1.Filter = "Bitmap files|*.bmp|Jpeg files|*.jpg|Gif files|*.gif|Tiff files|*.tif|Png files|*." +
"png|All files|*.*";
			// 
			// menuItem5
			// 
			this.menuItem5.Enabled = false;
			this.menuItem5.Index = 4;
			this.menuItem5.Text = "Save As..";
			this.menuItem5.Click += new System.EventHandler(this.menuItem5_Click);
			// 
			// menuItem6
			// 
			this.menuItem6.Index = 2;
			this.menuItem6.Text = "-";
			// 
			// menuItem7
			// 
			this.menuItem7.Index = 5;
			this.menuItem7.Text = "-";
			// 
			// numericUpDown9
			// 
			this.numericUpDown9.DecimalPlaces = 3;
			this.numericUpDown9.Increment = new System.Decimal(new int[] {
						1,
						0,
						0,
						65536});
			this.numericUpDown9.Location = new System.Drawing.Point(64, 496);
			this.numericUpDown9.Maximum = new System.Decimal(new int[] {
						1,
						0,
						0,
						0});
			this.numericUpDown9.Name = "numericUpDown9";
			this.numericUpDown9.Size = new System.Drawing.Size(96, 21);
			this.numericUpDown9.TabIndex = 42;
			this.numericUpDown9.ValueChanged += new System.EventHandler(this.numericUpDown9_ValueChanged);
			// 
			// menuItem1
			// 
			this.menuItem1.Index = 0;
			this.menuItem1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.menuItem2,
						this.menuItem3,
						this.menuItem6,
						this.menuItem4,
						this.menuItem5,
						this.menuItem7,
						this.menuItem8});
			this.menuItem1.Text = "File";
			this.menuItem1.Popup += new System.EventHandler(this.menuItem1_Popup);
			// 
			// menuItem2
			// 
			this.menuItem2.Index = 0;
			this.menuItem2.Text = "New...";
			this.menuItem2.Click += new System.EventHandler(this.menuItem2_Click);
			// 
			// menuItem3
			// 
			this.menuItem3.Index = 1;
			this.menuItem3.Text = "Open...";
			this.menuItem3.Click += new System.EventHandler(this.menuItem3_Click);
			// 
			// trackBar1
			// 
			this.trackBar1.AutoSize = false;
			this.trackBar1.LargeChange = 16;
			this.trackBar1.Location = new System.Drawing.Point(104, 448);
			this.trackBar1.Maximum = 255;
			this.trackBar1.Name = "trackBar1";
			this.trackBar1.RightToLeft = System.Windows.Forms.RightToLeft.No;
			this.trackBar1.Size = new System.Drawing.Size(64, 24);
			this.trackBar1.SmallChange = 16;
			this.trackBar1.TabIndex = 35;
			this.trackBar1.TickFrequency = 16;
			this.trackBar1.TickStyle = System.Windows.Forms.TickStyle.None;
			this.trackBar1.Value = 16;
			this.trackBar1.ValueChanged += new System.EventHandler(this.trackBar2_ValueChanged);
			// 
			// trackBar2
			// 
			this.trackBar2.AutoSize = false;
			this.trackBar2.LargeChange = 16;
			this.trackBar2.Location = new System.Drawing.Point(104, 472);
			this.trackBar2.Maximum = 256;
			this.trackBar2.Minimum = 1;
			this.trackBar2.Name = "trackBar2";
			this.trackBar2.RightToLeft = System.Windows.Forms.RightToLeft.No;
			this.trackBar2.Size = new System.Drawing.Size(64, 24);
			this.trackBar2.SmallChange = 16;
			this.trackBar2.TabIndex = 36;
			this.trackBar2.TickFrequency = 16;
			this.trackBar2.TickStyle = System.Windows.Forms.TickStyle.None;
			this.trackBar2.Value = 48;
			this.trackBar2.ValueChanged += new System.EventHandler(this.trackBar2_ValueChanged);
			// 
			// trackBar3
			// 
			this.trackBar3.AutoSize = false;
			this.trackBar3.LargeChange = 1;
			this.trackBar3.Location = new System.Drawing.Point(56, 120);
			this.trackBar3.Maximum = 4;
			this.trackBar3.Minimum = -4;
			this.trackBar3.Name = "trackBar3";
			this.trackBar3.Size = new System.Drawing.Size(104, 24);
			this.trackBar3.TabIndex = 39;
			this.trackBar3.TickStyle = System.Windows.Forms.TickStyle.None;
			this.trackBar3.ValueChanged += new System.EventHandler(this.trackBar3_ValueChanged);
			// 
			// numericUpDown6
			// 
			this.numericUpDown6.Increment = new System.Decimal(new int[] {
						16,
						0,
						0,
						0});
			this.numericUpDown6.Location = new System.Drawing.Point(48, 64);
			this.numericUpDown6.Maximum = new System.Decimal(new int[] {
						255,
						0,
						0,
						0});
			this.numericUpDown6.Name = "numericUpDown6";
			this.numericUpDown6.Size = new System.Drawing.Size(40, 21);
			this.numericUpDown6.TabIndex = 23;
			this.numericUpDown6.Value = new System.Decimal(new int[] {
						255,
						0,
						0,
						0});
			// 
			// openFileDialog1
			// 
			this.openFileDialog1.Filter = "Image files|*.bmp;*.jpg;*.gif;*.tif;*.png|All files|*.*";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(8, 152);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(40, 16);
			this.label2.TabIndex = 2;
			this.label2.Text = "Stroke";
			this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label11
			// 
			this.label11.Location = new System.Drawing.Point(24, 248);
			this.label11.Name = "label11";
			this.label11.Size = new System.Drawing.Size(144, 16);
			this.label11.TabIndex = 37;
			this.label11.Text = "Shape List:";
			// 
			// label10
			// 
			this.label10.Location = new System.Drawing.Point(16, 88);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(40, 24);
			this.label10.TabIndex = 28;
			this.label10.Text = "Blue:";
			this.label10.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label13
			// 
			this.label13.Location = new System.Drawing.Point(24, 496);
			this.label13.Name = "label13";
			this.label13.Size = new System.Drawing.Size(32, 24);
			this.label13.TabIndex = 41;
			this.label13.Text = "Soft:";
			this.label13.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label12
			// 
			this.label12.Location = new System.Drawing.Point(8, 16);
			this.label12.Name = "label12";
			this.label12.Size = new System.Drawing.Size(40, 16);
			this.label12.TabIndex = 31;
			this.label12.Text = "Image";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(16, 64);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(40, 24);
			this.label8.TabIndex = 24;
			this.label8.Text = "Green:";
			this.label8.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(16, 40);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(40, 24);
			this.label9.TabIndex = 26;
			this.label9.Text = "Red:";
			this.label9.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(24, 448);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(40, 24);
			this.label4.TabIndex = 14;
			this.label4.Text = "Alpha:";
			this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(96, 176);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(16, 24);
			this.label5.TabIndex = 16;
			this.label5.Text = "A:";
			this.label5.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(96, 200);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(16, 24);
			this.label6.TabIndex = 18;
			this.label6.Text = "B:";
			this.label6.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(96, 224);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(16, 24);
			this.label7.TabIndex = 20;
			this.label7.Text = "C:";
			this.label7.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(24, 472);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(40, 23);
			this.label1.TabIndex = 7;
			this.label1.Text = "Width:";
			this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// numericUpDown7
			// 
			this.numericUpDown7.Increment = new System.Decimal(new int[] {
						16,
						0,
						0,
						0});
			this.numericUpDown7.Location = new System.Drawing.Point(48, 40);
			this.numericUpDown7.Maximum = new System.Decimal(new int[] {
						255,
						0,
						0,
						0});
			this.numericUpDown7.Name = "numericUpDown7";
			this.numericUpDown7.Size = new System.Drawing.Size(40, 21);
			this.numericUpDown7.TabIndex = 25;
			this.numericUpDown7.Value = new System.Decimal(new int[] {
						255,
						0,
						0,
						0});
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(16, 120);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(40, 24);
			this.label3.TabIndex = 38;
			this.label3.Text = "Zoom:";
			this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
			// 
			// numericUpDown5
			// 
			this.numericUpDown5.DecimalPlaces = 3;
			this.numericUpDown5.Increment = new System.Decimal(new int[] {
						1,
						0,
						0,
						65536});
			this.numericUpDown5.Location = new System.Drawing.Point(112, 224);
			this.numericUpDown5.Maximum = new System.Decimal(new int[] {
						10,
						0,
						0,
						0});
			this.numericUpDown5.Name = "numericUpDown5";
			this.numericUpDown5.Size = new System.Drawing.Size(56, 21);
			this.numericUpDown5.TabIndex = 19;
			this.numericUpDown5.ValueChanged += new System.EventHandler(this.numericUpDown3_ValueChanged);
			// 
			// numericUpDown2
			// 
			this.numericUpDown2.Increment = new System.Decimal(new int[] {
						16,
						0,
						0,
						0});
			this.numericUpDown2.Location = new System.Drawing.Point(64, 448);
			this.numericUpDown2.Maximum = new System.Decimal(new int[] {
						255,
						0,
						0,
						0});
			this.numericUpDown2.Name = "numericUpDown2";
			this.numericUpDown2.Size = new System.Drawing.Size(40, 21);
			this.numericUpDown2.TabIndex = 13;
			this.numericUpDown2.Value = new System.Decimal(new int[] {
						16,
						0,
						0,
						0});
			this.numericUpDown2.ValueChanged += new System.EventHandler(this.numericUpDown2_ValueChanged);
			// 
			// numericUpDown3
			// 
			this.numericUpDown3.DecimalPlaces = 3;
			this.numericUpDown3.Increment = new System.Decimal(new int[] {
						1,
						0,
						0,
						65536});
			this.numericUpDown3.Location = new System.Drawing.Point(112, 176);
			this.numericUpDown3.Maximum = new System.Decimal(new int[] {
						10,
						0,
						0,
						0});
			this.numericUpDown3.Name = "numericUpDown3";
			this.numericUpDown3.Size = new System.Drawing.Size(56, 21);
			this.numericUpDown3.TabIndex = 15;
			this.numericUpDown3.ValueChanged += new System.EventHandler(this.numericUpDown3_ValueChanged);
			// 
			// numericUpDown1
			// 
			this.numericUpDown1.Increment = new System.Decimal(new int[] {
						16,
						0,
						0,
						0});
			this.numericUpDown1.Location = new System.Drawing.Point(64, 472);
			this.numericUpDown1.Maximum = new System.Decimal(new int[] {
						256,
						0,
						0,
						0});
			this.numericUpDown1.Minimum = new System.Decimal(new int[] {
						1,
						0,
						0,
						0});
			this.numericUpDown1.Name = "numericUpDown1";
			this.numericUpDown1.Size = new System.Drawing.Size(40, 21);
			this.numericUpDown1.TabIndex = 8;
			this.numericUpDown1.Value = new System.Decimal(new int[] {
						48,
						0,
						0,
						0});
			this.numericUpDown1.ValueChanged += new System.EventHandler(this.numericUpDown2_ValueChanged);
			// 
			// checkBox1
			// 
			this.checkBox1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.checkBox1.Location = new System.Drawing.Point(24, 528);
			this.checkBox1.Name = "checkBox1";
			this.checkBox1.Size = new System.Drawing.Size(144, 24);
			this.checkBox1.TabIndex = 21;
			this.checkBox1.Text = "Flat";
			this.checkBox1.Click += new System.EventHandler(this.checkBox2_Click);
			// 
			// numericUpDown8
			// 
			this.numericUpDown8.Increment = new System.Decimal(new int[] {
						16,
						0,
						0,
						0});
			this.numericUpDown8.Location = new System.Drawing.Point(48, 88);
			this.numericUpDown8.Maximum = new System.Decimal(new int[] {
						255,
						0,
						0,
						0});
			this.numericUpDown8.Name = "numericUpDown8";
			this.numericUpDown8.Size = new System.Drawing.Size(40, 21);
			this.numericUpDown8.TabIndex = 27;
			this.numericUpDown8.Value = new System.Decimal(new int[] {
						255,
						0,
						0,
						0});
			// 
			// mainMenu1
			// 
			this.mainMenu1.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.menuItem1,
						this.menuItem9,
						this.menuItem13});
			// 
			// numericUpDown4
			// 
			this.numericUpDown4.DecimalPlaces = 3;
			this.numericUpDown4.Increment = new System.Decimal(new int[] {
						1,
						0,
						0,
						65536});
			this.numericUpDown4.Location = new System.Drawing.Point(112, 200);
			this.numericUpDown4.Maximum = new System.Decimal(new int[] {
						10,
						0,
						0,
						0});
			this.numericUpDown4.Name = "numericUpDown4";
			this.numericUpDown4.Size = new System.Drawing.Size(56, 21);
			this.numericUpDown4.TabIndex = 17;
			this.numericUpDown4.Value = new System.Decimal(new int[] {
						1,
						0,
						0,
						0});
			this.numericUpDown4.ValueChanged += new System.EventHandler(this.numericUpDown3_ValueChanged);
			// 
			// menuItem4
			// 
			this.menuItem4.Enabled = false;
			this.menuItem4.Index = 3;
			this.menuItem4.Text = "Save";
			this.menuItem4.Click += new System.EventHandler(this.menuItem4_Click);
			// 
			// pictureBox1
			// 
			this.pictureBox1.BackColor = System.Drawing.Color.White;
			this.pictureBox1.Location = new System.Drawing.Point(24, 176);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(64, 64);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 4;
			this.pictureBox1.TabStop = false;
			// 
			// button1
			// 
			this.button1.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button1.Location = new System.Drawing.Point(24, 368);
			this.button1.Name = "button1";
			this.button1.Size = new System.Drawing.Size(144, 32);
			this.button1.TabIndex = 5;
			this.button1.Text = "Update Shapes";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// button2
			// 
			this.button2.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button2.Location = new System.Drawing.Point(24, 408);
			this.button2.Name = "button2";
			this.button2.Size = new System.Drawing.Size(144, 32);
			this.button2.TabIndex = 6;
			this.button2.Text = "Color...";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// button3
			// 
			this.button3.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.button3.Location = new System.Drawing.Point(96, 40);
			this.button3.Name = "button3";
			this.button3.Size = new System.Drawing.Size(64, 64);
			this.button3.TabIndex = 22;
			this.button3.Text = "Clear";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// groupBox1
			// 
			this.groupBox1.Location = new System.Drawing.Point(40, 16);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(128, 8);
			this.groupBox1.TabIndex = 1;
			this.groupBox1.TabStop = false;
			// 
			// menuItem11
			// 
			this.menuItem11.Index = 1;
			this.menuItem11.Text = "Tile Horizontal";
			this.menuItem11.Click += new System.EventHandler(this.menuItem11_Click);
			// 
			// menuItem10
			// 
			this.menuItem10.Index = 0;
			this.menuItem10.Text = "Cascade";
			this.menuItem10.Click += new System.EventHandler(this.menuItem10_Click);
			// 
			// menuItem13
			// 
			this.menuItem13.Index = 2;
			this.menuItem13.Text = "About...";
			this.menuItem13.Click += new System.EventHandler(this.menuItem13_Click);
			// 
			// menuItem12
			// 
			this.menuItem12.Index = 2;
			this.menuItem12.Text = "Tile Vertical";
			this.menuItem12.Click += new System.EventHandler(this.menuItem12_Click);
			// 
			// groupBox2
			// 
			this.groupBox2.Location = new System.Drawing.Point(48, 152);
			this.groupBox2.Name = "groupBox2";
			this.groupBox2.Size = new System.Drawing.Size(128, 8);
			this.groupBox2.TabIndex = 3;
			this.groupBox2.TabStop = false;
			// 
			// groupBox4
			// 
			this.groupBox4.Location = new System.Drawing.Point(8, 584);
			this.groupBox4.Name = "groupBox4";
			this.groupBox4.Size = new System.Drawing.Size(168, 8);
			this.groupBox4.TabIndex = 33;
			this.groupBox4.TabStop = false;
			// 
			// Form1
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 14);
			this.BackColor = System.Drawing.SystemColors.ControlDark;
			this.ClientSize = new System.Drawing.Size(696, 617);
			this.Controls.Add(this.panel1);
			this.IsMdiContainer = true;
			this.Menu = this.mainMenu1;
			this.Name = "Form1";
			this.Text = "Paint .NET";
			this.TransparencyKey = System.Drawing.Color.Red;
			this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
			this.Load += new System.EventHandler(this.Form1_Load);
			this.panel1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown9)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar2)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.trackBar3)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown6)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown7)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown5)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown3)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown8)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.numericUpDown4)).EndInit();
			this.ResumeLayout(false);
		}
		#endregion

		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main() 
		{
			Application.Run(new Form1());
		}

		private void menuItem2_Click(object sender, System.EventArgs e)
		{
			//New paint window
			Form3 form3=new Form3();
			if(form3.ShowDialog()==DialogResult.OK)
			{
				saveFileDialog1.FileName="";
				Form2 form2=new Form2("New"+(MdiChildren.Length+1).ToString(),(int)form3.NumericUpDown1.Value,(int)form3.NumericUpDown2.Value,form3.ColorDialog1.Color);
				form2.MdiParent=this;
				form2.Show();
			}
		}

		private void menuItem3_Click(object sender, System.EventArgs e)
		{
			//Open paint window from file
			if(openFileDialog1.ShowDialog()==DialogResult.OK)
			{
				saveFileDialog1.FileName=openFileDialog1.FileName;
				Form2 form2=new Form2(openFileDialog1.FileName);
				form2.MdiParent=this;
				form2.Show();
			}
		}

		private void SaveImage()
		{
			switch(saveFileDialog1.FilterIndex)
			{
				case 1:
					((Form2)ActiveMdiChild).Paintt.Bitmap.Save(saveFileDialog1.FileName,ImageFormat.Bmp);
					break;
				case 2:
					((Form2)ActiveMdiChild).Paintt.Bitmap.Save(saveFileDialog1.FileName,ImageFormat.Jpeg);
					break;
				case 3:
					((Form2)ActiveMdiChild).Paintt.Bitmap.Save(saveFileDialog1.FileName,ImageFormat.Gif);
					break;
				case 4:
					((Form2)ActiveMdiChild).Paintt.Bitmap.Save(saveFileDialog1.FileName,ImageFormat.Tiff);
					break;
				case 5:
					((Form2)ActiveMdiChild).Paintt.Bitmap.Save(saveFileDialog1.FileName,ImageFormat.Png);
					break;
				default:
					((Form2)ActiveMdiChild).Paintt.Bitmap.Save(saveFileDialog1.FileName);
					break;
			}
		}

		private void menuItem4_Click(object sender, System.EventArgs e)
		{
			if(saveFileDialog1.FileName=="")
			{
				if(saveFileDialog1.ShowDialog()==DialogResult.OK)
					SaveImage();
			}
			else
				SaveImage();
		}

		private void menuItem5_Click(object sender, System.EventArgs e)
		{
			if(saveFileDialog1.ShowDialog()==DialogResult.OK)
				SaveImage();
		}

		private void menuItem8_Click(object sender, System.EventArgs e)
		{
			Close();
		}

		private void menuItem10_Click(object sender, System.EventArgs e)
		{
			LayoutMdi(MdiLayout.Cascade);
		}

		private void menuItem11_Click(object sender, System.EventArgs e)
		{
			LayoutMdi(MdiLayout.TileHorizontal);
		}

		private void menuItem12_Click(object sender, System.EventArgs e)
		{
			LayoutMdi(MdiLayout.TileVertical);
		}

		private void menuItem1_Popup(object sender, System.EventArgs e)
		{
			//Turn On/Off save menu item
			if(MdiChildren.Length>0)
				menuItem4.Enabled=menuItem5.Enabled=true;
			else
				menuItem4.Enabled=menuItem5.Enabled=false;
		}

		private void UpdateStroke()
		{
			//Create stroke
			if(listBox1.SelectedIndex!=-1)
			{
				stroke=new Stroke(new Bitmap(Directory.GetCurrentDirectory()+"\\Shapes\\"+listBox1.SelectedItem),Color.FromArgb((int)numericUpDown2.Value,colorDialog1.Color),(float)numericUpDown3.Value,(float)numericUpDown4.Value,(float)numericUpDown5.Value,(float)numericUpDown9.Value,checkBox1.Checked,checkBox2.Checked);
				pictureBox1.Image=stroke.Shape;
			}
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			listBoxUpdate();
		}

		private void button2_Click(object sender, System.EventArgs e)
		{
			if(colorDialog1.ShowDialog()==DialogResult.OK)
				UpdateStroke();
		}

		private void button3_Click(object sender, System.EventArgs e)
		{
			if(ActiveMdiChild!=null)
			{
				((Form2)ActiveMdiChild).Paintt.Clear(Color.FromArgb((int)numericUpDown7.Value,(int)numericUpDown6.Value,(int)numericUpDown8.Value));
				((Form2)ActiveMdiChild).PictureBox1.Invalidate();
			}
		}

		private void listBoxUpdate()
		{
			//Put image (shapes) in list
			listBox1.Items.Clear();
			DirectoryInfo di=new DirectoryInfo(Directory.GetCurrentDirectory()+"\\Shapes\\");
			if(di.Exists)
			{
				FileInfo[] fi=di.GetFiles("*.bmp");
				for(int i=0;i<fi.Length;i++)
					listBox1.Items.Add(fi[i].Name);
				fi=di.GetFiles("*.jpg");
				for(int i=0;i<fi.Length;i++)
					listBox1.Items.Add(fi[i].Name);
				fi=di.GetFiles("*.gif");
				for(int i=0;i<fi.Length;i++)
					listBox1.Items.Add(fi[i].Name);
				fi=di.GetFiles("*.tif");
				for(int i=0;i<fi.Length;i++)
					listBox1.Items.Add(fi[i].Name);
				fi=di.GetFiles("*.png");
				for(int i=0;i<fi.Length;i++)
					listBox1.Items.Add(fi[i].Name);
				listBox1.Enabled=true;
			}
			else
			{
				listBox1.Items.Add("No \"Shapes\" Directory Found");
				listBox1.Enabled=false;
			}
		}

		private void Form1_Load(object sender, System.EventArgs e)
		{
			listBoxUpdate();
		}

		private void listBox1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			UpdateStroke();
		}

		private void trackBar2_ValueChanged(object sender, System.EventArgs e)
		{
			numericUpDown2.Value=trackBar1.Value;
			numericUpDown1.Value=trackBar2.Value;
			UpdateStroke();
		}

		private void numericUpDown2_ValueChanged(object sender, System.EventArgs e)
		{
			trackBar1.Value=(int)numericUpDown2.Value;
			trackBar2.Value=(int)numericUpDown1.Value;
			UpdateStroke();
		}

		private void trackBar3_ValueChanged(object sender, System.EventArgs e)
		{
			if(ActiveMdiChild!=null)
			{
				//Zoom image
				int scale=(int)Math.Pow(2,Math.Abs(trackBar3.Value));
				if(trackBar3.Value>0)
				{
					//Zoom in
					((Form2)ActiveMdiChild).PictureBox1.Width=((Form2)ActiveMdiChild).Paintt.Bitmap.Width*scale;
					((Form2)ActiveMdiChild).PictureBox1.Height=((Form2)ActiveMdiChild).Paintt.Bitmap.Height*scale;
					((Form2)ActiveMdiChild).PaintScale=1f/(float)scale;
				}
				else if(trackBar3.Value<0)
				{
					//Zoom out
					((Form2)ActiveMdiChild).PictureBox1.Width=((Form2)ActiveMdiChild).Paintt.Bitmap.Width/scale;
					((Form2)ActiveMdiChild).PictureBox1.Height=((Form2)ActiveMdiChild).Paintt.Bitmap.Height/scale;
					((Form2)ActiveMdiChild).PaintScale=(float)scale;
				}
				else
				{
					//Original
					((Form2)ActiveMdiChild).PictureBox1.Width=((Form2)ActiveMdiChild).Paintt.Bitmap.Width;
					((Form2)ActiveMdiChild).PictureBox1.Height=((Form2)ActiveMdiChild).Paintt.Bitmap.Height;
					((Form2)ActiveMdiChild).PaintScale=1f;
				}
			}
		}

		private void numericUpDown3_ValueChanged(object sender, System.EventArgs e)
		{
			UpdateStroke();
		}

		private void checkBox2_Click(object sender, System.EventArgs e)
		{
			UpdateStroke();
		}

		private void numericUpDown9_ValueChanged(object sender, System.EventArgs e)
		{
			UpdateStroke();
		}

		private void menuItem13_Click(object sender, System.EventArgs e)
		{
			// show credits
			MessageBox.Show(this,"Developed 2003 by Gustavo Arranhado","About...");
		}

		public Stroke Stroke
		{
			get 
			{
				if(stroke!=null)
					stroke.Width=(float)numericUpDown1.Value;
				return stroke;
			}
		}
	}
}
