//+------------------------------------------------------------------+
//|                                           _CloseOrdersParams.mq4 |
//|                                    Copyright © 2011, FemtoTrader |
//|                                       http://www.femtotrader.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, FemtoTrader"
#property link      "http://www.femtotrader.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

//#property show_confirm  // comment out this line to eliminate the confirmation box
#property show_inputs // comment out this line to eliminate showing inputs

extern string Comment_00 = "close_type";
extern string Comment_01 = " -1 = close negative orders";
extern string Comment_02 = "  0 = close every orders";
extern string Comment_03 = "  1 = close positive orders";
extern string Comment_04 = "  2 = close using defined function (see code)";

extern int close_type = 1;

extern string Comment_10 = "magic";
extern string Comment_11 = " -1 = doesn't use magic number";
extern string Comment_12 = " #magic = close only if magic number is given";

extern int magic = -1;

int slippage = 3;

double price;
bool   result;
int tryClose;

double profit;

bool close_condition(double profit) {
  if (close_type==2) {
    return(false); // define your close condition here !!!
     
  } else if (close_type==0) {
    return(magic==OrderMagicNumber() || magic==-1); // true && ...
    
  } else if (close_type==1) {
    return(profit>0 && ( magic==OrderMagicNumber() || magic==-1 ));
  
  } else if (close_type==-1) {
    return(profit<0 && ( magic==OrderMagicNumber() || magic==-1 ));
    
  }
  
}

int start() {
  int total=OrdersTotal();
  Comment("There is " + total + " order(s) currently opened");
  for ( int cnt=total-1; cnt>=0; cnt-- ) {
    tryClose = 0;
    OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES);

    result = false;
 
    if(OrderType()==OP_BUY || OrderType()==OP_SELL) {

      while(!result) {
        if(OrderType()==OP_BUY) {
          price = MarketInfo(OrderSymbol(),MODE_BID); //Bid;
          profit = price - OrderOpenPrice();

        } else {
          price = MarketInfo(OrderSymbol(),MODE_ASK); //Ask;
          profit = OrderOpenPrice() - price;
        }
        
        if (close_condition(profit)) {
          result=OrderClose(OrderTicket(),OrderLots(),price,slippage,CLR_NONE);
          Print("Trying to close order #" + OrderTicket() + " at " + price);
          tryClose++;
          if (!result) {
            Print("Can't close order #" + OrderTicket() + "(" + tryClose + ")");
            RefreshRates();
          }
        } else {
           Print("Order #" + OrderTicket() + " doesn't need to be closed");
           result = true;
        } 
      }
    }
  }
  Comment("Every orders (" + total + ") should be closed");
  return(0);
}
//+------------------------------------------------------------------+