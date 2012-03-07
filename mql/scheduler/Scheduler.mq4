//+------------------------------------------------------------------+
//|                                                    Scheduler.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

#define MY_SHORTNAME "schEA"
#define MY_LONGNAME "Scheduler Expert Advisor (EA)"
#define MY_VERSION "0.01-alpha"
#define MY_AUTHOR "Sebastien Celles"
#define MY_WEB "www.celles.net"
#define MY_RELEASE_DATE "2012/03/06"


//+------------------------------------------------------------------+

extern int GMTOffset = 2; // MT4 Broker GMT Offset

extern int slippage = 3;

double price;
bool result;
int tryClose;

extern int MaxTryClose = 100;

int init() {

    return(0);

}

int deinit() {

    return(0);

}

int getDayOfWeek(int offset) {
    double cur_time = Hour() + Minute()/60.0 - offset;
    if (cur_time>24) {
        return((MathMod(DayOfWeek()+1, 7)));
    } else if (cur_time<0) {
        return((MathMod(DayOfWeek()-1, 7)));
    } else {
        return(DayOfWeek());
    }
}

double getTime(int offset) {
    return(MathMod(Hour() + Minute()/60.0 - offset, 24));
}

double getHour(int offset) {
    return(MathFloor(getTime(offset)));
}

double getMinute(int offset) {
    return(60.0*(getTime(offset)-MathFloor(getTime(offset))));
}

string getStrTime(int offset) {
    return(getHour(offset) + ":" + getMinute(offset) + " ; "+getTime(offset));
}

int task_01()  {
    Print("Close");

/*
    int total=OrdersTotal();
    Comment("There is " + total + " orders");
    for ( int i=total-1; i>=0; i-- ) {
        OrderSelect(i, SELECT_BY_POS, MODE_TRADES);

        tryClose = 0;
        result = false;
 
        if(OrderType()==OP_BUY || OrderType()==OP_SELL) {

            while(!result && tryClose<MaxTryClose) {
                if(OrderType()==OP_BUY) {
                    price = MarketInfo(OrderSymbol(), MODE_BID); //Bid;
                } else {
                    price = MarketInfo(OrderSymbol(), MODE_ASK); //Ask;
                }
                result = OrderClose(OrderTicket(), OrderLots(), price, slippage, CLR_NONE);
                Print("Trying to close order #" + OrderTicket() + " at " + price);
                tryClose++;
                if (!result) {
                    Print("Can't close order #" + OrderTicket() + "(" + tryClose + ")");
                    Sleep(1000);
                    RefreshRates();
                }
            }
        }
    }
    Comment("Every orders (" + total + ") should be closed");
*/

    return(0);
}

//bool flag_second = true;
bool flag_min = true;
bool flag_hour = true;
bool flag_day = true;
//bool flag_month = true;


bool flag_close_friday = true;

int start() {

    CommentClear(MY_LONGNAME + " v" + MY_VERSION + " (" + MY_RELEASE_DATE + ")" + "\n" + MY_WEB + " by " + MY_AUTHOR + " " + "©" + "\n");
    CommentAddLine("Ready "+getStrTime(GMTOffset));
    
    // Friday close
    // 0=Sunday, 1=Mo, 2=Tu, 3=We, 4=Th, 5=Fr, 6=Sa
    double cur_time = MathMod(Hour() + Minute()/100 - GMTOffset, 24);
    if ( getDayOfWeek(GMTOffset)==5 && cur_time>=23.75 && flag_close_friday) {
        task_01();
        
        flag_close_friday = false;
    }
    if ( DayOfWeek()==1 && cur_time>=0 && cur_time<=0.25 && !flag_close_friday) {
        flag_close_friday = true;
    }

    // Every Minutes
    if ( Seconds()==0 && flag_min) {
    
    
        Print("Every Minutes");
            
        flag_min = false;    
    }

    // Every 2 Minutes
    /*
    if ( MathMod(Minute(), 2)==0 && Seconds()==0 && flag_min) {
    
    
        Print("Every 2 Minutes");
            
        flag_min = false;    
    }
    */

    // Every Hour
    if ( getMinute(GMTOffset)==0 && Seconds()==0 && flag_hour) {
        flag_min = true;
        
        Print("Every Hour");
        
        flag_hour = false;
    }

    // Every Day at 00h00 00s
    if ( getHour(GMTOffset)==0 && getMinute(GMTOffset)==0 && Seconds()==0 && flag_day) {
        flag_hour = true;

        Print("Every Day");
        
        flag_day = false;
    }

    // RAZ flag_day (monthly)
    if ( Day()==1 && getHour(GMTOffset)==0 && getMinute(GMTOffset)==0 && Seconds()==0 ) {
        flag_day = true;
    }
    
    Display();

    return(0);

}


//+------------------------------------------------------------------+


string strComment = "";

void CommentClear(string def_str="") {
    strComment = def_str;
}

void CommentAddLine(string line) {
    strComment = strComment +  "\n" + line;
}

void Display() {
    Comment(strComment);
}