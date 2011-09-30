/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 26/07/2004
 * Time: 19:56
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.

fieldE an electrostatic simulator
Copyright (C) 2004  Sebastien CELLES

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

 */

using System;

using System.Windows.Forms;	// graphical user interface

using System.IO; // filestream

// XML
using System.Xml;
using System.Xml.Serialization;

// file compression
using ICSharpCode.SharpZipLib;
using ICSharpCode.SharpZipLib.Checksums;
using ICSharpCode.SharpZipLib.Zip;
using ICSharpCode.SharpZipLib.GZip;

namespace fieldE
{
	/// <summary>
	/// Description of MainForm.	
	/// </summary>
	
	public class MainForm : System.Windows.Forms.Form
	{
		private System.Windows.Forms.MenuItem mnuImageSep;
		private System.Windows.Forms.PictureBox pictureBox;
		private System.Windows.Forms.MenuItem mnuTesting;
		private System.Windows.Forms.MenuItem mnuFileSep2;
		private System.Windows.Forms.MenuItem mnuImageClearFieldAndCharges;
		private System.Windows.Forms.SaveFileDialog saveFileDialog;
		private System.Windows.Forms.MenuItem mnuImageShowOnlyCharges;
		private System.Windows.Forms.MenuItem mnuFileSaveAs;
		private System.Windows.Forms.MenuItem mnuMode;
		private System.Windows.Forms.MenuItem mnuModeE;
		private System.Windows.Forms.MainMenu mainMenu;
		private System.Windows.Forms.MenuItem mnuFileOpen;
		private System.Windows.Forms.MenuItem mnuImageShowField;
		private System.Windows.Forms.MenuItem mnuHelp;
		private System.Windows.Forms.MenuItem mnuHelpAbout;
		private System.Windows.Forms.MenuItem mnuOptionsSep;
		private System.Windows.Forms.MenuItem mnuHelpHelp;
		private System.Windows.Forms.MenuItem mnuOptions;
		private System.Windows.Forms.MenuItem mnuModeB;
		private System.Windows.Forms.MenuItem mnuOptionsFieldAsGrains;
		private System.Windows.Forms.MenuItem mnuHelpSep;
		private System.Windows.Forms.StatusBar statusBar;
		private System.Windows.Forms.MenuItem mnuImageRefresh;
		private System.Windows.Forms.OpenFileDialog openFileDialog;
		private System.Windows.Forms.MenuItem mnuFileExit;
		private System.Windows.Forms.MenuItem mnuOptionsFieldAsVectors;
		private System.Windows.Forms.MenuItem mnuImageSep2;
		private System.Windows.Forms.MenuItem mnuFile;
		private System.Windows.Forms.MenuItem mnuImageClearField;
		private System.Windows.Forms.MenuItem mnuOptionsUseColors;
		private System.Windows.Forms.MenuItem mnuFileSep;
		private System.Windows.Forms.MenuItem mnuFileSave;
		private System.Windows.Forms.MenuItem mnuImageShowEquipotentials;
		private System.Windows.Forms.MenuItem mnuImage;
		public MainForm()
		{
			//
			// The InitializeComponent() call is required for Windows Forms designer support.
			//
			InitializeComponent();
			
			//
			// TODO: Add constructor code after the InitializeComponent() call.
			//
		}
		
		[STAThread]
		public static void Main(string[] args)
		{
			Application.Run(new MainForm());
		}
		
		#region Windows Forms Designer generated code
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent() {
			this.mnuImage = new System.Windows.Forms.MenuItem();
			this.mnuImageShowEquipotentials = new System.Windows.Forms.MenuItem();
			this.mnuFileSave = new System.Windows.Forms.MenuItem();
			this.mnuFileSep = new System.Windows.Forms.MenuItem();
			this.mnuOptionsUseColors = new System.Windows.Forms.MenuItem();
			this.mnuImageClearField = new System.Windows.Forms.MenuItem();
			this.mnuFile = new System.Windows.Forms.MenuItem();
			this.mnuImageSep2 = new System.Windows.Forms.MenuItem();
			this.mnuOptionsFieldAsVectors = new System.Windows.Forms.MenuItem();
			this.mnuFileExit = new System.Windows.Forms.MenuItem();
			this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
			this.mnuImageRefresh = new System.Windows.Forms.MenuItem();
			this.statusBar = new System.Windows.Forms.StatusBar();
			this.mnuHelpSep = new System.Windows.Forms.MenuItem();
			this.mnuOptionsFieldAsGrains = new System.Windows.Forms.MenuItem();
			this.mnuModeB = new System.Windows.Forms.MenuItem();
			this.mnuOptions = new System.Windows.Forms.MenuItem();
			this.mnuHelpHelp = new System.Windows.Forms.MenuItem();
			this.mnuOptionsSep = new System.Windows.Forms.MenuItem();
			this.mnuHelpAbout = new System.Windows.Forms.MenuItem();
			this.mnuHelp = new System.Windows.Forms.MenuItem();
			this.mnuImageShowField = new System.Windows.Forms.MenuItem();
			this.mnuFileOpen = new System.Windows.Forms.MenuItem();
			this.mainMenu = new System.Windows.Forms.MainMenu();
			this.mnuModeE = new System.Windows.Forms.MenuItem();
			this.mnuMode = new System.Windows.Forms.MenuItem();
			this.mnuFileSaveAs = new System.Windows.Forms.MenuItem();
			this.mnuImageShowOnlyCharges = new System.Windows.Forms.MenuItem();
			this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
			this.mnuImageClearFieldAndCharges = new System.Windows.Forms.MenuItem();
			this.mnuFileSep2 = new System.Windows.Forms.MenuItem();
			this.mnuTesting = new System.Windows.Forms.MenuItem();
			this.pictureBox = new System.Windows.Forms.PictureBox();
			this.mnuImageSep = new System.Windows.Forms.MenuItem();
			this.SuspendLayout();
			// 
			// mnuImage
			// 
			this.mnuImage.Index = 1;
			this.mnuImage.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.mnuImageShowField,
						this.mnuImageShowOnlyCharges,
						this.mnuImageShowEquipotentials,
						this.mnuImageSep,
						this.mnuImageClearFieldAndCharges,
						this.mnuImageClearField,
						this.mnuImageSep2,
						this.mnuImageRefresh});
			this.mnuImage.Text = "&Image";
			// 
			// mnuImageShowEquipotentials
			// 
			this.mnuImageShowEquipotentials.Index = 2;
			this.mnuImageShowEquipotentials.Text = "Show &Equipotentials...";
			// 
			// mnuFileSave
			// 
			this.mnuFileSave.Index = 2;
			this.mnuFileSave.Text = "&Save";
			// 
			// mnuFileSep
			// 
			this.mnuFileSep.Index = 1;
			this.mnuFileSep.Text = "-";
			// 
			// mnuOptionsUseColors
			// 
			this.mnuOptionsUseColors.Checked = true;
			this.mnuOptionsUseColors.Index = 3;
			this.mnuOptionsUseColors.Text = "Use &Colors";
			// 
			// mnuImageClearField
			// 
			this.mnuImageClearField.Index = 5;
			this.mnuImageClearField.Text = "Clear F&ield";
			// 
			// mnuFile
			// 
			this.mnuFile.Index = 0;
			this.mnuFile.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.mnuFileOpen,
						this.mnuFileSep,
						this.mnuFileSave,
						this.mnuFileSaveAs,
						this.mnuFileSep2,
						this.mnuFileExit});
			this.mnuFile.Text = "&File";
			// 
			// mnuImageSep2
			// 
			this.mnuImageSep2.Index = 6;
			this.mnuImageSep2.Text = "-";
			// 
			// mnuOptionsFieldAsVectors
			// 
			this.mnuOptionsFieldAsVectors.Index = 0;
			this.mnuOptionsFieldAsVectors.Text = "Field as &Vectors";
			// 
			// mnuFileExit
			// 
			this.mnuFileExit.Index = 5;
			this.mnuFileExit.Text = "E&xit";
			// 
			// mnuImageRefresh
			// 
			this.mnuImageRefresh.Index = 7;
			this.mnuImageRefresh.Text = "&Refresh";
			// 
			// statusBar
			// 
			this.statusBar.Location = new System.Drawing.Point(0, 295);
			this.statusBar.Name = "statusBar";
			this.statusBar.Size = new System.Drawing.Size(480, 22);
			this.statusBar.TabIndex = 1;
			this.statusBar.Text = "Loading...";
			// 
			// mnuHelpSep
			// 
			this.mnuHelpSep.Index = 1;
			this.mnuHelpSep.Text = "-";
			// 
			// mnuOptionsFieldAsGrains
			// 
			this.mnuOptionsFieldAsGrains.Checked = true;
			this.mnuOptionsFieldAsGrains.Index = 1;
			this.mnuOptionsFieldAsGrains.Text = "Field as &Grains";
			// 
			// mnuModeB
			// 
			this.mnuModeB.Index = 1;
			this.mnuModeB.Text = "&B";
			// 
			// mnuOptions
			// 
			this.mnuOptions.Index = 2;
			this.mnuOptions.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.mnuOptionsFieldAsVectors,
						this.mnuOptionsFieldAsGrains,
						this.mnuOptionsSep,
						this.mnuOptionsUseColors});
			this.mnuOptions.Text = "&Options";
			// 
			// mnuHelpHelp
			// 
			this.mnuHelpHelp.Index = 0;
			this.mnuHelpHelp.Text = "&Help...";
			// 
			// mnuOptionsSep
			// 
			this.mnuOptionsSep.Index = 2;
			this.mnuOptionsSep.Text = "-";
			// 
			// mnuHelpAbout
			// 
			this.mnuHelpAbout.Index = 2;
			this.mnuHelpAbout.Text = "&About...";
			// 
			// mnuHelp
			// 
			this.mnuHelp.Index = 3;
			this.mnuHelp.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.mnuHelpHelp,
						this.mnuHelpSep,
						this.mnuHelpAbout});
			this.mnuHelp.Text = "&?";
			// 
			// mnuImageShowField
			// 
			this.mnuImageShowField.Checked = true;
			this.mnuImageShowField.Index = 0;
			this.mnuImageShowField.Text = "Show &Field...";
			// 
			// mnuFileOpen
			// 
			this.mnuFileOpen.Index = 0;
			this.mnuFileOpen.Text = "&Open...";
			// 
			// mainMenu
			// 
			this.mainMenu.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.mnuFile,
						this.mnuImage,
						this.mnuOptions,
						this.mnuHelp,
						this.mnuTesting,
						this.mnuMode});
			// 
			// mnuModeE
			// 
			this.mnuModeE.Checked = true;
			this.mnuModeE.Index = 0;
			this.mnuModeE.Text = "&E";
			// 
			// mnuMode
			// 
			this.mnuMode.Index = 5;
			this.mnuMode.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] {
						this.mnuModeE,
						this.mnuModeB});
			this.mnuMode.Text = "&Mode";
			// 
			// mnuFileSaveAs
			// 
			this.mnuFileSaveAs.Index = 3;
			this.mnuFileSaveAs.Text = "Save &As...";
			// 
			// mnuImageShowOnlyCharges
			// 
			this.mnuImageShowOnlyCharges.Index = 1;
			this.mnuImageShowOnlyCharges.Text = "Show &Only Charges";
			// 
			// mnuImageClearFieldAndCharges
			// 
			this.mnuImageClearFieldAndCharges.Index = 4;
			this.mnuImageClearFieldAndCharges.Text = "&Clear Field and Charges";
			// 
			// mnuFileSep2
			// 
			this.mnuFileSep2.Index = 4;
			this.mnuFileSep2.Text = "-";
			// 
			// mnuTesting
			// 
			this.mnuTesting.Index = 4;
			this.mnuTesting.Text = "&Testing";
			this.mnuTesting.Visible = false;
			// 
			// pictureBox
			// 
			this.pictureBox.BackColor = System.Drawing.Color.Black;
			this.pictureBox.Location = new System.Drawing.Point(0, 0);
			this.pictureBox.Name = "pictureBox";
			this.pictureBox.Size = new System.Drawing.Size(168, 112);
			this.pictureBox.TabIndex = 0;
			this.pictureBox.TabStop = false;
			// 
			// mnuImageSep
			// 
			this.mnuImageSep.Index = 3;
			this.mnuImageSep.Text = "-";
			// 
			// MainForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			this.ClientSize = new System.Drawing.Size(480, 317);
			this.Controls.Add(this.statusBar);
			this.Controls.Add(this.pictureBox);
			this.Menu = this.mainMenu;
			this.Name = "MainForm";
			this.Load += new System.EventHandler(this.MainFormLoad);
			this.ResumeLayout(false);
		}
		#endregion
		
		// MainForm Events
		
		void MainFormLoad(object sender, System.EventArgs e)
		{
			//Console.WriteLine("MainFormLoad");
			
			this.Text = "fieldEB... an electrostatic and magnetostatic simulator under GNU General Public License by S. Celles (c) 2005";
			
			// Form Events
			// ----------
			
			// Form resizing
			this.Resize += new System.EventHandler(this.MainForm_Resize);
				// Lauching Resizing (-> resize picturebox)
				this.OnResize(e);
				//this.MainForm_Resize(sender,e);

			// Form PaintEvent
				this.Paint += new System.Windows.Forms.PaintEventHandler(this.MainForm_Paint);
			
			this.Activated += new System.EventHandler(MainForm_Activated);
			this.Move += new System.EventHandler(MainForm_Move);
			this.MenuComplete += new System.EventHandler(MainForm_MenuComplete);
			
			// PictureBox Event
			//this.pictureBox.Paint += new System.Windows.Forms.PaintEventHandler(this.pictureBox_Paint);
			
			this.pictureBox.MouseUp += new System.Windows.Forms.MouseEventHandler(this.pictureBox_MouseUp);
			this.pictureBox.MouseDown += new System.Windows.Forms.MouseEventHandler(this.pictureBox_MouseDown);
			this.pictureBox.MouseMove += new System.Windows.Forms.MouseEventHandler(this.pictureBox_MouseMove);
			
			// mnu Event (link from mnu click event to functions)
			
			// -> File
			this.mnuFileOpen.Click += new System.EventHandler(this.mnuFileOpen_Click);
			// -
			this.mnuFileSave.Click += new System.EventHandler(this.mnuFileSave_Click);
			this.mnuFileSaveAs.Click += new System.EventHandler(this.mnuFileSaveAs_Click);
			// -
			this.mnuFileExit.Click += new System.EventHandler(this.mnuFileExit_Click);
			
			// -> Image
			this.mnuImageShowField.Click += new System.EventHandler(this.mnuImageShowField_Click);
			this.mnuImageShowOnlyCharges.Click += new System.EventHandler(this.mnuImageShowFieldLines_Click);
			this.mnuImageShowEquipotentials.Click += new System.EventHandler(this.mnuImageShowEquipotentials_Click);
			// -
			this.mnuImageClearFieldAndCharges.Click += new System.EventHandler(this.mnuImageClearFieldAndCharges_Click);
			this.mnuImageClearField.Click += new System.EventHandler(this.mnuImageClearField_Click);
			// -
			this.mnuImageRefresh.Click += new System.EventHandler(this.mnuImageRefresh_Click);			
			
			// -> Options
			this.mnuOptionsFieldAsVectors.Click += new System.EventHandler(this.mnuOptionsFieldAsVectors_Click);
			this.mnuOptionsFieldAsGrains.Click += new System.EventHandler(this.mnuOptionsFieldAsGrains_Click);
			// -
			this.mnuOptionsUseColors.Click += new System.EventHandler(this.mnuOptionsUseColors_Click);
			
			// -> Help
			this.mnuHelpHelp.Click += new System.EventHandler(this.mnuHelpHelp_Click);
			// -
			this.mnuHelpAbout.Click += new System.EventHandler(this.mnuHelpAbout_Click);
			
			
			// -> Testing
			this.mnuTesting.Click += new System.EventHandler(this.mnuTesting_Click);
			
			// ->Mode
			this.mnuModeE.Click += new System.EventHandler(this.mnuModeE_Click);
			this.mnuModeB.Click += new System.EventHandler(this.mnuModeB_Click);
						
			//this.pictureBox.BackColor = System.Drawing.Color.Black;
		}

		void MainForm_MenuComplete(object sender, System.EventArgs e)
		{
			Draw();
		}
		
		void MainForm_Move(object sender, System.EventArgs e)
		{
			Draw();
		}
		
		void MainForm_Activated(object sender, System.EventArgs e)
		{
			Draw();
		}
		
		void MainForm_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
		{
			// Should use MainForm_Activate & Resize
			//Console.WriteLine("MainForm_Paint");
			//Draw();
		}
		
		void MainForm_Resize(object sender, System.EventArgs e)
		{
			this.pictureBox.Width = this.Width;
			this.pictureBox.Height = this.Height;
			
			Draw();
		}
		
		void pictureBox_Paint(object sender, System.Windows.Forms.PaintEventArgs e)
		{
			//Draw_Test();	
		}
		
		bool Is_near_from_charge(float X, float Y)
		{
			bool near = false;
			foreach (Physic.Charge chg in alCharges.Charge)
			{
				if (chg.get_position().distance(X,Y) < chg.get_radius() )
				{
					near = true;
					// TO_DO : quit foreach could be quicker
				}	
			}
			
			return near;
		}
		
		int Get_Nearest_Charge_In_Range(float X, float Y)
		{
			// action = point to nearest charge
			Physic.Charge STDchg = new Physic.Charge(0,0,0);
			float d = 2* STDchg.get_radius();
			int IndexAction = 0;
			bool bAction = false;
			
			for (int i=0;i<alCharges.Charge.Count;i++)
			{
				Physic.Charge chg = (Physic.Charge) alCharges.Charge[i];
				if ( chg.get_position().distance(X,Y) < chg.get_radius()
				    && chg.get_position().distance(X,Y)<=d )
				{
					d = chg.get_position().distance(X,Y);
					IndexAction = i;
					bAction = true;
				}	
			}
			
			if ( bAction )
			{
				return IndexAction;
				//alCharges.Charge.RemoveAt(IndexAction);
				//this.Draw();
			}
			else
			{
				return -1;
			}
		}
		
		void Remove_Nearest_Charge_In_Range(float X, float Y)
		{
			// action = remove charge
			int IndexAction = Get_Nearest_Charge_In_Range(X, Y);
			if ( IndexAction != -1 )
			{
				alCharges.Charge.RemoveAt(IndexAction);
				this.Draw();
			}			
		}
		
		void Move_Charge(float X, float Y)
		{
			foreach ( Physic.Charge chg in alCharges.Charge )
			{
				if ( chg.get_movable() )
				{
					chg.get_position().set_x(X);
					chg.get_position().set_y(Y);
					chg.get_position().set_z(0);
				}
			}
		}
		
		void pictureBox_MouseMove(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if ( Is_near_from_charge(e.X, e.Y) )
			{
				this.statusBar.Text="Click on the left button and move mouse to move this charge or click on the right button to remove it";
				//	TO_DO Change pointer when pointer is near from a charge
			}
			else
			{
				this.statusBar.Text="Ready...";
				//	TO_DO Change pointer when pointer is NOT near from a charge	
			}
			
			if ( e.Button == MouseButtons.Left )
			{
				Move_Charge(e.X, e.Y);
				this.Draw();
			}

		}
		
		void pictureBox_MouseUp(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			if (e.Button == MouseButtons.Left)
			{
				foreach ( Physic.Charge chg in alCharges.Charge )
				{
					chg.unset_movable();
				}
			}
		}
		
		void Add_New_Charge(float X, float Y)
		{
			// No InputBox in C#  (unfortunately)
			frmAddCharge frm = new frmAddCharge();
			frm.ShowDialog(this);
			
			// ....
			if (frm.Ok && !frm.Cancel)
			{
				try
				{
					float charge = Convert.ToSingle(frm.Input);
					alCharges.Charge.Add(new Physic.Charge(charge,X,Y));
				}
      			catch (Exception e) 
      			{
         			Console.WriteLine(e);
      			}

			}
			
			this.Draw();	
		}
		
		void pictureBox_MouseDown(object sender, System.Windows.Forms.MouseEventArgs e)
		{
			// On Mouse Left click on pictureBox
				// New electrical charge
			// On Mouse Right click on pictureBox
				// Remove a charge	
			
			if (e.Button == MouseButtons.Left)
			{
				// Add a charge (or move a charge)
				// title : New electrical charge
				// Enter electrical charge :
				// (Value between -100 000 and +100 000)
				
				if ( !Is_near_from_charge(e.X, e.Y) )
				{
					// Add a charge
					// ============
					Add_New_Charge(e.X, e.Y);
				}				
				else
				{
					// Move a charge
					// =============
					int IndexAction = Get_Nearest_Charge_In_Range(e.X, e.Y);
					if ( IndexAction != -1 )
					{
						Physic.Charge chg = (Physic.Charge) alCharges.Charge[IndexAction];
						chg.set_movable(); // mark the charge you want to move
					}
				}
				
			}

			
			if (e.Button == MouseButtons.Right)
			{
				//Console.WriteLine("_Right");
				Remove_Nearest_Charge_In_Range(e.X, e.Y);
			}
			
			
			// this.TO_DO();
		}
		
		
		// Menu functions
		
		void Save(string FILENAME_WITHOUT_EXTENSION,string FILENAME_EXTENSION)
		{
			string FILENAME = FILENAME_WITHOUT_EXTENSION + "." + FILENAME_EXTENSION;	
			Save(FILENAME);
		}
		
		void Save(string FILENAME)
		{			
			System.Collections.ArrayList alFiles = new System.Collections.ArrayList();
			
/*
			// manifest.xml
			DefaultNamespace.Manifest myManifest;
			
			DefaultNamespace.Content myContent;
			
			myContent.file_object = myGrid;
			myContent.file_xml = "grid___2.xml";
			myManifest.contents.Content.Add(myContent);
			
			myContent.file_object = alCharges;
			myContent.file_xml = "charges___2.xml";
			myManifest.contents.Content.Add(myContent);
			
			myContent.file_object = alDatas;
			myContent.file_xml = "datas___2.xml";
			myManifest.contents.Content.Add(myContent);
*/
			
			string filename;
			
			// mimetype
			filename = "mimetype";
			string mimetype = "application/x-fielde";
			StreamWriter swFile = new StreamWriter(filename);
			swFile.WriteLine(mimetype);
			swFile.Close();
			alFiles.Add(filename);
			
			// Serialization of grid (grid.xml)
			filename = "grid.xml";
			System.IO.FileStream FSgrid = System.IO.File.OpenWrite(filename);
			System.Xml.Serialization.XmlSerializer XMLSgrid = new System.Xml.Serialization.XmlSerializer( typeof( Physic.Grid ));
			XMLSgrid.Serialize(FSgrid,myGrid);
			FSgrid.Close();
			alFiles.Add(filename);
			
			// Serialization of array list of charges (charges.xml)
			filename = "charges.xml";
			System.IO.FileStream FScharges = System.IO.File.OpenWrite(filename);
			System.Xml.Serialization.XmlSerializer XMLScharges = new System.Xml.Serialization.XmlSerializer( typeof( Physic.Charges ));
			XMLScharges.Serialize(FScharges,alCharges);
			FScharges.Close();
			alFiles.Add(filename);

			// Serialization of datas (datas.xml)
			filename = "datas.xml";
			System.IO.FileStream FSdatas = System.IO.File.OpenWrite(filename);
			System.Xml.Serialization.XmlSerializer XMLSdatas = new System.Xml.Serialization.XmlSerializer( typeof( DefaultNamespace.Datas ));
			XMLSdatas.Serialize(FSdatas,alDatas);
			FSdatas.Close();
			alFiles.Add(filename);
			
			// Serialization of application (app.xml)
			//filename = "app.xml";
			//System.IO.FileStream FSapp = System.IO.File.OpenWrite(filename);
			//System.Xml.Serialization.XmlSerializer XMLSapp = new System.Xml.Serialization.XmlSerializer( typeof( System.Windows.Forms.Application ));
			//XMLSdatas.Serialize(FSapp,System.Windows.Forms.Application.);
			//FSdatas.Close();
			//alFiles.Add(filename);
			
			// TO DO
			// use temporary files
			// manifest (list of files)
			// app (productname, productversion...)
			
			// Zipping
			// use #ziplib (ICSharpCode.SharpZipLib)
			// Algorithm : ZIP
			// to compress XML files
			
			Crc32 crc = new Crc32();
			ZipOutputStream s = new ZipOutputStream(File.Create(FILENAME));
			s.SetLevel(6); // 0 - store only to 9 - means best compression
			
			foreach(string file in alFiles)
			{
				FileStream fs;
				fs = File.OpenRead(file);
				
				byte[] buffer = new byte[fs.Length];
				fs.Read(buffer, 0, buffer.Length);
				ZipEntry entry = new ZipEntry(file);
				
				entry.DateTime = DateTime.Now;
				
				entry.Size = fs.Length;
				fs.Close();
				
				crc.Reset();
				crc.Update(buffer);
				
				entry.Crc  = crc.Value;
				
				s.PutNextEntry(entry);
				
				s.Write(buffer, 0, buffer.Length);
			}		
			
			s.Finish();
			s.Close();
			
			// Delete temp files
			/*
			foreach(string file in alFiles)
			{				
				System.IO.File.Delete(file);
			}
			*/

			
		}
		
		void mnuFileOpen_Click(object sender, System.EventArgs e)
		{
			TO_DO();
			
			this.openFileDialog.ShowDialog();
		}

		void mnuFileSave_Click(object sender, System.EventArgs e)
		{
			TO_DO();
			
			//if this.alCharges.changed
			{
				
			}
		}

		void mnuFileSaveAs_Click(object sender, System.EventArgs e)
		{
			this.saveFileDialog.DefaultExt = "fde";
			this.saveFileDialog.AddExtension  = true;
			this.saveFileDialog.Filter = "fieldE files (*.fde)|*.fde|All files (*.*)|*.*";
			this.saveFileDialog.CheckPathExists = true;
			//this.saveFileDialog1.InitialDirectory = "."; // app directory (by default it's last directory)
			
			this.saveFileDialog.ShowDialog();
			
			if (this.saveFileDialog.FileName!="" && this.saveFileDialog.FileName!=null)
			{
				//Console.WriteLine(this.saveFileDialog1.FileName);
				//Save(this.saveFileDialog1.FileName,this.saveFileDialog1.DefaultExt);
				//Save(this.saveFileDialog1.FileName);
			}
			/*
			 else
			{
				Console.WriteLine("Abort saving...");
			}
			*/
			
		}

		void mnuTesting_Click(object sender, System.EventArgs e)
		{
			this.Save("file","fde");
		}
		
		void mnuFileExit_Click(object sender, System.EventArgs e)
		{
			System.Windows.Forms.Application.Exit();
			//this.Close();
		}
		
		void mnuImageShowField_Click(object sender, System.EventArgs e)
		{
			this.mnuImageShowField.Checked = true;
			this.mnuImageShowOnlyCharges.Checked = false;
			this.mnuImageShowEquipotentials.Checked = false;
			
			this.Draw();			
		}
		
		void mnuImageShowFieldLines_Click(object sender, System.EventArgs e)
		{
			this.mnuImageShowField.Checked = false;
			this.mnuImageShowOnlyCharges.Checked = true;
			this.mnuImageShowEquipotentials.Checked = false;
			
			this.Draw();			
		}
		
		void mnuImageShowEquipotentials_Click(object sender, System.EventArgs e)
		{
			this.mnuImageShowField.Checked = false;
			this.mnuImageShowOnlyCharges.Checked = false;
			this.mnuImageShowEquipotentials.Checked = true;
			
			this.Draw();			
		}
		
		void mnuImageClearFieldAndCharges_Click(object sender, System.EventArgs e)
		{
			this.alCharges.Charge.Clear();
			Draw();
			//this.TO_DO(); // TO DO
		}
		
		void mnuImageClearField_Click(object sender, System.EventArgs e)
		{
			this.TO_DO(); // TO DO
		}
		
		void mnuImageRefresh_Click(object sender, System.EventArgs e)
		{
			this.Draw();	
		}
		
		void mnuOptionsFieldAsVectors_Click(object sender, System.EventArgs e)
		{
			this.mnuOptionsFieldAsGrains.Checked = false;
			this.mnuOptionsFieldAsVectors.Checked = true;
			
			this.Draw();
		}
		
		void mnuOptionsFieldAsGrains_Click(object sender, System.EventArgs e)
		{
			this.mnuOptionsFieldAsGrains.Checked = true;
			this.mnuOptionsFieldAsVectors.Checked = false;
			
			this.Draw();
		}
		
		void mnuOptionsUseColors_Click(object sender, System.EventArgs e)
		{
			this.mnuOptionsUseColors.Checked = !this.mnuOptionsUseColors.Checked;
			
			this.Draw();
		}
		
		void mnuHelpHelp_Click(object sender, System.EventArgs e)
		{
			TO_DO();
		}
		
		void mnuModeE_Click(object sender, System.EventArgs e)
		{
			this.mnuModeE.Checked=true;
			this.mnuModeB.Checked=false;
			//TO_DO();
			Draw();
		}

		void mnuModeB_Click(object sender, System.EventArgs e)
		{
			this.mnuModeE.Checked=false;
			this.mnuModeB.Checked=true;			
			//TO_DO();
			Draw();
		}
		
		int get_mode()
		{
			if (this.mnuModeB.Checked==true)
			{
				return 1; // B mode
			}
			else
			{
				return 0; // E mode
			}
		}
		
		void mnuHelpAbout_Click(object sender, System.EventArgs e)
		{
			About();
		}

		
		//
		void TO_DO()
		{
			//System.Console.WriteLine("TO_DO");
			System.Windows.Forms.MessageBox.Show("TO_DO");
			//this.Close();
		}
		
		void About()
		{
			// fieldE...
			System.Windows.Forms.MessageBox.Show("fieldE... \n an electrostatic simulator \n under GNU/GPL license \n by Sebastien Celles");
			
			// License (GNU/GPL)
			License.Form frm = new License.Form();
			frm.Text = "fieldE... is under GNU/GPL license";
			frm.ShowDialog(this);
		}	
		
		void Draw()
		{

			//this.pictureBox.BackColor = System.Drawing.Color.Black;
						
			System.Drawing.Graphics myGraphics;
			myGraphics = this.pictureBox.CreateGraphics();

			this.pictureBox.Refresh();
			
			// Grid
			// see also initialise_grid
			myGrid.get_max().set_x(this.pictureBox.Width);
			myGrid.get_max().set_y(this.pictureBox.Height);
			myGrid.Draw(myGraphics);
			
			// Initialize Datas, Charges
			//alCharges.Charge.Clear();
			alDatas.Data.Clear();
									
			// Draw charges
			this.Draw_Charges(myGraphics);
						

			if ( !this.mnuImageShowOnlyCharges.Checked )
			{
				this.statusBar.Text = "Calculating...";
				// Calculate Datas
				this.Calculate_Datas();
				
				
				
				this.statusBar.Text = "Drawing...";
				// Draw field
				if (this.mnuImageShowField.Checked)
					this.Draw_Field(myGraphics);
				
				if (this.mnuImageShowEquipotentials.Checked)
					this.Draw_Equipotentials(myGraphics);
				
				// Draw charges (again... over grains, vectors or rectangles)
				// particalary important for Draw Equipotentials
				this.Draw_Charges(myGraphics);
			}
			
			this.statusBar.Text = "Ready...";
		}
		
		void Draw_Charges(System.Drawing.Graphics myGraphics)
		{
			foreach (Physic.Charge chg in alCharges.Charge)
			{
				chg.Draw(myGraphics,get_mode());
			}
		}
				
		void Calculate_Datas()
		{			
			foreach(Physic.Position pt in myGrid.get_positions())
			{
				Physic.Electrostatic_field E = new Physic.Electrostatic_field(pt);
				Physic.Electrostatic_potential V = new Physic.Electrostatic_potential(pt);
				Physic.Magnetostatic_field B = new Physic.Magnetostatic_field(pt);

				foreach (Physic.Charge chg in alCharges.Charge)
				{
					Physic.Electrostatic_field E_tmp = new Physic.Electrostatic_field(chg,pt);
					Physic.Magnetostatic_field B_tmp = new Physic.Magnetostatic_field(chg,pt);
					E = E + E_tmp; // + is overload
					B = B + B_tmp;
					
					Physic.Electrostatic_potential V_tmp = new Physic.Electrostatic_potential(chg,pt);
					V = V + V_tmp;
				}
				
				DefaultNamespace.Data myData = new DefaultNamespace.Data();
				myData.position = pt;
				myData.E = E;
				myData.V = V;
				myData.B = B;
				alDatas.Data.Add(myData);
			}			
		}
		
		void Draw_Field(System.Drawing.Graphics myGraphics)
		{
			if (this.mnuOptionsFieldAsGrains.Checked)
				Draw_Field_Grains(myGraphics);

			if (this.mnuOptionsFieldAsVectors.Checked)
				Draw_Field_Vectors(myGraphics);
/*			if (this.mnuOptionsFieldAsReactangles.Checked)
				Draw_Field_Rectangles(myGraphics);
			*/
		}

		void Draw_Field_Rectangles(System.Drawing.Graphics myGraphics)
		{
		if (get_mode()==0)
			{
			Physic.Electrostatic_field E_max = new Physic.Electrostatic_field();
			E_max.set_x(60);
					
			foreach (DefaultNamespace.Data myData in alDatas.Data)
			{
				Physic.Position pt = myData.position;
				Physic.Electrostatic_field E = myData.E;
				
				Rectangle_draw myRect = new Rectangle_draw();
				myRect.width = myGrid.get_space().get_x()/2;
				myRect.height = myGrid.get_space().get_y()/2;
				myRect.get_position().set_x(pt.get_x());
				myRect.get_position().set_y(pt.get_y());
				if (this.mnuOptionsUseColors.Checked)
				{
					Physic.Color myColor = new Physic.Color();
					myRect.color = myColor.color("step",E.norm,0,E_max.norm);
				}
				else
				{
					myRect.color = System.Drawing.Color.White;
				}
					
				myRect.Draw(myGraphics);
			}
			}
		}

		void Draw_Field_Grains(System.Drawing.Graphics myGraphics) //,Physic.Grid myGrid,System.Collections.ArrayList alData)
		{
			if (this.mnuModeE.Checked==true)
			{
				Physic.Electrostatic_field E_max = new Physic.Electrostatic_field();
				E_max.set_x(60);
						
				foreach (DefaultNamespace.Data myData in alDatas.Data)
				{
					Physic.Position pt = myData.position;
					Physic.Electrostatic_field E = myData.E;
					
					Physic.Grain_draw myGrain = new Physic.Grain_draw();
					myGrain.len = (float) System.Math.Sqrt(myGrid.get_space().get_x()*myGrid.get_space().get_x() + myGrid.get_space().get_y()*myGrid.get_space().get_y()) / (float) System.Math.Sqrt(2);
					myGrain.get_position().set_x(pt.get_x());
					myGrain.get_position().set_y(pt.get_y());
					myGrain.get_direction().set_x(E.get_x());
					myGrain.get_direction().set_y(E.get_y());
					if (this.mnuOptionsUseColors.Checked)
					{
						Physic.Color myColor = new Physic.Color();
						myGrain.color = myColor.color("linear",E.norm,0,E_max.norm);
					}
					else
					{
						myGrain.color = System.Drawing.Color.White;
					}
						
					myGrain.Draw(myGraphics);
				}
			}
			else if (this.mnuModeB.Checked==true)
			{
				Physic.Magnetostatic_field B_max = new Physic.Magnetostatic_field();
				B_max.set_x(60);
						
				foreach (DefaultNamespace.Data myData in alDatas.Data)
				{
					Physic.Position pt = myData.position;
					Physic.Magnetostatic_field B = myData.B;
					
					Physic.Grain_draw myGrain = new Physic.Grain_draw();
					myGrain.len = (float) System.Math.Sqrt(myGrid.get_space().get_x()*myGrid.get_space().get_x() + myGrid.get_space().get_y()*myGrid.get_space().get_y()) / (float) System.Math.Sqrt(2);
					myGrain.get_position().set_x(pt.get_x());
					myGrain.get_position().set_y(pt.get_y());
					myGrain.get_direction().set_x(B.get_x());
					myGrain.get_direction().set_y(B.get_y());
					if (this.mnuOptionsUseColors.Checked)
					{
						Physic.Color myColor = new Physic.Color();
						myGrain.color = myColor.color("linear",B.norm,0,B_max.norm);
					}
					else
					{
						myGrain.color = System.Drawing.Color.White;
					}
						
					myGrain.Draw(myGraphics);
				}
			}
			
		}
		
		void Draw_Field_Vectors(System.Drawing.Graphics myGraphics) //,Physic.Grid myGrid,System.Collections.ArrayList alData)
		{
			if (get_mode()==0)
			{
				Physic.Electrostatic_field E_max = new Physic.Electrostatic_field();
				E_max.set_x(60);
						
				foreach (DefaultNamespace.Data myData in alDatas.Data)
				{
					Physic.Position pt = myData.position;
					Physic.Electrostatic_field E = myData.E;
					
					Math.Vector_draw myVector = new Math.Vector_draw();
					myVector.position_start.set_x(pt.get_x());
					myVector.position_start.set_y(pt.get_y());
					myVector.position_end.set_x(pt.get_x()+E.get_x());
					myVector.position_end.set_y(pt.get_y()+E.get_y());
						
					if (this.mnuOptionsUseColors.Checked)
					{
						Physic.Color myColor = new Physic.Color();
						myVector.color = myColor.color("step",E.norm,0,E_max.norm);
					}
					else
					{
						myVector.color = System.Drawing.Color.White;
					}
		
						myVector.Draw(myGraphics);
				}			
			}
			else if (get_mode()==1)
			{
				Physic.Magnetostatic_field B_max = new Physic.Magnetostatic_field();
				B_max.set_x(60);
						
				foreach (DefaultNamespace.Data myData in alDatas.Data)
				{
					Physic.Position pt = myData.position;
					Physic.Magnetostatic_field B = myData.B;
					
					Math.Vector_draw myVector = new Math.Vector_draw();
					myVector.position_start.set_x(pt.get_x());
					myVector.position_start.set_y(pt.get_y());
					myVector.position_end.set_x(pt.get_x()+B.get_x());
					myVector.position_end.set_y(pt.get_y()+B.get_y());
						
					if (this.mnuOptionsUseColors.Checked)
					{
						Physic.Color myColor = new Physic.Color();
						myVector.color = myColor.color("step",B.norm,0,B_max.norm);
					}
					else
					{
						myVector.color = System.Drawing.Color.White;
					}
		
						myVector.Draw(myGraphics);
				}				
			}
		}
			
		void Draw_Equipotentials(System.Drawing.Graphics myGraphics)
		{
			if (get_mode()==0)
			{
			Physic.Electrostatic_potential V_max = new Physic.Electrostatic_potential();
			V_max.value = 3000;
			
			Physic.Electrostatic_potential V_min = new Physic.Electrostatic_potential();
			V_min.value = -3000;
					
			foreach (DefaultNamespace.Data myData in alDatas.Data)
			{
				Physic.Position pt = myData.position;
				Physic.Electrostatic_potential V = myData.V;
				
				Rectangle_draw myRect = new Rectangle_draw();
				myRect.width = myGrid.get_space().get_x(); //2;
				myRect.height = myGrid.get_space().get_y(); //2;
				myRect.position.set_x(pt.get_x());
				myRect.position.set_y(pt.get_y());
				if (this.mnuOptionsUseColors.Checked)
				{
					Physic.Color myColor = new Physic.Color();
					myRect.color = myColor.color("step",V.value,V_min.value,V_max.value);
				}
				else
				{
					myRect.color = System.Drawing.Color.White;
				}
					
				myRect.Draw(myGraphics);
			}
			}
		}
		
		//public int IndexAction = -1; // n° of charge to be moved
		//public bool bAction = true; // action is enable
		
		public Physic.Charges alCharges = new Physic.Charges();
		public Physic.Grid myGrid = new Physic.Grid();
		public DefaultNamespace.Datas alDatas = new DefaultNamespace.Datas();
		
	}
}
