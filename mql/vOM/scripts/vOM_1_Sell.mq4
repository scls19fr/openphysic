//+------------------------------------------------------------------+
//|                                                _Sell_vSL_vTP.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

#include <vOM.mqh>

double lots = 0.01;

// distance in points for SL and TP (and stealth SL & TP)
int SL = 100;
int TP = 100;

int vSL = 50;
int vTP = 20;

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+



int start() {
  NewOrder(Symbol(), OP_SELL, lots, Bid, slippage, Bid+SL*Point, Bid-TP*Point, Bid+vSL*Point, Bid-vTP*Point, "Test sell with vSL/vTP");
  
  return(0);
}

