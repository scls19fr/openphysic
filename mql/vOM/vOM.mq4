//+------------------------------------------------------------------+
//|                                                          vOM.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"


#include <vOM.mqh>

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
//----
    digit  = MarketInfo(Symbol(),MODE_DIGITS);

    CommentClear();

    if ( InputParametersOk() ) {

        if ( ScanTrades()<1 ) {
            CommentAddLine("No orders to manage");
        } else {
            ManageOrders();
        }

    } else {
        string str = "Setup parameters aren't valid.";
        Print(str);
        CommentAddLine(str);
    }

    CommentPrint();

    return(0);   
//----
   return(0);
  }
//+------------------------------------------------------------------+