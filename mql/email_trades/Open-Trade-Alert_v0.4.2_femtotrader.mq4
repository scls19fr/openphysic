#property indicator_chart_window
datetime dt;
int temp;
int oldtemp;

extern string CommentProg0 = "===============";

extern string CommentProgName = "Email Alert Indicator";
extern string CommentProgVersion = "0.4.2";
extern string CommentProgAuthor0 = "Dmitry Reznikov";
extern string CommentProgAuthor1 = "FemtoTrader";

extern string CommentProg1 = "===============";

extern string CommentTitle = "=== Notifications ===";
extern string Title = "[VPS Mail][AAAFX]";
extern bool EmailNotification = TRUE;
extern bool PushNotification = TRUE;
extern bool AlertNotification = FALSE;
//extern bool SoundNotification = TRUE;
//extern string SoundFilename = "alert.wav";

extern string CommentSymbols = "=== Symbols ===";
extern bool NotifyOnlyOnChartSymbol = FALSE;
//extern string NotifySymbolsList = "EURUSD,USDJPY"; // ToDo (split, ...)

extern string CommentOpen = "=== Open ===";
extern bool NotifyOpenBuy = TRUE;
extern bool NotifyOpenSell = TRUE;

extern string CommentClose = "=== Close ===";
extern bool NotifyCloseBuy = TRUE;
extern bool NotifyCloseSell = TRUE;

extern string CommentOpenPending= "=== Open Pending ===";
extern bool NotifyOpenBuyLimit = TRUE;
extern bool NotifyOpenSellLimit = TRUE;
extern bool NotifyOpenBuyStop = TRUE;
extern bool NotifyOpenSellStop = TRUE;

extern string CommentClosePending= "=== Close Pending ===";
extern bool NotifyCloseBuyLimit = TRUE;
extern bool NotifyCloseSellLimit = TRUE;
extern bool NotifyCloseBuyStop = TRUE;
extern bool NotifyCloseSellStop = TRUE;

extern string CommentDeletePending= "=== Delete Pending ===";
extern bool NotifyDeleteBuyLimit = TRUE;
extern bool NotifyDeleteSellLimit = TRUE;
extern bool NotifyDeleteBuyStop = TRUE;
extern bool NotifyDeleteSellStop = TRUE;

/* OpenPending ClosePending DeletePending */
/* ModifyTP ModifySL */

string strTitle;

void SendNotifications(string subject, string message)
{
    if (EmailNotification) SendMail(subject, message);
    if (PushNotification) SendNotification(subject + "\n" + message); // need MetaQuotes ID - support only MT4>=v4.00 build 427
    if (AlertNotification) Alert(message);
    //if (SoundNotification) PlaySound(SoundFilename);
}

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
{
    //---- indicators
    dt = Time[0];
    //oldtemp = 0;
    oldtemp = OrdersTotal(); // modif by if loaded with opened trades

    strTitle = Title + "[" + AccountNumber() + "]" + " ";

}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
{
    //----
    
    //----
    return(0);
}
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
{
    bool ret = True;
       
    if (NotifyOnlyOnChartSymbol) {
        temp = 0;
        for (int i=0;i<OrdersTotal();i++)
        {
            if (OrderSymbol() == Symbol()) {
                ret = OrderSelect(i, SELECT_BY_POS, MODE_TRADES);
                temp++;
            }
        }
        
        if (temp<oldtemp  || temp==0) {
            ret = OrderSelect(OrdersHistoryTotal()-1, SELECT_BY_POS, MODE_HISTORY); // last history order
            if (OrderSymbol() != Symbol()) {
                ret = false;
            }
        } else {
        
        }
        
    } else { /* === FemtoTrader : notif for any symbols */
        temp = OrdersTotal();
        
        if (temp<oldtemp  || temp==0) {
            ret = OrderSelect(OrdersHistoryTotal()-1, SELECT_BY_POS, MODE_HISTORY); // last history order
        } else {
            ret = OrderSelect(temp-1, SELECT_BY_POS, MODE_TRADES); // last trade order
        }
    }
    
    //if
    

    string msg;
    msg = CommentProgName + " " + "v"+CommentProgVersion+"\n"+CommentProgAuthor0+" modif by "+CommentProgAuthor1+"\n"+oldtemp+"/"+temp;
    if (oldtemp != temp) {
        msg = msg + "\n" + "Send Email for Ticket#: "+OrderTicket();
        msg = msg + "\n" + "OrderType: " + OrderTypeToStr(OrderType());
        msg = msg + "\n" + "OrderCloseTime: " + OrderCloseTime();
        //msg = msg + "\n" + "Test: " + (NotifyPendingBuyLimit && OrderType()==OP_BUYLIMIT);
        //Alert(msg); // debug only
    }
    Comment(msg);

    if (oldtemp != temp && ret) { // to be fixed (oldtemp!=temp) oldtemp<temp  && ret
        //SendNotifications("New event","New event");
    
        string ordertyp;
        double x=OrderOpenPrice(),y=OrderClosePrice(),pips;
        pips = y-x; //MathAbs(y - x);
        //pips = pips * 10000; // ToFix for xxxJPY
        double point = PipPoint(OrderSymbol());
        pips = pips/point;
        
        if(NotifyOpenBuy && ( OrderType()==OP_BUY ) && ( OrderCloseTime()==0 ) ) {
            ordertyp="OPEN BUY";
            msg = msg + "\n" + ordertyp;
            SendNotifications(strTitle+ordertyp+" "+DoubleToStr(OrderLots(),2)+" "+OrderSymbol()+"@"+DoubleToStr(OrderOpenPrice(),5)+", bal: "+DoubleToStr(AccountBalance(),2)+", eq: "+DoubleToStr(AccountEquity(),2)+", "+OrderComment()+"",
            "Symbol: "+Symbol()+" "+ordertyp+" \n"+
            "MagicNumber: "+OrderMagicNumber()+" \n"+
            "Comment: "+OrderComment()+" \n"+
            "Ticket#: "+OrderTicket()+" \n"+
            "Size: "+DoubleToStr(OrderLots(),2)+" \n"+
            "===================="+" \n"+
            "OpenTime: "+TimeToStr(OrderOpenTime())+" \n"+
            "OpenPrice: "+DoubleToStr(OrderOpenPrice(),5)+" \n"+
            "OrderStopLoss: "+DoubleToStr(OrderStopLoss(),5)+" \n"+
            "OrderTakeProfit: "+DoubleToStr(OrderTakeProfit(),5)+" \n"+
            //"===================="+" \n"+
            //      "CloseTime: "+TimeToStr(OrderCloseTime())+" \n"+
            //      "ClosePrice: "+DoubleToStr(OrderClosePrice(),5)+" \n"+
            //      "Profit: "+DoubleToStr(OrderProfit(),2)+" \n"+
            //      "Pips: "+DoubleToStr(pips,1)+" \n\n"+
            "===================="+" \n"+
            "Balance: "+DoubleToStr(AccountBalance(),2)+" \n"+
            "Used Margin: "+DoubleToStr(AccountMargin(),2)+" \n"+
            "Free Margin: "+DoubleToStr(AccountFreeMargin(),2)+" \n"+
            "Equity: "+DoubleToStr(AccountEquity(),2)+" \n"+
            "Open Orders: "+DoubleToStr(OrdersTotal(),0)+" \n\n"+
            "Broker: "+AccountCompany()+" \n"+
            "Leverage: "+AccountLeverage()+"" );
        }
        
        if(NotifyOpenSell && ( OrderType()==OP_SELL ) && ( OrderCloseTime()==0 ) ) {
            ordertyp="OPEN SELL";
            msg = msg + "\n" + ordertyp;
            SendNotifications(strTitle+ordertyp+" "+DoubleToStr(OrderLots(),2)+" "+OrderSymbol()+"@"+DoubleToStr(OrderOpenPrice(),5)+", bal: "+DoubleToStr(AccountBalance(),2)+", eq: "+DoubleToStr(AccountEquity(),2)+", "+OrderComment()+"",
            "Symbol: "+Symbol()+" "+ordertyp+" \n"+
            "MagicNumber: "+OrderMagicNumber()+" \n"+
            "Comment: "+OrderComment()+" \n"+
            "Ticket#: "+OrderTicket()+" \n"+
            "Size: "+DoubleToStr(OrderLots(),2)+" \n"+
            "===================="+" \n"+
            "OpenTime: "+TimeToStr(OrderOpenTime())+" \n"+
            "OpenPrice: "+DoubleToStr(OrderOpenPrice(),5)+" \n"+
            "OrderStopLoss: "+DoubleToStr(OrderStopLoss(),5)+" \n"+
            "OrderTakeProfit: "+DoubleToStr(OrderTakeProfit(),5)+" \n"+
            //"===================="+" \n"+
            //      "CloseTime: "+TimeToStr(OrderCloseTime())+" \n"+
            //      "ClosePrice: "+DoubleToStr(OrderClosePrice(),5)+" \n"+
            //      "Profit: "+DoubleToStr(OrderProfit(),2)+" \n"+
            //      "Pips: "+DoubleToStr(pips,1)+" \n\n"+
            "===================="+" \n"+
            "Balance: "+DoubleToStr(AccountBalance(),2)+" \n"+
            "Used Margin: "+DoubleToStr(AccountMargin(),2)+" \n"+
            "Free Margin: "+DoubleToStr(AccountFreeMargin(),2)+" \n"+
            "Equity: "+DoubleToStr(AccountEquity(),2)+" \n"+
            "Open Orders: "+DoubleToStr(OrdersTotal(),0)+" \n\n"+
            "Broker: "+AccountCompany()+" \n"+
            "Leverage: "+AccountLeverage()+"" );
        }
        
        if(NotifyCloseBuy && ( OrderType()==OP_BUY ) && ( OrderCloseTime()!=0 ) ) {
            ordertyp="CLOSE BUY";
            msg = msg + "\n" + ordertyp;
            SendNotifications(strTitle+ordertyp+" $: "+DoubleToStr(OrderProfit(),2)+" "+OrderSymbol()+"@"+DoubleToStr(OrderClosePrice(),5)+", bal: "+DoubleToStr(AccountBalance(),2)+", eq: "+DoubleToStr(AccountEquity(),2)+", mar: "+DoubleToStr(AccountMargin(),2)+", "+OrderComment()+"",
            "Symbol: "+Symbol()+" "+ordertyp+" \n"+
            "MagicNumber: "+OrderMagicNumber()+" \n"+
            "Comment: "+OrderComment()+" \n"+
            "Ticket#: "+OrderTicket()+" \n"+
            "Size: "+DoubleToStr(OrderLots(),2)+" \n"+
            "===================="+" \n"+
            "OpenTime: "+TimeToStr(OrderOpenTime())+" \n"+
            "OpenPrice: "+DoubleToStr(OrderOpenPrice(),5)+" \n"+
            "OrderStopLoss: "+DoubleToStr(OrderStopLoss(),5)+" \n"+
            "OrderTakeProfit: "+DoubleToStr(OrderTakeProfit(),5)+" \n"+
            "===================="+" \n"+
            "CloseTime: "+TimeToStr(OrderCloseTime())+" \n"+
            "ClosePrice: "+DoubleToStr(OrderClosePrice(),5)+" \n"+
            "Profit: "+DoubleToStr(OrderProfit(),2)+" \n"+
            "Pips: "+DoubleToStr(pips,1)+" \n\n"+
            "===================="+" \n"+
            "Balance: "+DoubleToStr(AccountBalance(),2)+" \n"+
            "Used Margin: "+DoubleToStr(AccountMargin(),2)+" \n"+
            "Free Margin: "+DoubleToStr(AccountFreeMargin(),2)+" \n"+
            "Equity: "+DoubleToStr(AccountEquity(),2)+" \n"+
            "Open Orders: "+DoubleToStr(OrdersTotal(),0)+" \n\n"+
            "Broker: "+AccountCompany()+" \n"+
            "Leverage: "+AccountLeverage()+"" );
        }
        
        if(NotifyCloseSell && ( OrderType()==OP_SELL ) && ( OrderCloseTime()!=0 ) ) {
            ordertyp="CLOSE SELL";
            msg = msg + "\n" + ordertyp;
            SendNotifications(strTitle+ordertyp+" $: "+DoubleToStr(OrderProfit(),2)+" "+OrderSymbol()+"@"+DoubleToStr(OrderClosePrice(),5)+", bal: "+DoubleToStr(AccountBalance(),2)+", eq: "+DoubleToStr(AccountEquity(),2)+", mar: "+DoubleToStr(AccountMargin(),2)+", "+OrderComment()+"",
            "Symbol: "+Symbol()+" "+ordertyp+" \n"+
            "MagicNumber: "+OrderMagicNumber()+" \n"+
            "Comment: "+OrderComment()+" \n"+
            "Ticket#: "+OrderTicket()+" \n"+
            "Size: "+DoubleToStr(OrderLots(),2)+" \n"+
            "===================="+" \n"+
            "OpenTime: "+TimeToStr(OrderOpenTime())+" \n"+
            "OpenPrice: "+DoubleToStr(OrderOpenPrice(),5)+" \n"+
            "OrderStopLoss: "+DoubleToStr(OrderStopLoss(),5)+" \n"+
            "OrderTakeProfit: "+DoubleToStr(OrderTakeProfit(),5)+" \n"+
            "===================="+" \n"+
            "CloseTime: "+TimeToStr(OrderCloseTime())+" \n"+
            "ClosePrice: "+DoubleToStr(OrderClosePrice(),5)+" \n"+
            "Profit: "+DoubleToStr(OrderProfit(),2)+" \n"+
            "Pips: "+DoubleToStr(pips,1)+" \n\n"+
            "===================="+" \n"+
            "Balance: "+DoubleToStr(AccountBalance(),2)+" \n"+
            "Used Margin: "+DoubleToStr(AccountMargin(),2)+" \n"+
            "Free Margin: "+DoubleToStr(AccountFreeMargin(),2)+" \n"+
            "Equity: "+DoubleToStr(AccountEquity(),2)+" \n"+
            "Open Orders: "+DoubleToStr(OrdersTotal(),0)+" \n\n"+
            "Broker: "+AccountCompany()+" \n"+
            "Leverage: "+AccountLeverage()+"" );
        }
        
        /*
        bool b_pending = ( ( NotifyOpenBuyLimit || NotifyCloseBuyLimit || NotifyDeleteBuyLimit ) && ( OrderType()==OP_BUYLIMIT ) )
         || ( ( NotifyOpenBuyStop || NotifyCloseBuyStop || NotifyDeleteBuyStop ) && ( OrderType()==OP_BUYSTOP ) )
         || ( ( NotifyOpenSellLimit || NotifyCloseSellLimit || NotifyDeleteSellLimit ) && ( OrderType()==OP_SELLLIMIT ) )
         || ( ( NotifyOpenSellStop || NotifyCloseSellStop || NotifyDeleteSellStop ) && ( OrderType()==OP_SELLSTOP ) ) ;
        */
       
        bool b_pending = ( OrderType()==OP_BUYLIMIT ) || ( OrderType()==OP_BUYSTOP ) || ( OrderType()==OP_SELLLIMIT ) || ( OrderType()==OP_SELLSTOP );
        bool b_notify = false;
         
        if ( b_pending ) {
                     
            if(OrderType()==OP_BUYLIMIT) {
                ordertyp = "BUYLIMIT";
                b_notify = NotifyOpenBuyLimit || NotifyCloseBuyLimit || NotifyDeleteBuyLimit;
            }
            if(OrderType()==OP_BUYSTOP) {
                ordertyp = "BUYSTOP";
                b_notify = NotifyOpenBuyStop || NotifyCloseBuyStop || NotifyDeleteBuyStop;
            }
            if(OrderType()==OP_SELLLIMIT) {
                ordertyp = "SELLLIMIT";
                b_notify = NotifyOpenSellLimit || NotifyCloseSellLimit || NotifyDeleteSellLimit;
            }
            if(OrderType()==OP_SELLSTOP) {
                ordertyp = "SELLSTOP";
                b_notify = NotifyOpenSellStop || NotifyCloseSellStop || NotifyDeleteSellStop;
            }
            
            if( OrderCloseTime()==0 ) {
                ordertyp = "OPEN " + ordertyp;
                b_notify = ( b_notify && (NotifyOpenBuyLimit || NotifyOpenBuyStop || NotifyOpenSellLimit || NotifyOpenSellStop) );
            } else {
                if (OrderComment()=="cancelled") { // ToFix : autre solution ?
                    ordertyp = "DELETE " + ordertyp; 
                    b_notify = ( b_notify && (NotifyDeleteBuyLimit || NotifyDeleteBuyStop || NotifyDeleteSellLimit || NotifyDeleteSellStop) );
                } else {
                    ordertyp = "CLOSE " + ordertyp;
                    b_notify = ( b_notify && (NotifyCloseBuyLimit || NotifyCloseBuyStop || NotifyCloseSellLimit || NotifyCloseSellStop) );
                }
            }
            msg = msg + "\n" + ordertyp;
            
            if (b_notify) {
                SendNotifications(strTitle+ordertyp+" "+DoubleToStr(OrderLots(),2)+" "+OrderSymbol()+"@"+DoubleToStr(OrderOpenPrice(),5)+", bal: "+DoubleToStr(AccountBalance(),2)+", eq: "+DoubleToStr(AccountEquity(),2)+", "+OrderComment()+"",
                    "Symbol: "+Symbol()+" "+ordertyp+" \n"+
                    "MagicNumber: "+OrderMagicNumber()+" \n"+
                    "Comment: "+OrderComment()+" \n"+
                    "Ticket#: "+OrderTicket()+" \n"+
                    "Size: "+DoubleToStr(OrderLots(),2)+" \n"+
                    "===================="+" \n"+
                    "OpenTime: "+TimeToStr(OrderOpenTime())+" \n"+
                    "OpenPrice: "+DoubleToStr(OrderOpenPrice(),5)+" \n"+
                    "OrderStopLoss: "+DoubleToStr(OrderStopLoss(),5)+" \n"+
                    "OrderTakeProfit: "+DoubleToStr(OrderTakeProfit(),5)+" \n"+
                    "===================="+" \n"+
                    "CloseTime: "+TimeToStr(OrderCloseTime())+" \n"+
                    "ClosePrice: "+DoubleToStr(OrderClosePrice(),5)+" \n"+ // ?
                    "Profit: "+DoubleToStr(OrderProfit(),2)+" \n"+ // ?
                    "Pips: "+DoubleToStr(pips,1)+" \n\n"+ // ?
                    "===================="+" \n"+
                    "Balance: "+DoubleToStr(AccountBalance(),2)+" \n"+
                    "Used Margin: "+DoubleToStr(AccountMargin(),2)+" \n"+
                    "Free Margin: "+DoubleToStr(AccountFreeMargin(),2)+" \n"+
                    "Equity: "+DoubleToStr(AccountEquity(),2)+" \n"+
                    "Open Orders: "+DoubleToStr(OrdersTotal(),0)+" \n\n"+
                    "Broker: "+AccountCompany()+" \n"+
                    "Leverage: "+AccountLeverage()+"" );
            }
        }
        
    }
    oldtemp = temp;
    
    Comment(msg);

    //----
    return(0);
}
//+------------------------------------------------------------------+


string OrderTypeToStr (int ot) {
    if (ot==OP_BUY) {
        return("BUY");
    } else if (ot==OP_SELL) {
        return("SELL");
    } else if (ot==OP_BUYLIMIT) {
        return("BUYLIMIT");
    } else if (ot==OP_BUYSTOP) {
        return("BUYSTOP");
    } else if (ot==OP_SELLLIMIT) {
        return("SELLLIMIT");
    } else if (ot==OP_SELLSTOP) {
        return("SELLSTOP");
    } else {
        return("UNDEF");
    }
}

double PipPoint(string symbol) {
    int CalcDigits = MarketInfo(symbol, MODE_DIGITS);
    if(CalcDigits == 2 || CalcDigits == 3) {
        double CalcPoint = 0.01;
    } else if(CalcDigits == 4 || CalcDigits == 5) {
        CalcPoint = 0.0001;
    }
    return(CalcPoint);
}