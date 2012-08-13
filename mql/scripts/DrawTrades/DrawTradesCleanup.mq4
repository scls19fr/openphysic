//+------------------------------------------------------------------+
//|                                           DrawHistoryCleanup.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#define OBJ_PREFIX "OBJ_Trades_"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
//ObjectDelete(OBJ_PREFIX);
ObjectsDeleteAll();

Comment("DrawTrades " + "cleanup");

// ToDo : suprimer que les objets avec prefixe OBJ_PREFIX

//----
   return(0);
  }
//+------------------------------------------------------------------+