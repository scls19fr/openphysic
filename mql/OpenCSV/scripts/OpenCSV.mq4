//+------------------------------------------------------------------+
//|                                                      OpenCSV.mq4 |
//|                                   Copyright © 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

extern string filename = "Trade_History_out_EURUSD.csv";
extern int MaxOrders = 10;

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
   
   // Type,Symbol,Lots,DateOpen,PriceOpen,DateClose,PriceClose
   
   string msg = filename;
   string strL;
   
   int Type;
   string _Symbol;
   double Lots;
   datetime DateOpen;
   double PriceOpen;
   datetime DateClose;
   double PriceClose;

   datetime DateOpen_previous; // = D'1980.01.01 00:00';
   
   int handle;
   
   handle = FileOpen(filename, FILE_CSV|FILE_READ, ',');
   
   if (handle<0) {
      msg = msg + "\n" + "Error: can't open file " + filename + "\n" + "End";
   } else {
      msg = msg + " opened";
      
      int i;
      while (!FileIsEnding(handle)) {
         Type = StrToInteger(FileReadString(handle));
         _Symbol = StrToSymbol(FileReadString(handle));
         Lots = StrToDouble(FileReadString(handle));
         DateOpen = StrToTime(FileReadString(handle));
         PriceOpen = StrToDouble(FileReadString(handle));
         DateClose = StrToTime(FileReadString(handle));
         PriceClose = StrToDouble(FileReadString(handle));
         

         if (i==0) {
            // Skip header
         } else {
            if (i>1) {
               if (DateOpen<=DateOpen_previous) {
                  msg = msg + "\n" + "DateOpen must be ascending (use a script to feed me correctly !)";
                  break;
               }
            }
            Print("OPEN "+Type+" "+_Symbol+" "+TimeToStr(DateOpen)+"@"+PriceOpen+" CLOSE "+TimeToStr(DateClose)+"@"+PriceClose);
            
            DateOpen_previous = DateOpen;       
         }
         
         i = i + 1;
         if (i>=MaxOrders) {
            break;
         }         
      }
      
      msg = msg + "\n" + "End";
   
      Comment(msg);
   
      FileClose(handle);     
   }
   
   
//----
   return(0);
  }
//+------------------------------------------------------------------+

  string StrToSymbol(string str) {
      return(StringSubstr(str,0,3)+StringSubstr(str,4,3));
  }

