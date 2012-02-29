//+------------------------------------------------------------------+
//|                                                      BuySell.mq4 |
//|                                    Copyright © 2011, FemtoTrader |
//|                                       http://www.femtotrader.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, FemtoTrader"
#property link      "http://www.femtotrader.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

double lots = 0.01;
int slippage = 3;
int SL = 250;
int TP = 250;

//int waitMS = 100;

int start() {
  Print("Buy/Sell " + lots);
       
  //int OrderSend( 	string symbol, int cmd, double volume, double price, int slippage, double stoploss, double takeprofit, string comment=NULL, int magic=0, datetime expiration=0, color arrow_color=CLR_NONE)

  int ticket;

  ticket = -1;
  while(ticket < 0) {
    ticket=OrderSend(Symbol(),OP_BUY,lots,Ask,slippage,Ask-SL*Point,Ask+TP*Point,"Buy for test");
    if(ticket<0) {
      Print("OrderSend (Buy) failed with error #",GetLastError());
      RefreshRates();
      //return(0);
    }
  }

  
  //Sleep(waitMS);

  ticket = -1;
  while(ticket < 0) {
    ticket = OrderSend(Symbol(),OP_SELL,lots,Bid,slippage,Bid+SL*Point,Bid-TP*Point,"Sell for test");
    if(ticket<0) {
      Print("OrderSend (Sell) failed with error #",GetLastError());
      RefreshRates();
      //return(0);
    }
  }


  return(0);
}

