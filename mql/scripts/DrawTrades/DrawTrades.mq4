//+------------------------------------------------------------------+
//|                                                  DrawHistory.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

#define OBJ_PREFIX "OBJ_DrawTrades_"

int start() {
//----

    int i;
        
    int Nmax = 50; // nb max d'objets � tracer
    int N = 0;
    

    string objname, objname2, objname3, objname4, objname5;
    
    
    for (i=OrdersTotal()-1 ; i >= 0 ; i--) { // du plus recent vers le plus ancien
        OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
        objname = OBJ_PREFIX+"opentime_"+OrderTicket();
        objname2 = OBJ_PREFIX+"openprice_"+OrderTicket();
        objname3 = OBJ_PREFIX+"closetime_"+OrderTicket();
        objname4 = OBJ_PREFIX+"closeprice_"+OrderTicket();
        objname5 = OBJ_PREFIX+"trade_"+OrderTicket();
        if (Symbol()==OrderSymbol() && (OrderType()==OP_BUY || OrderType()==OP_SELL)) {
            if ( N+1 > MathMin(OrdersTotal(), Nmax) ) {
                break;
            } else {
                N = N + 1;
            }
            double price_close;
            /*
            Ask > Bid
            open BUY  at Ask
            open SELL at Bid
            close BUY at Bid
            close SELL at Ask
            */
            if (OrderType()==OP_BUY) {
                price_close = Bid;
            } else {
                price_close = Ask;
            }
            ObjectCreate(objname, OBJ_VLINE, 0, OrderOpenTime(), 0);
            ObjectCreate(objname2, OBJ_ARROW, 0, OrderOpenTime(), OrderOpenPrice());
            ObjectSet(objname2, OBJPROP_ARROWCODE, SYMBOL_LEFTPRICE);
            ObjectCreate(objname3, OBJ_VLINE, 0, TimeCurrent(), 0);
            ObjectCreate(objname4, OBJ_ARROW, 0, TimeCurrent(), price_close);
           
            ObjectSet(objname4, OBJPROP_ARROWCODE, SYMBOL_RIGHTPRICE);
            ObjectCreate(objname5, OBJ_RECTANGLE, 0, OrderOpenTime(), OrderOpenPrice(), TimeCurrent(), price_close);
            
            if (OrderProfit()<0) {
                ObjectSet(objname5, OBJPROP_COLOR, C'0x5F, 0x00, 0x00');
            } else {
                ObjectSet(objname5, OBJPROP_COLOR, C'0x00, 0x5F, 0x00');                
            }

            /*
            if (OrderType()==OP_BUY) {
                ObjectSet(objname, OBJPROP_COLOR, C'0x00, 0x9F, 0x00');
                ObjectSet(objname2, OBJPROP_COLOR, C'0x00, 0x9F, 0x00');
                ObjectSet(objname3, OBJPROP_COLOR, C'0x00, 0x5F, 0x00');
                ObjectSet(objname4, OBJPROP_COLOR, C'0x00, 0x5F, 0x00');
                if (OrderProfit()<0) {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x00, 0x5F, 0x50');
                } else {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x00, 0x9F, 0x00');                
                }
            } else if (OrderType()==OP_SELL) {
                ObjectSet(objname, OBJPROP_COLOR, C'0x9F, 0x00, 0x00');
                ObjectSet(objname2, OBJPROP_COLOR, C'0x9F, 0x00, 0x00');
                ObjectSet(objname3, OBJPROP_COLOR, C'0x5F, 0x00, 0x00');
                ObjectSet(objname4, OBJPROP_COLOR, C'0x5F, 0x00, 0x00');
                if (OrderProfit()<0) {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x5F, 0x00, 0x50');
                } else {
                    ObjectSet(objname5, OBJPROP_COLOR, C'0x9F, 0x00, 0x00');                
                }
            }
            */
        }
    }

    Comment("DrawHistory " + N + " trades");
 
//----
   return(0);
}
//+------------------------------------------------------------------+