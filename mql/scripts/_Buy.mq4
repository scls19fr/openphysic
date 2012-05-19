//+------------------------------------------------------------------+
//|                                                      BuySell.mq4 |
//|                                                 Copyright © 2011 |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

double lots = 0.01;
int slippage = 3;
int SL = 250;
int TP = 250;

int start() {
  Print("Buy/Sell " + lots);
       
  //int OrderSend( 	string symbol, int cmd, double volume, double price, int slippage, double stoploss, double takeprofit, string comment=NULL, int magic=0, datetime expiration=0, color arrow_color=CLR_NONE)

  int ticket;
  ticket=OrderSend(Symbol(),OP_BUY,lots,Ask,slippage,Ask-SL*Point,Ask+TP*Point,"Buy for test");
  if(ticket<0) {
    Print("OrderSend failed with error #",GetLastError());
    return(0);
  }

  
  return(0);
}

