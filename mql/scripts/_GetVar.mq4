//+------------------------------------------------------------------+
//|                                                      _GetVar.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
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
   
   //Comment(getVarTicket(ticket, mode));
   getVarTicket(ticket, mode);

//----
   return(0);
}
//+------------------------------------------------------------------+