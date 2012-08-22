//+------------------------------------------------------------------+
//|                                                 EA_Clone_CSV.mq4 |
//|                                   Copyright © 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

//extern int time_offset = 3;

#include "include/Trade_History_out_code_EURUSD.mqh"

#define MY_SHORTNAME "EA_Clone_Array"


int i_tr; // trade index

datetime t, t0, t1;

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   // Init tabs file and put it in a Array
   // Test if tab is ok (DateOpen ascending)
 
   init_tab();

   
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

//while(true) {
     Print("EA start now!" + TimeToStr(TimeCurrent()));

     manage_trades_to_open();
     
     //manage_trades_to_close();
     
     //manage_opened_trades();
     
     display_comments();
//}   
//----
   return(0);
  }
//+------------------------------------------------------------------+

int manage_trades_to_open() {
   int ticket;

   t0 = Time[0];
   t1 = Time[0]+Period()*60;
   //t = TimeCurrent();

   while(t<t0 && i_tr<NbOrdersInFile) {
      t = aDateOpen[i_tr];
      if (t<=t0) {
         i_tr = i_tr + 1;
         //Print("Order #" + i_tr + " is not executed");
      } else if (t>=t0 && t<t1) {
         Print("Open new order "+TimeToStr(TimeCurrent()));
         //int cmd;
         double SL;
         double TP;
         int slippage = 3;

//aLots[i_tr]
         if (aType[i_tr]==1) { // BUY
            ticket = OrderSend(aSymbol[i_tr], OP_BUY, 0.01, aPriceOpen[i_tr], slippage, SL, TP);
         } else if (aType[i_tr]==-1) { // SELL
            ticket = OrderSend(aSymbol[i_tr], OP_SELL, 0.01, aPriceOpen[i_tr], slippage, SL, TP);
         }
         
         if(ticket>=0) {
            i_tr = i_tr + 1;
         } else {
            Comment("Order is not executed (that's maybe a time_offset problem)");
         }

      } else { // t>=t1
         //
         //Print("Order #" + i_tr + "will be executed later");
      }   
   }
//}
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
   msg = msg + "\n" + "Next trade #" + get_str_trade(i_tr);
   //msg = msg + "\n" + "Trade history = " + i_tr;
   msg = msg + "\n" + "TimeCurrent=" + TimeToStr(TimeCurrent(),TIME_DATE|TIME_SECONDS);
   msg = msg + "\n" + "TimeToOpenNextTrade=" + TimeToStr(t,TIME_DATE|TIME_SECONDS);
   
   
   msg = msg + "\n" + "t0=" + TimeToStr(t0);
   msg = msg + "\n" + "t1=" + TimeToStr(t1);
      
   Comment(msg);
}

string get_str_trade(int i) {
   if (i<NbOrdersInFile) {
      return(i + " " + "OPEN "+aType[i]+" "+aSymbol[i]+" "+TimeToStr(aDateOpen[i])+"@"+aPriceOpen[i]+" CLOSE "+TimeToStr(aDateClose[i])+"@"+aPriceClose[i]);
   } else {
      return("No trade to manage");
   }   
}