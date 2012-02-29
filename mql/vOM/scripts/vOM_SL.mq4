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

#include <vOM.mqh>

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
    int ticket;
    double SL;
    string str;

    //ticket = 150790301;
    str = InputBox("Ticket#=", "Ticket", "");
    ticket = StrToInteger(str);

    result = OrderSelect(ticket, SELECT_BY_TICKET);
   
    if (result) {
        //SL = 0.02;
        str = InputBox("SL=", "Stop Loss", "");
        SL = StrToDouble(str);
        setVirtualStopLoss(ticket, SL);
    } else {
        Comment("ticket #"+ticket+" doesn't exists");   
    }

    return(0);
}
//+------------------------------------------------------------------+