//+------------------------------------------------------------------+
//|                                                        _Mean.mq4 |
//|                                                 Copyright © 2011 |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

double weighted_price(string symbol, int timeframe, int i) { 
   return (iOpen(symbol, timeframe, i)/4.0 + iClose(symbol, timeframe, i)/4.0 + iLow(symbol, timeframe, i)/4.0 + iHigh(symbol, timeframe, i)/4.0);
}

double mean(string symbol, int timeframe) {      
   int nb = iBars(symbol, timeframe);

   double sum = 0;
   int N = 0;
   double price;
   for (int i=0 ; i<nb ; i++) {
      price = weighted_price(symbol, timeframe, i);
      sum = sum + price;
      N++;
   }

   return(sum / N);
}

double correlationSxy(string symbol1, string symbol2, int timeframe) {
   int nb1 = iBars(symbol1, timeframe);
   int nb2 = iBars(symbol2, timeframe);
   int nb = MathMin(nb1, nb2);
   
   double mean1 = mean(symbol1, timeframe);
   double mean2 = mean(symbol2, timeframe);
   double price1;
   double price2;
   
   double sum = 0;
   int N = 0;
   double price;
   for (int i=0 ; i<nb ; i++) {
      price1 = weighted_price(symbol1, timeframe, i);
      price2 = weighted_price(symbol2, timeframe, i);
      sum = sum + (price1-mean1)*(price2-mean2);
      N++;
   }
   

   return(0);
}

double correlationSxx(string symbol, int timeframe) {
   return(correlationSxy(symbol, symbol, timeframe));
}

double correlation_coefficient(string symbol1, string symbol2, int timeframe) {
   return(correlationSxy(symbol1, symbol2, timeframe)/(MathSqrt(correlationSxx(symbol1, timeframe)*correlationSxx(symbol2, timeframe))));
}

/*
void test_mean() {
   //string symbol = "AUDCHF";
   //int timeframe = PERIOD_M15;
   
   string symbol = Symbol();
   int timeframe = Period();

   double mean1 = mean(symbol, timeframe);
   
   int nb = iBars(symbol, timeframe);
   double mean2 = iMA(symbol, timeframe, nb, 0, MODE_SMA, PRICE_WEIGHTED, 0);
   //Comment(nb);
   
   Comment(mean1 + " = " + mean2);
}
*/

int start() {
   Comment("start");

   string symbol1 = "EURUSD";
   string symbol2 = "USDCHF";
   int timeframe = PERIOD_M15;
   
   double cc = correlation_coefficient(symbol1, symbol2, timeframe);
   
   Comment("CC_" + symbol1 + "/" + symbol2 + "=" + cc);
   
   return(0);
}

