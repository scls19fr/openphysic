/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 04/08/2004
 * Time: 21:17
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */

using System;
using System.Xml;
using System.Xml.Serialization;

namespace Data
{
	/// <summary>
	/// Description of Dictionnaries.	
	/// </summary>
	public class Dictionnaries
	{
		[XmlElement(Type = typeof(Data.Dictionnary))]
		public System.Collections.ArrayList Dictionnary = new System.Collections.ArrayList();
	
		public Dictionnaries()
		{
		}
	}
}
