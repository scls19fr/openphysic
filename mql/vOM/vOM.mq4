//+------------------------------------------------------------------+
//|                                                          vOM.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"


#include <vOM.mqh>

//double UsePoint;

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
    //UsePoint = PipPoint(Symbol());
    // use UsePoint instead of Point... but Point is not a good idea as there is differents symbols
    

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
        str = str + "\n" + "BreakEven ON: BreakEven>0 and Offset>=0 and BreakEven>BEOffset or BreakEven OFF: BreakEven=0";
        str = str + "\n" + "TrailingStop ON: TrailingStopDist>0 or TrailingStop OFF: TrailingStopDist=0";
        Print(str);
        CommentAddLine(str);
    }

    CommentPrint();

    return(0);   
//----
   return(0);
  }
//+------------------------------------------------------------------+