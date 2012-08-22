//+------------------------------------------------------------------+
//|                                                      OpenCSV.mq4 |
//|                                   Copyright © 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

extern string filename = "Trade_History_Full.csv";
extern int MaxOrders = 10;

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
   
   // Provider Ticket,Broker Ticket,Type,Currency,Standard Lots,Date Open,Date Close,Price Open,Price Close,Highest Profit (Pips),Worst Drawdown (Pips),Interest ($),Profit (Pips),Profit ($)

   
   string msg = filename;
   string strL;
   
   //string ProviderTicket, BrokerTicket, Type, Currency, StandardLots, DateOpen, DateClose, PriceOpen, PriceClose, HighestProfitPips, WorstDrawdownPips, InterestUSD, ProfitPips, ProfitUSD;
   //string ProviderTicket, BrokerTicket, Type, Currency, DateOpen, DateClose, HighestProfitPips, WorstDrawdownPips, InterestUSD, ProfitPips, ProfitUSD;
   string Type, Currency;
   double StandardLots, PriceOpen, PriceClose;
   //string DateOpen, DateClose;
   datetime DateOpen, DateClose;
   string skip;
   
   int handle;
   
   handle = FileOpen(filename, FILE_CSV|FILE_READ, ',');
   
   if (handle<0) {
      msg = msg + "\n" + "Error: can't open file " + filename + "\n" + "End";
   } else {
      msg = msg + " opened";
      
      int i;
      while (!FileIsEnding(handle)) {
         //Print(i);
         //strL = FileReadString(handle);
         
         skip = FileReadString(handle); //ProviderTicket = FileReadString(handle);
         skip = FileReadString(handle); //BrokerTicket = FileReadString(handle);
         Type = FileReadString(handle);
         Currency = StrToSymbol(FileReadString(handle));
         StandardLots = StrToDouble(FileReadString(handle));
         DateOpen = StrToTime(FileReadString(handle));
         DateClose = StrToTime(FileReadString(handle));
         PriceOpen = StrToDouble(FileReadString(handle));
         PriceClose = StrToDouble(FileReadString(handle));
         skip = FileReadString(handle); //HighestProfitPips = FileReadString(handle);
         skip = FileReadString(handle); //WorstDrawdownPips = FileReadString(handle);
         skip = FileReadString(handle); //InterestUSD = FileReadString(handle);
         skip = FileReadString(handle); //ProfitPips = FileReadString(handle);
         skip = FileReadString(handle); //ProfitUSD = FileReadString(handle);
         
         Print("OPEN "+Type+" "+Currency+" "+TimeToStr(DateOpen)+"@"+PriceOpen+" CLOSE "+TimeToStr(DateClose)+"@"+PriceClose);

         if (i==0) {
             
         } else {
             
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

