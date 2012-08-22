//+------------------------------------------------------------------+
//|                                                 EA_Clone_CSV.mq4 |
//|                                   Copyright © 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

extern string filename = "Trade_History_out_EURUSD.csv";
//extern int MaxOrders = 500;

#define MaxOrders 500

#define MY_SHORTNAME "EA_Clone_CSV"

// Type,Symbol,Lots,DateOpen,PriceOpen,DateClose,PriceClose
int aType[MaxOrders];
string aSymbol[MaxOrders];
double aLots[MaxOrders];
datetime aDateOpen[MaxOrders];
double aPriceOpen[MaxOrders];
datetime aDateClose[MaxOrders];
double aPriceClose[MaxOrders];

int NbOrdersInFile;

int i_tr; // trade index

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   // Read CSV file and put it in a Array


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
      
      int i = -1;
      while (!FileIsEnding(handle)) {
         Type = StrToInteger(FileReadString(handle));
         _Symbol = FileReadString(handle);
         Lots = StrToDouble(FileReadString(handle));
         DateOpen = StrToTime(FileReadString(handle));
         PriceOpen = StrToDouble(FileReadString(handle));
         DateClose = StrToTime(FileReadString(handle));
         PriceClose = StrToDouble(FileReadString(handle));
         

         if (i==-1) {
            // Skip header
            i = i + 1;
         } else {
            if (i>0) {
               if (DateOpen<=DateOpen_previous) {
                  msg = msg + "\n" + "DateOpen must be ascending (use a script to feed me correctly !)";
                  break;
               }
            }
            
            aType[i] = Type;
            aSymbol[i] = _Symbol;
            aLots[i] = Lots;
            aDateOpen[i] = DateOpen;
            aPriceOpen[i] = PriceOpen;
            aDateClose[i] = DateClose;
            aPriceClose[i] = PriceClose;

            //Print(i + " " + "OPEN "+Type+" "+_Symbol+" "+TimeToStr(DateOpen)+"@"+PriceOpen+" CLOSE "+TimeToStr(DateClose)+"@"+PriceClose);
            
            DateOpen_previous = DateOpen;
            
            if (PriceOpen!=0) {
               i = i + 1;
            } else {
               break;
            }
         
            if (i>=MaxOrders) {
               break;
            }
         }
         
         
      }
      
      NbOrdersInFile = i;
      
      msg = msg + "\n" + TimeToStr(TimeCurrent(),TIME_DATE|TIME_SECONDS);
      
      msg = msg + "\n" + "End of reading CSV file";
   
      Comment(msg);
   
      FileClose(handle);     
   }

   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//----

     manage_trades_to_open();
     
     manage_trades_to_close();
     
     //manage_opened_trades();
     
     display_comments();
   
//----
   return(0);
  }
//+------------------------------------------------------------------+

int manage_trades_to_open() {
//   if (true) {
//      i_tr = i_tr + 1;
//   }

}

int manage_trades_to_close() {

}

/*
int manage_opened_trades() {

}
*/

void display_comments() {
   string msg;
   
   msg = "Start ("+NbOrdersInFile+" orders in file)";
   msg = msg + "\n" + "Trade history = " + i_tr; 
   
   Comment(msg);
}