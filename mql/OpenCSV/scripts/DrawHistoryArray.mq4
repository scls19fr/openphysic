//+------------------------------------------------------------------+
//|                                             DrawHistoryArray.mq4 |
//|                                   Copyright © 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

#define OBJ_PREFIX "OBJ_DrawHistoryArray_"

#include "../include/Trade_History_out_code_EURUSD.mqh"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
//----
    init_tab();

    int i;
    int _OrderTicket;
        
    int Nmax = 500; // nb max d'objets à tracer
    int N = 0;
    int dir;
    
    double profit_sign;

    string objname, objname2, objname3, objname4, objname5;
    
    for (i=NbOrdersInFile-1 ; i >= 0 ; i--) { // du plus recent vers le plus ancien
        _OrderTicket = i;
        objname = OBJ_PREFIX+"opentime_"+_OrderTicket;
        objname2 = OBJ_PREFIX+"openprice_"+_OrderTicket;
        objname3 = OBJ_PREFIX+"closetime_"+_OrderTicket;
        objname4 = OBJ_PREFIX+"closeprice_"+_OrderTicket;
        objname5 = OBJ_PREFIX+"trade_"+_OrderTicket;
        if (Symbol()==aSymbol[i] && (aType[i]==OP_BUY || aType[i]==OP_SELL)) {
            if ( N+1 > MathMin(NbOrdersInFile, Nmax) ) {
                break;
            } else {
                N = N + 1;
            }
            ObjectCreate(objname, OBJ_VLINE, 0, aDateOpen[i], 0);
            ObjectCreate(objname2, OBJ_ARROW, 0, aDateOpen[i], aPriceOpen[i]);
            ObjectSet(objname2, OBJPROP_ARROWCODE, SYMBOL_LEFTPRICE);
            ObjectCreate(objname3, OBJ_VLINE, 0, aDateClose[i], 0);
            ObjectCreate(objname4, OBJ_ARROW, 0, aDateClose[i], aPriceClose[i]);
            ObjectSet(objname4, OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
            ObjectCreate(objname5, OBJ_RECTANGLE, 0, aDateOpen[i], aPriceOpen[i], aDateClose[i], aPriceClose[i]);
            
            profit_sign = dir*(aPriceClose[i]-aPriceOpen[i]);
            
            if (aType[i]==OP_BUY) {
                dir = 1;
                ObjectSet(objname, OBJPROP_COLOR, C'0x00, 0x9F, 0x00');
                ObjectSet(objname2, OBJPROP_COLOR, C'0x00, 0x9F, 0x00');
                ObjectSet(objname3, OBJPROP_COLOR, C'0x00, 0x5F, 0x00');
                ObjectSet(objname4, OBJPROP_COLOR, C'0x00, 0x5F, 0x00');
                if (profit_sign<0) {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x00, 0x5F, 0x50');
                } else {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x00, 0x9F, 0x00');
                }
            } else if (aType[i]==OP_SELL) {
                dir = -1;
                ObjectSet(objname, OBJPROP_COLOR, C'0x9F, 0x00, 0x00');
                ObjectSet(objname2, OBJPROP_COLOR, C'0x9F, 0x00, 0x00');
                ObjectSet(objname3, OBJPROP_COLOR, C'0x5F, 0x00, 0x00');
                ObjectSet(objname4, OBJPROP_COLOR, C'0x5F, 0x00, 0x00');
                if (profit_sign<0) {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x5F, 0x00, 0x50');
                } else {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x9F, 0x00, 0x00');
                }
            }
        }
    }

    Comment("DrawHistoryArray " + N + " trades");   
//----
   return(0);
  }
//+------------------------------------------------------------------+