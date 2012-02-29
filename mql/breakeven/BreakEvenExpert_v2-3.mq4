//+------------------------------------------------------------------+
//|                                           BreakEvenExpert_v2.mq4 |
//|                                Copyright (c) 2006, Forex-TSD.com |
//|                         Written by IgorAD,igorad2003@yahoo.co.uk |
//|            http://finance.groups.yahoo.com/group/TrendLaboratory |
//|           Modified in 2011 by Sebastien Celles s.celles@gmail.com|
//|                                             http://www.celles.net|
//|                                              add feature : Offset|
//+------------------------------------------------------------------+
#property copyright "Copyright (c) 2006, Forex-TSD.com "
#property link      "http://www.forex-tsd.com/"

#include <stderror.mqh>
#include <stdlib.mqh>

//to fix : le breakeven ne devrait être appliqué qu'une seule fois
//  pb : si on met un trailing stop il est modifié par le BreakEven
//to do : add 5 digits broker support

//---- input parameters

extern double BreakEven = 15.0; //15.0    // Profit Lock in pips
extern double Offset = 2.0;  //2.0  // Offset in pips

int digit=0;

bool flagInputParametersOk = false;
bool result = false;

//int BE[];
//double vSL[];
//double vTP[];
double SL;
//double TP;

//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init() {
    if ( !(BreakEven>0 && Offset>0 && BreakEven>Offset) ) {
        string str = "Inputs must comply with these conditions :\n * BreakEven>0\n * Offset>0\n * BreakEven>Offset";
        //Print(str);
        //Comment(str);
        Alert(str);
        //Exit();
        //deinit();
        flagInputParametersOk = false;
    } else {
        flagInputParametersOk = true;
    }
    
    //UsePoint = PipPoint(Symbol());
    // use UsePoint instead of Point... but Point is not a good idea as there is differents symbols
    
    return(0);
}

// Pip Point Function
double PipPoint(string symbol) {
    int CalcDigits = MarketInfo(symbol, MODE_DIGITS);
    if(CalcDigits == 2 || CalcDigits == 3) {
        double CalcPoint = 0.01;
    } else if(CalcDigits == 4 || CalcDigits == 5) {
        CalcPoint = 0.0001;
    }
    return(CalcPoint);
}

string strComment = "";

void CommentClear() {
    strComment = "";
}

void CommentAddLine(string line) {
    strComment = strComment +  "\n" + line;
}

void CommentPrint() {
    string str = "\n" + "Breakeven EA v2" + "\n";

    int err=GetLastError();
    if (err!=ERR_NO_ERROR && err!=1) {
        string strErr = "error(" + err + "): " + ErrorDescription(err);
        Print(strErr);
        str = str + "\n" + strErr;
    }

    string sep = " - ";
    str = str + "\n";
    str = str + "  Digits = " + digit;
    str = str + sep + "  BreakEven = " + BreakEven;
    str = str + sep + "  Offset = " + Offset;

    str = str + "\n" + strComment;


    Comment(str);
    //ObjectCreate("klc", OBJ_LABEL, 0, 0, 0);
    //ObjectSetText("klc", strComment, 9, "System", Red);

}

string getOrderTypeStr() {
    if (OrderType()==OP_BUY) {
        return("BUY ");
    } else if (OrderType()==OP_SELL) {
        return("SELL");
    } else {
        return("****");
    }
}

void PrintOrder() {
    int ticket = OrderTicket();
    string sep = "  - "; // \t
    string str = "Ticket #" + ticket
     + sep + "Magic=" + OrderMagicNumber() + sep + OrderSymbol() + " " + getOrderTypeStr()
     + sep + "open=" + OrderOpenPrice()
     + sep + "SL=" + OrderStopLoss() + sep + "TP=" + OrderTakeProfit();

    /*
    string strMode;
    if (BE[ticket]==0) {
        strMode = "0-NB";
    } else {
        strMode = "1-BE";
    }
    */
    //Print(str);

    //str = str + sep + strMode;
    //str = str + sep + BE[ticket];

    CommentAddLine(str);
}

/*

void setTakeProfit() {

}

void setVirtualStopLoss() {
+ drawline
}

void setVirtualTakeProfit() {
+ drawline
}

void setBrokerStopLoss() {
+ drawline
}

void setBrokerTakeProfit() {
+ drawline
}

void setBreakEven() {

}
*/

void setStopLoss(double SL, color col) {
    Print("Modify broker Stop Loss to " + SL);
    result = OrderModify( OrderTicket(), OrderOpenPrice(), SL, OrderTakeProfit(), 0, col);
    CommentAddLine("  BreakEven "+getOrderTypeStr()+" #"+OrderTicket() + " at " + SL);
}

bool filterOrdersBy() {
    return ( OrderType()==OP_SELL || OrderType()==OP_BUY );
//    return ( OrderSymbol()==Symbol()  && ( OrderType()==OP_SELL || OrderType()==OP_BUY ) ); // have been fixed (more readable) !!!! OrderType()<=OP_SELL
}


// ---- Trailing Stops
void TrailStops() {
    int total=OrdersTotal();
    for ( int cnt=0; cnt<total; cnt++ ) {
        OrderSelect(cnt, SELECT_BY_POS);
        
     // uniquement si
    //  buy et SL actuel < nv SL
    //  sell et SL actuel > nv SL


        if ( filterOrdersBy() ) {
            //double point = MarketInfo(OrderSymbol(), MODE_POINT); // Point<>point fix 2012-02-29
            double point = PipPoint(OrderSymbol()); // to have setup in pips (instead of points)
        
            if ( OrderType()==OP_BUY ) {
                double bid = MarketInfo(OrderSymbol(),MODE_BID); // bid (bid price for order symbol) <> Bid (bid price for EA symbol) fix 2012-02-28
                
                if ( bid-OrderOpenPrice() >= point*BreakEven ) {
                    SL = NormalizeDouble(OrderOpenPrice() + Offset*point, digit);
                    if (OrderStopLoss()<SL) { // fix 2012-01-04
                        setStopLoss(SL, LightGreen);
                    }
                }
            }
            if ( OrderType()==OP_SELL ) {
                double ask = MarketInfo(OrderSymbol(), MODE_ASK); // ask (ask price for order symbol) <> Ask (ask price for EA symbol) fix 2012-02-28
                if ( OrderOpenPrice()-ask >= point*BreakEven ) {
                    SL = NormalizeDouble( OrderOpenPrice() - Offset*point, digit );
                    if (OrderStopLoss()>SL || OrderStopLoss()==0) { // fix 2012-01-04 fix again 2012-02-09 (if no SL was previously set)
                        setStopLoss(SL, Yellow);
                    }
                }
            }

            PrintOrder();

        }
    }
}

// ---- Scan Trades
int ScanTrades() {
    int total = OrdersTotal();
    int numords = 0;

    for (int cnt=0; cnt<total; cnt++) {
        OrderSelect(cnt, SELECT_BY_POS);
        if ( filterOrdersBy() )
            numords++;
    }
    return(numords);
}


//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit() {
    //----
    //WindowRedraw();
    //Comment("");

    //----
    return(0);
}
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start() {
    digit  = MarketInfo(Symbol(),MODE_DIGITS);

    CommentClear();

    if ( flagInputParametersOk ) {

        if ( ScanTrades()<1 ) {
            //return(0);
            CommentAddLine("No orders to manage");
        } else {
            //Print("Trailing");
            TrailStops();
//            Sleep(2000);
        }

    } else {
        string str = "Setup parameters aren't valid.";
        Print(str);
        CommentAddLine(str);
    }

    CommentPrint();

    return(0);
}//int start
//+------------------------------------------------------------------+