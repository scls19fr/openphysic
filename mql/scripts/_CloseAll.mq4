//+------------------------------------------------------------------+
//|                                                    _CloseAll.mq4 |
//|                                    Copyright © 2011, FemtoTrader |
//|                                       http://www.femtotrader.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, FemtoTrader"
#property link      "http://www.femtotrader.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

int slippage = 3;

double price;
bool   result;
int tryClose;

int start() {
  int total=OrdersTotal();
  Comment("There is " + total + " orders to close");
  for ( int cnt=total-1; cnt>=0; cnt-- ) {
    tryClose = 0;
    OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);

    result = false;
 
    if(OrderType()==OP_BUY || OrderType()==OP_SELL) {

      while(!result) {
        if(OrderType()==OP_BUY) {
          price=MarketInfo(OrderSymbol(),MODE_BID); //Bid;
        } else {
          price=MarketInfo(OrderSymbol(),MODE_ASK); //Ask;
        }
        result=OrderClose(OrderTicket(),OrderLots(),price,slippage,CLR_NONE);
        Print("Trying to close order #" + OrderTicket() + " at " + price);
        tryClose++;
        if (!result) {
          Print("Can't close order #" + OrderTicket() + "(" + tryClose + ")");
          RefreshRates();
        }
      }
    }
  }
  Comment("Every orders (" + total + ") should be closed");
  return(0);
}
//+------------------------------------------------------------------+