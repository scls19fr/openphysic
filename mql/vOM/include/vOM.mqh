//+------------------------------------------------------------------+
//|                                                          vOM.mq4 |
//|                               Copyright � 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright � 2012, Sebastien Celles"
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
#define MY_VERSION "0.1"
#define MY_AUTHOR "Sebastien Celles"
#define MY_WEB "ww.celles.net"
#define MY_RELEASE_DATE "2012/02/29"

#define GV_PREFIX "vOM_Ticket_" // Global Variable Prefix
#define OBJ_PREFIX "OBJ_vOM_" // Global Variable Prefix


bool filterOrdersBy() {
    return ( OrderType()==OP_SELL || OrderType()==OP_BUY );
//    return ( OrderSymbol()==Symbol()  && ( OrderType()==OP_SELL || OrderType()==OP_BUY ) ); // have been fixed (more readable) !!!! OrderType()<=OP_SELL
}

int digit=0;
int slippage = 3;
bool result;
int tryClose;

bool InputParametersOk() {
   //return(BreakEven>0 && Offset>0 && BreakEven>Offset);
   return(true);
   //return(false);
}  

double getVarTicket(int ticket, string mode) {
   string varname = GV_PREFIX+ticket+"_"+mode;
   
   double value;
   
   if(GlobalVariableCheck(varname)) {
      value = GlobalVariableGet(varname);
      //Comment("Get var "+varname+" = "+value);
   } else {
      string msg;
      msg = "Can't get var "+varname;
      //Comment(msg);
      Print(msg);
   }

   return(value);
}

void setVarTicket(int ticket, string mode, double value) {
   string varname = GV_PREFIX+ticket+"_"+mode;
   if(GlobalVariableSet(varname,value)==0) {
      string msg = "Can't Set var "+varname+" to "+value;
      //Comment(msg);
      Print(msg);
   } else {
      //Comment("Set var "+varname+" to "+value);
   }
}

void CreateTicketVarIfNotExists(int ticket, string mode, double price) {
   string varname = GV_PREFIX+ticket+"_"+mode;
   if(!GlobalVariableCheck(varname)) {
      //setVarTicket(ticket, mode, -1.0);
      //setVarTicket(ticket, mode, 0.0);
      setVarTicket(ticket, mode, price);
   }
}

string strComment = "";

void CommentClear() {
    strComment = "";
}

void CommentAddLine(string line) {
    strComment = strComment +  "\n" + line;
}

string getTitle() {
    return("\n" + MY_LONGNAME + " v" + MY_VERSION + " (" + MY_RELEASE_DATE + ")" + "\n" + MY_WEB + " by " + MY_AUTHOR + " " + "(c)" + "\n");
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

void closeTicket(double price) {
    result = false;
    tryClose = 0;
    
    while(!result) {
        result=OrderClose(OrderTicket(), OrderLots(), price, slippage, CLR_NONE);
        Print("Trying to close order #" + OrderTicket() + " at " + price); // after OrderClose to improve time of execution
        tryClose++;
        if (!result) {
          Print("Can't close order #" + OrderTicket() + "(" + tryClose + ")");
          //RefreshRates();
          if(OrderType()==OP_BUY) {
              price=MarketInfo(OrderSymbol(),MODE_BID); //Bid;
          } else {
              price=MarketInfo(OrderSymbol(),MODE_ASK); //Ask;
          }
          Print(GetLastError());
        }
    }

    cleanup_gv_obj(OrderTicket());
}

void setVirtualStopLoss(int ticket, double price) {
    //CreateTicketVarIfNotExists(ticket, "vSL", price);
    setVarTicket(ticket, "vSL", price);
}

void setVirtualTakeProfit(int ticket, double price) {
    //CreateTicketVarIfNotExists(ticket, "vTP", price);
    setVarTicket(ticket, "vTP", price);
}

double getVirtualStopLoss(int ticket){
    return(getVarTicket(ticket, "vSL"));
}

double getVirtualTakeProfit(int ticket){
    return(getVarTicket(ticket, "vTP"));
}

void setBrokerStopLoss(int ticket, double SL) {
    result = OrderSelect(ticket, SELECT_BY_TICKET);
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

void ManageThisOrder() {
    int ticket = OrderTicket();

    CreateTicketVarIfNotExists(ticket, "vSL", 0.0);
    CreateTicketVarIfNotExists(ticket, "vTP", 0.0);

    string sep = "  - "; // \t
    
    double vSL = getVirtualStopLoss(ticket); //getVarTicket(ticket, "vSL");
    double vTP = getVirtualTakeProfit(ticket); //getVarTicket(ticket, "vTP");
    
    string str = "Ticket #" + ticket
     + sep + "Magic=" + OrderMagicNumber() + sep + OrderSymbol() + " " + getOrderTypeStr()
     + sep + "open=" + OrderOpenPrice()
     + sep + "lots=" + OrderLots()
     + sep + "SL=" + OrderStopLoss()
     + sep + "TP=" + OrderTakeProfit()
     + sep + "vSL=" + vSL
     + sep + "vTP=" + vTP;

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
        objname = OBJ_PREFIX+"vSL_"+ticket;
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
        objname = OBJ_PREFIX+"vTP_"+ticket;
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



    if ( OrderType()==OP_BUY ) {
        double bid = MarketInfo(OrderSymbol(),MODE_BID); // bid (bid price for order symbol) <> Bid (bid price for EA symbol)
    
        // Virtual (stealth) Stop Loss
        if (bid<vSL && vSL>0) {
            closeTicket(bid);
        }

        // Virtual (stealth) Take Profit
        if (bid>vTP && vTP>0) {
            closeTicket(bid);
        }

        /*
        // Breakeven
        double bid = MarketInfo(OrderSymbol(),MODE_BID); // bid (bid price for order symbol) <> Bid (bid price for EA symbol)
        if ( bid-OrderOpenPrice() >= Point*BreakEven ) {
            SL = NormalizeDouble(OrderOpenPrice() + Offset*Point, digit);
            if (OrderStopLoss()<SL) { // fix 2012-01-04
                setStopLoss(SL, LightGreen);
            }
        }
        */
    }
    
    if ( OrderType()==OP_SELL ) {
        double ask = MarketInfo(OrderSymbol(), MODE_ASK); // ask (ask price for order symbol) <> Ask (ask price for EA symbol)
 
         // Virtual (stealth) Stop Loss
        if (ask>vSL && vSL>0) {
            closeTicket(ask);
        }
        
        // Virtual (stealth) Take Profit
        if (ask<vTP && vTP>0) {
            closeTicket(ask);
        }

        /*
        // Breakeven
        double ask = MarketInfo(OrderSymbol(), MODE_ASK); // ask (ask price for order symbol) <> Ask (ask price for EA symbol)
        if ( OrderOpenPrice()-ask >= Point*BreakEven ) {
            SL = NormalizeDouble( OrderOpenPrice() - Offset*Point, digit );
            if (OrderStopLoss()>SL) { // fix 2012-01-04
                setStopLoss(SL, Yellow);
            }
        }
        */
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
    int total = OrdersTotal();
    int numords = 0;

    for (int cnt=0; cnt<total; cnt++) {
        OrderSelect(cnt, SELECT_BY_POS);
        if ( filterOrdersBy() ) {
            numords++;
        }
    }
    return(numords);
}

void ManageOrders() {
    //CommentAddLine("Managing");
    
    int total=OrdersTotal();
    for ( int cnt=0; cnt<total; cnt++ ) {
        OrderSelect(cnt, SELECT_BY_POS);
        
     // uniquement si
    //  buy et SL actuel < nv SL
    //  sell et SL actuel > nv SL

        if ( filterOrdersBy() ) {
            ManageThisOrder();
        }
    }
}

void CleanupUnusedGlobalVariables() {
// ToDo
    int var_total=GlobalVariablesTotal();
    Print("Global Variables Total=",GlobalVariablesTotal());
    string name;
    for(int i=0;i<var_total;i++) {
        name=GlobalVariableName(i);
        Print(i,": Global variable name - ",name);
    }
}

void CleanupUnusedObjects() {
// ToDo
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