//+------------------------------------------------------------------+
//|                                                       BOM_SL.mq4 |
//|                                                 Copyright © 2011 |
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

void setBrokerStopLoss(double SL, color col) {
    result = OrderModify( OrderTicket(), OrderOpenPrice(), SL, OrderTakeProfit(), 0, col);
    if (result) {
        Comment("Set SL to ticket #"+OrderTicket() + " at " + SL);
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
    double SL;
    string str;

    //ticket = 150790301;
    str = InputBox("Order=", "Ticket", "");
    ticket = StrToInteger(str);

    result = OrderSelect(ticket, SELECT_BY_TICKET);
   
    if (result) {
        //SL = 0.02;
        str = InputBox("SL=", "Stop Loss", "");
        SL = StrToDouble(str);
        setBrokerStopLoss(SL,Red);
    } else {
        Comment("ticket #"+ticket+" doesn't exists");   
    }

    return(0);
}
//+------------------------------------------------------------------+