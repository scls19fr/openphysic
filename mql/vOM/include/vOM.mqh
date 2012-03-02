//+------------------------------------------------------------------+
//|                                                          vOM.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2005

//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);

// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import

//+------------------------------------------------------------------+
//| EX4 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex4"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+

#include <stderror.mqh>
#include <stdlib.mqh>

#define MY_SHORTNAME "vOM EA"
#define MY_LONGNAME "virtual Order Management (vOM) EA"
#define MY_VERSION "0.01-alpha"
#define MY_AUTHOR "Sebastien Celles"
#define MY_WEB "www.celles.net"
#define MY_RELEASE_DATE "2012/03/02"

#define GV_PREFIX "vOM_Ticket_" // Global Variable Prefix
#define OBJ_PREFIX "OBJ_vOM_" // Global Variable Prefix

extern bool SymbolsFilter = false;

extern bool OnlyTrailProfits = false;
extern double TrailingStopDist = 120; // 0 to switch off trailing stop
//double TrailingStopStep = 10;
//extern int TrailingSide = 0; // 0 broker side ; 1 client side

extern double BreakEven = 100; //150    // Profit Lock in points (pips for 4 digits brokers)
extern double BEOffset = 20;  //20  // Offset in points
//extern int BESide = 0; // 0 broker side ; 1 client side

bool filterOrdersBy() {    
    if (SymbolsFilter) {
        return ( OrderSymbol()==Symbol()  && ( OrderType()==OP_SELL || OrderType()==OP_BUY ) ); // have been fixed (more readable) !!!! OrderType()<=OP_SELL    
    } else {
        return ( OrderType()==OP_SELL || OrderType()==OP_BUY );
    }
}

int digit=0;
int slippage = 3; // pts
bool result;
int tryClose;

bool InputParametersOk() {
   //return(BreakEven>0 && Offset>0 && BreakEven>Offset);
   return(true);
   //return(false);
}

//int CalcDigits;

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

double getVarTicket(int ticket, string mode, double def_val=0.0) {
   string varname = GV_PREFIX+ticket+"-"+mode;
   
   double value;
   
   if(GlobalVariableCheck(varname)) {
      value = GlobalVariableGet(varname);
      //Comment("Get var "+varname+" = "+value);
   } else {
      /*
      string msg;
      msg = "Can't get var "+varname;
      //Comment(msg);
      Print(msg);
      */
      setVarTicket(ticket, mode, def_val);
   }

   return(value);
}

void setVarTicket(int ticket, string mode, double value) {
   string varname = GV_PREFIX+ticket+"-"+mode;
   if(GlobalVariableSet(varname,value)==0) {
      string msg = "Can't Set var "+varname+" to "+value;
      //Comment(msg);
      Print(msg);
   } else {
      //Comment("Set var "+varname+" to "+value);
   }
}

/*
void CreateTicketVarIfNotExists(int ticket, string mode, double value) {
   string varname = GV_PREFIX+ticket+"-"+mode;
   if(!GlobalVariableCheck(varname)) {
      //setVarTicket(ticket, mode, -1.0);
      //setVarTicket(ticket, mode, 0.0);
      setVarTicket(ticket, mode, value);
   }
}
*/

// ToDo : setVarTicket

string strComment = "";

void CommentClear(string def_str="") {
    strComment = def_str;
}

void CommentAddLine(string line) {
    strComment = strComment +  "\n" + line;
}

string getTitle() {
    return("\n" + MY_LONGNAME + " v" + MY_VERSION + " (" + MY_RELEASE_DATE + ")" + "\n" + MY_WEB + " by " + MY_AUTHOR + " " + "©" + "\n");
}

void CommentPrint() {
    string str = getTitle();

    int err=GetLastError();
    string strErr;
    if (err!=ERR_NO_ERROR && err!=1) {
        strErr = "error(" + err + "): " + ErrorDescription(err);
        Print(strErr);
    } else {
       strErr = "error(0)";
    }
    str = str + "\n" + strErr;
        
    string sep = " - ";

    str = str + "\n" + strComment;


    Comment(str);
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

void closeTicket(int ticket, double price) {
    result = false;
    tryClose = 0;
    
    while(!result) {
        result=OrderClose(ticket, OrderLots(), price, slippage, CLR_NONE);
        Print("Trying to close order #" + ticket + " at " + price); // after OrderClose to improve time of execution
        tryClose++;
        if (!result) {
          Print("Can't close order #" + ticket + "(" + tryClose + ")");
          //RefreshRates();
          if(OrderType()==OP_BUY) {
              price = MarketInfo(OrderSymbol(), MODE_BID); //Bid;
          } else {
              price = MarketInfo(OrderSymbol(), MODE_ASK); //Ask;
          }
          Print(GetLastError());
        }
    }

    cleanup_gv_obj(ticket);
}

void setStopLoss(int ticket, double price) {
    setStopLoss(ticket, price);
}

void setVirtualStopLoss(int ticket, double price) {
    //CreateTicketVarIfNotExists(ticket, "vSL", price);
    setVarTicket(ticket, "vSL", price);
}

void setVirtualTakeProfit(int ticket, double price) {
    //CreateTicketVarIfNotExists(ticket, "vTP", price);
    setVarTicket(ticket, "vTP", price);
}

double getStopLoss(int ticket){
    return(getVirtualStopLoss(ticket));
}

double getVirtualStopLoss(int ticket){
    return(getVarTicket(ticket, "vSL"));
}

double getVirtualTakeProfit(int ticket){
    return(getVarTicket(ticket, "vTP"));
}

void setBrokerStopLoss(int ticket, double SL) {
    result = OrderSelect(ticket, SELECT_BY_TICKET); // is it necessary ? ticket=OrderTicket() if order has been previously selected
    if (!result) {
        Print("Can't select ticket #" + ticket);
    }

    result = OrderModify( ticket, OrderOpenPrice(), SL, OrderTakeProfit(), 0, Red);
    if (result) {
        Print("Set SL to ticket #" + ticket + " at " + SL);
    } else {
        int err=GetLastError();
        if (err!=ERR_NO_ERROR && err!=1) {
            string strErr = "error(" + err + "): " + ErrorDescription(err);
            Print(strErr);
        }
    }
}

void setBrokerTakeProfit(int ticket, double TP) {
    result = OrderSelect(ticket, SELECT_BY_TICKET);
    if (!result) {
        Print("Can't select ticket #" + ticket);
    }

    result = OrderModify( OrderTicket(), OrderOpenPrice(), OrderStopLoss(), TP, 0, Red);
    if (result) {
        Print("Set TP to ticket #" + ticket + " at " + TP);
    } else {
        int err=GetLastError();
        if (err!=ERR_NO_ERROR && err!=1) {
            string strErr = "error(" + err + "): " + ErrorDescription(err);
            Print(strErr);
        }
    }
}

double getBrokerStopLoss(int ticket) {
    result = OrderSelect(ticket, SELECT_BY_TICKET);
    if (!result) {
        Print("Can't select ticket #" + ticket);
    }

    return(OrderStopLoss());
}

double getBrokerTakeProfit(int ticket) {
    result = OrderSelect(ticket, SELECT_BY_TICKET);
    if (!result) {
        Print("Can't select ticket #" + ticket);
    }

    return(OrderTakeProfit());
}


// State machine

// 0 : New trade (initial mode)
// 1 : BreakEven has been reached
// 2 : Trailing stop is on

void setMode(int ticket, int mode) {

}

int getMode(int ticket) {

}

void ModeChange() {
// order was previouly selected
// define the rules to change from a mode to an other

}

void ManageThisOrder() {
    int ticket = OrderTicket();

    //CreateTicketVarIfNotExists(ticket, "vSL", 0.0);
    //CreateTicketVarIfNotExists(ticket, "vTP", 0.0);

    string sep = "  - "; // \t
    
    double vSL = getVirtualStopLoss(ticket); //getVarTicket(ticket, "vSL");
    double vTP = getVirtualTakeProfit(ticket); //getVarTicket(ticket, "vTP");

    double point = MarketInfo(OrderSymbol(), MODE_POINT); // Point<>point fix 2012-02-29 (to have setup in points)
    int CalcDigits = MarketInfo(OrderSymbol(), MODE_DIGITS);
    //double point = PipPoint(OrderSymbol()); // to have setup in pips (instead of points)
    
    double newSL;
    //double newTP;
    
    double profit;


    if ( OrderType()==OP_BUY ) {
        double bid = MarketInfo(OrderSymbol(), MODE_BID); // bid (bid price for order symbol) <> Bid (bid price for EA symbol)
        profit = bid - OrderOpenPrice();
    
        // Virtual (stealth) Stop Loss
        if (bid<vSL && vSL>0) {
            closeTicket(ticket, bid);
        }

        // Virtual (stealth) Take Profit
        if (bid>vTP && vTP>0) {
            closeTicket(ticket, bid);
        }

        // Breakeven
//        Print("buy");
        if (BreakEven>0 && BEOffset>0 && BreakEven>BEOffset) {
            if ( profit >= point*BreakEven ) {
                newSL = OrderOpenPrice() + BEOffset*point;
                if (vSL<newSL) { // fix 2012-01-04
                    setVirtualStopLoss(ticket, newSL);
                }
            }
        }
        /*
        */

        
        // Trailing stop
        if (TrailingStopDist>0) {
            if (profit > point * TrailingStopDist || (!OnlyTrailProfits)) { // trail only if profit when OnlyTrailProfits is set to true
                newSL = bid - point * TrailingStopDist;
                if (vSL < newSL) { // change SL only if new SL is higher
                    setVirtualStopLoss(ticket, newSL);
                }
            }
        }

        
    }
    
    if ( OrderType()==OP_SELL ) {
        double ask = MarketInfo(OrderSymbol(), MODE_ASK); // ask (ask price for order symbol) <> Ask (ask price for EA symbol)
        profit = OrderOpenPrice() - ask;
 
         // Virtual (stealth) Stop Loss
        if (ask>vSL && vSL>0) {
            closeTicket(ticket, ask);
        }
        
        // Virtual (stealth) Take Profit
        if (ask<vTP && vTP>0) {
            closeTicket(ticket, ask);
        }

        // Breakeven
        if (BreakEven>0 && BEOffset>0 && BreakEven>BEOffset) {
            if ( profit >= point*BreakEven ) {
                newSL = OrderOpenPrice() - BEOffset*point;
                if (vSL>newSL || vSL==0) { // fix 2012-01-04 fix again 2012-02-09 (if no SL was previously set)
                    setVirtualStopLoss(ticket, newSL);
                }
            }
        }
        /*
        */

        // Trailing stop
        if (TrailingStopDist>0) {
            if (OrderOpenPrice() - ask > point * TrailingStopDist || (!OnlyTrailProfits)) { // trail only if profit when OnlyTrailProfits is set to true
                newSL = ask + point * TrailingStopDist;
                if (vSL > newSL || vSL==0.0) { // change SL only if new SL is lower
                    setVirtualStopLoss(ticket, newSL);
                }
            }
        }
         
        //ModeChange();
    }


    string str = "Ticket #" + ticket
     + sep + "Magic=" + OrderMagicNumber() + sep + OrderSymbol() + " " + getOrderTypeStr()
     + sep + "open=" + DoubleToStr(OrderOpenPrice(), CalcDigits)
     + sep + "lots=" + DoubleToStr(OrderLots(), 2)
     + sep + "SL=" + DoubleToStr(OrderStopLoss(), CalcDigits)
     + sep + "TP=" + DoubleToStr(OrderTakeProfit(), CalcDigits)
     + sep + "vSL=" + DoubleToStr(vSL, CalcDigits)
     + sep + "vTP=" + DoubleToStr(vTP, CalcDigits)
     + sep + "profit=" + DoubleToStr(profit/point, 1); // OrderProfit();

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

    // Draw line
    string objname;
    if ( vSL>0 ) {
        objname = OBJ_PREFIX+"vSL-"+ticket;
        if(ObjectFind(objname)==-1) {
            if (ObjectCreate(objname, OBJ_HLINE, 0, TimeCurrent(), vSL)) {
                Print("Create object "+objname);
                //ObjectSet(objname, OBJPROP_COLOR, C'0xFF, 0x40, 0x00'); // red
                ObjectSet(objname, OBJPROP_COLOR, C'0x00, 0x00, 0xFF'); // blue
                ObjectSet(objname, OBJPROP_STYLE, STYLE_DASHDOTDOT);
            } else {
                Print("Error: can't create object "+objname+"! code #",GetLastError());
            }
        }
        ObjectSet(objname, OBJPROP_PRICE1, vSL);
    }

    if ( vTP>0 ) {
        objname = OBJ_PREFIX+"vTP-"+ticket;
        if(ObjectFind(objname)==-1) {
            if (ObjectCreate(objname, OBJ_HLINE, 0, TimeCurrent(), vTP)) {
                Print("Create object "+objname);
                //ObjectSet(objname, OBJPROP_COLOR, C'0x40, 0xFF, 0x00'); // green
                ObjectSet(objname, OBJPROP_COLOR, C'0x00, 0x00, 0xFF'); // blue
                ObjectSet(objname, OBJPROP_STYLE, STYLE_DASHDOTDOT);
            } else {
                Print("Error: can't create object "+objname+"! code #",GetLastError());
            }
        }
        ObjectSet(objname, OBJPROP_PRICE1, vTP);
    }
}

void cleanup_gv_obj(int ticket) {
    string var;

    // Cleanup Global Variables
    var = GV_PREFIX+"vTP_"+ticket;
    Print("Del GV "+var);
    GlobalVariableDel(var);
    var = GV_PREFIX+"vSL_"+ticket;
    Print("Del GV "+var);
    GlobalVariableDel(var);
    
    // Cleanup Objects
    var = OBJ_PREFIX+"vTP_"+ticket;
    Print("Del OBJ "+var);
    ObjectDelete(var);
    var = OBJ_PREFIX+"vSL_"+ticket;
    Print("Del OBJ "+var);
    ObjectDelete(var);
}

// ---- Scan Trades
int ScanTrades() {
    int numords = 0;

    for (int i=0; i<OrdersTotal(); i++) {
        OrderSelect(i, SELECT_BY_POS);
        if ( filterOrdersBy() ) {
            numords++;
        }
    }
    return(numords);
}

void ManageOrders() {
    //CommentAddLine("Managing");
    
    for ( int i=0; i<OrdersTotal(); i++ ) {
        OrderSelect(i, SELECT_BY_POS);
        
     // uniquement si
    //  buy et SL actuel < nv SL
    //  sell et SL actuel > nv SL

        if ( filterOrdersBy() ) {
            ManageThisOrder();
        }
    }
}

void CleanupUnusedGlobalVariables() {
// ToFix : TP global var are not delete the first time script is run

    string name;
    int ticket;
    bool todelete;
    bool result;
    for(int i=0;i<GlobalVariablesTotal();i++) {
        name=GlobalVariableName(i);    
        if (StringFind(name, GV_PREFIX)==0) {
            //Print(i,": Global variable name - ",name);
            //Print("Test", );
            //ticket=StrToInteger(StringSubstr(name, StringLen(GV_PREFIX), StringFind(name, "-", StringLen(GV_PREFIX)) - StringLen(GV_PREFIX)));
            ticket=StrToInteger(StringSubstr(name, StringLen(GV_PREFIX), StringFind(name, "-")-StringLen(GV_PREFIX)));
            //Print(ticket);
            todelete = true;
            for ( int j=0; j<OrdersTotal(); j++ ) {
                OrderSelect(j, SELECT_BY_POS);
                if (ticket==OrderTicket()) {
                    todelete = false;
                }
            }

            if (todelete) {
                Print("Global variable ", name, " should be deleted");
                result=GlobalVariableDel(name);
                if(!result) {
                    Print("Can't del global variable ",name, " err: ",GetLastError());
                }  
            } else {
                Print("Global variable ", name, " shouldn't be deleted");
            }
        } else {
            Print(name, " is not a good variable");
        }
    }
}

void CleanupUnusedObjects() {
    string name;
    int ticket;
    bool todelete;
    bool result;
    for(int i=0;i<ObjectsTotal();i++) {
        name=ObjectName(i);
        if (StringFind(name, OBJ_PREFIX)==0) {
            Print("Object name for object #",i," is " + name);
            ticket=StrToInteger((StringSubstr(name, StringFind(name, "-")+1)));

            todelete = true;
            for ( int j=0; j<OrdersTotal(); j++ ) {
                OrderSelect(j, SELECT_BY_POS);
                if (ticket==OrderTicket()) {
                    todelete = false;
                }
            }

            if (todelete) {
                Print("Object ", name, " should be deleted");
                result=ObjectDelete(name);
                if(!result) {
                    Print("Can't del object ",name, " err: ",GetLastError());
                }  
            } else {
                Print("Object ", name, " shouldn't be deleted");
            }


        } else {
            Print(name, " is not a good object");
        }
    }
}

int NewOrder(string symbol, int mode, double lots, double price, int slippage, double p_SL, double p_TP, double p_vSL, double p_vTP, string comment) {       
  //int OrderSend( 	string symbol, int cmd, double volume, double price, int slippage, double stoploss, double takeprofit, string comment=NULL, int magic=0, datetime expiration=0, color arrow_color=CLR_NONE)

  int ticket;
  ticket=OrderSend(symbol, mode, lots, price, slippage, p_SL, p_TP, comment);
  if(ticket<0) {
    Print("OrderSend failed with error #",GetLastError());
    return(0);
  }

  bool result = false;
  result = OrderSelect(ticket, SELECT_BY_TICKET, MODE_TRADES);
  if (result) {
    setVirtualStopLoss(ticket, p_vSL);
    setVirtualTakeProfit(ticket, p_vTP);
  } else {
    Print("Can't select order #"+ticket);
  }
  
  return(ticket);
}