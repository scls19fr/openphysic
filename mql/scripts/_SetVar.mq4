//+------------------------------------------------------------------+
//|                                                      _SetVar.mq4 |
//|                                                 Copyright © 2011 |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

#include <vOM.mqh>

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
//----
   int ticket = 612023;
   string mode = "vSL";   
   double value = 1.34515;
   
   setVarTicket(ticket, mode, value);
   
//----
   return(0);
}
//+------------------------------------------------------------------+


