/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 23/08/2004
 * Time: 21:33
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */

using System;

using System.Xml;
using System.Xml.Serialization;

namespace DefaultNamespace
{
	/// <summary>
	/// Give piece of informations about file type	
	/// </summary>
	public class Manifest
	{
		// version of fieldE : minor.major.release
		// mimetype : "application/x-fielde"
		// content : Object <-> XML file
		
		//System.Windows.Forms.Application.ProductName;
		//System.Windows.Forms.Application.CompanyName;
		//System.Windows.Forms.Application.CurrentCulture;
		//System.Windows.Forms.Application.ProductVersion;
		
		public System.Version version = new System.Version(); // ?
		public string mimetype = "application/x-undef";
		
		public Contents contents;
		
		
		public Manifest()
		{
			
			this.version = new System.Version();
			this.mimetype = "application/x-undef";
		}
	}
	
	public class Content
	{
		public object file_object;
		public string file_xml;
		
		public Content() {
			file_object = new Object();
			file_xml = "";
		}
		
		public Content(object obj, string file) {
			file_object = obj;
			file_xml = file;
		}
		
		public Content(object obj) {
			file_object = obj;
			file_xml = "";
		}

		public Content(string file) {
			file_object = new Object();
			file_xml = file;
		}
	}
	
	public class Contents
	{
		//[XmlElement(Type = typeof(Content))]
		public System.Collections.ArrayList Content = new System.Collections.ArrayList();
	}
	
}
