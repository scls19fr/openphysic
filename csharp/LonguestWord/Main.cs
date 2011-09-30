/*
 * Created by SharpDevelop.
 * User: scls
 * Date: 05/08/2004
 * Time: 21:22
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.IO;

namespace DefaultNamespace
{
	class MainClass
	{
		public static int Main(string[] args)
		{
			Console.WriteLine(@"LonguestWord");
			Console.WriteLine(@"by Sébastien CELLES under");
			Console.WriteLine(@"GNU GENERAL PUBLIC LICENSE
Version 2, June 1991
Copyright (C) 1989, 1991 Free Software Foundation, Inc.
59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
http://www.gnu.org/licenses/gpl.txt");

			System.Text.Encoding TxtEncoding = System.Text.Encoding.UTF7;
			
			Console.WriteLine("");
			
			// Creating dictionary list
			//System.Collections.ArrayList alDicLst;
			Data.Dictionnaries alDicLst;
			alDicLst = Creating_Dictionnary_List( TxtEncoding );

			// Creating dictionary
			System.Collections.ArrayList alWords;
			alWords = Creating_Dictionnary(TxtEncoding, alDicLst);
				
			Console.WriteLine("");
			
			
			do
			{
			// Asking user
			string strUserMask;
			strUserMask = Asking_User(args);	
			if (strUserMask=="EXIT")
			{
				return(0); // sortie !
			}
			
			Console.WriteLine("");
			
			// Trying
			//System.Collections.ArrayList alWordsResults;
			//alWordsResults = Trying_Words(strUserMask,alWords);
			Trying_Words(strUserMask,alWords);
			
			// Showing results
			//Showing_results(alWordsResults);
			
			//Console.WriteLine("");
			
			}
			while(args.Length==0);
			
			return(0);
			
		}
		
		private static string Cut_Before_Slash(string sTmp)
		{
			int i;
			i = sTmp.IndexOf(@"/"); // add only char before /
			
			if (i>0)
			{
				sTmp = sTmp.Substring(0,i);
				return(sTmp);
			}
			else
			{
				return(sTmp);
			}
		}
		
		private static string Convert_String(string str)
		{
			string strTemp;
			
			strTemp = str.ToLower();
			
			strTemp = strTemp.Replace("à","a");
			strTemp = strTemp.Replace("â","a");
			strTemp = strTemp.Replace("ä","a");
			
			strTemp = strTemp.Replace("é","e");
			strTemp = strTemp.Replace("è","e");
			strTemp = strTemp.Replace("ê","e");
			strTemp = strTemp.Replace("ë","e");
			
			strTemp = strTemp.Replace("î","i");
			strTemp = strTemp.Replace("ï","i");
			
			strTemp = strTemp.Replace("ô","o");
			strTemp = strTemp.Replace("ö","o");
			
			strTemp = strTemp.Replace("ù","u");
			strTemp = strTemp.Replace("ü","u");
			
			strTemp = strTemp.Replace("ç","c");
			
			strTemp = strTemp.ToUpper();
			
			return strTemp;
		}

		private static Data.Dictionnaries Creating_Dictionnary_List(System.Text.Encoding TxtEncoding)
		{
			System.IO.FileStream FS = System.IO.File.OpenRead("dic.xml");
			System.Xml.Serialization.XmlSerializer XMLS = new System.Xml.Serialization.XmlSerializer( typeof(Data.Dictionnaries) );
			Data.Dictionnaries alDic = (Data.Dictionnaries) XMLS.Deserialize(FS);
			FS.Close();
			return alDic;
		}
		
		private static System.Collections.ArrayList Creating_Dictionnary(System.Text.Encoding TxtEncoding, Data.Dictionnaries alDicLst)
		{
			string sTmp;

			System.Collections.ArrayList alWords = new System.Collections.ArrayList();

			foreach (Data.Dictionnary myDic in alDicLst.Dictionnary)
			{
				Console.WriteLine("Reading " + myDic.name);
				sTmp = null;
				StreamReader IoutStream = new StreamReader(myDic.filename,TxtEncoding);				
				do
				{	
					sTmp = null;
					sTmp = IoutStream.ReadLine();						
					if (sTmp!=null)
					{
						sTmp = Cut_Before_Slash(sTmp);			
						sTmp = Convert_String(sTmp);				
						alWords.Add((string) sTmp);
					}				
				}
				while( sTmp != null );
				IoutStream.Close();
			}
			return alWords;
		}

		private static string Asking_User(string[] args)
		{
			Console.WriteLine("Enter letters without any space and press enter.");
			Console.WriteLine("Press CTRL + C or type exit to exit");
			Console.WriteLine("");

			string strUserMask;
			Console.WriteLine("Searching for...");
			if(args.Length==0)
			{
				strUserMask = Console.ReadLine();
			}
			else
			{
				strUserMask = args[0];
				Console.WriteLine(strUserMask);	
			}
			
			strUserMask = Convert_String(strUserMask);
			
			return strUserMask;
		}
		
		//private static System.Collections.ArrayList Trying_Words(string strUserMask, System.Collections.ArrayList alWords)
		private static string String_In_Dictionnary(string str, System.Collections.ArrayList alWords)
		{
			string strTmp = "";
			
			foreach (string strDicWord in alWords)
			{
				if (strDicWord==str) // this condition should be modified... it doesn't work when there is one (or more) useless letter
				{
					strTmp = str;
				}
			}
			
			return strTmp;
		}
		
		private static void Trying_Words(string strUserMask, System.Collections.ArrayList alWords)
		{
			System.Collections.ArrayList alChars = new System.Collections.ArrayList();			
			alChars = Convert_String_To_ArrayList(strUserMask);
			
			Permut(alChars,0,alWords);
			
			Console.WriteLine("");
		}

		public static void Permut(System.Collections.ArrayList al, int i,System.Collections.ArrayList alWords)
		{
			if (i == al.Count-1)
			{
				string str;
				str = Convert_ArrayList_To_String(al);
				// affiche le mot si il est dans le dico
				//Console.WriteLine(str);
				string strResult;
				strResult = String_In_Dictionnary(str,alWords);
				if (strResult!="")
				{
					Console.WriteLine(strResult);
				}
				
			}
			else
			{
				for (int j = i ; j <= al.Count-1 ; j++)
				{
					Swap(al, i, j);
					Permut(al, i+1, alWords);
					Swap(al, i, j);
				}
			}			
		}

		public static void Swap(System.Collections.ArrayList al, int i, int j)
		{
			object tmp;
			tmp = al[j];
			al[j] = al[i];
			al[i] = tmp;
		}
		
		private static string Convert_ArrayList_To_String(System.Collections.ArrayList al)
		{
			string str = "";
			string strTmp = "";
			for (int i=0; i <= al.Count-1 ; i++)
			{
				strTmp = al[i].ToString();
				str = str + strTmp;
			}
			return str;
		}
		
		private static System.Collections.ArrayList Convert_String_To_ArrayList(string strUserMask)
		{
			System.Collections.ArrayList alChars = new System.Collections.ArrayList();
			
			for (int i=0; i <= strUserMask.Length-1 ; i++)
			{
				alChars.Add(strUserMask[i]);
			}
			
			return alChars;
		}
		
		private static void Showing_results(System.Collections.ArrayList alWordsResults)
		{
			foreach (string strWordResult in alWordsResults)
			{	
				Console.WriteLine(strWordResult);	
			}
	
		}

	}
}
