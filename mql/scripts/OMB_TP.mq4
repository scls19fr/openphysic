//+------------------------------------------------------------------+
//|                                                       BOM_SL.mq4 |
//|                      Copyright © 2011, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"


#include <stderror.mqh>
#include <stdlib.mqh>
//#include <WinUser32.mqh> // msgbox

#import "inputbox.dll"
    string InputBox(string prompt, string title, string default_value);
#import

bool result = false;

void setBrokerTakeProfit(double TP, color col) {
    result = OrderModify( OrderTicket(), OrderOpenPrice(), OrderStopLoss(), TP, 0, col);
    if (result) {
        Comment("Set TP to ticket #"+OrderTicket() + " at " + TP);
    } else {
        int err=GetLastError();
        if (err!=ERR_NO_ERROR && err!=1) {
            string strErr = "error(" + err + "): " + ErrorDescription(err);
            Comment(strErr);
        }
    }
}

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
    int ticket;
    double TP;
    string str;

    //ticket = 150790301;
    str = InputBox("Order=", "Ticket", "");
    ticket = StrToInteger(str);

    result = OrderSelect(ticket, SELECT_BY_TICKET);
   
    if (result) {
        //SL = 0.02;
        str = InputBox("TP=", "Take Profit", "");
        TP = StrToDouble(str);
        setBrokerTakeProfit(TP,Green);
    } else {
        Comment("ticket #"+ticket+" doesn't exists");   
    }

    return(0);
}
//+------------------------------------------------------------------+