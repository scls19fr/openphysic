//+------------------------------------------------------------------+
//|                                                      _GetVar.mq4 |
//|                                                 Copyright © 2011 |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

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