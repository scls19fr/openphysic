//+------------------------------------------------------------------+
//|                                                 ExportLevels.mq4 |
//|                      Copyright © 2006, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2006, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#property show_inputs
extern int MaxLimit = 1000;
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
   int handle;
   handle = FileOpen("FindLevels.csv", FILE_CSV|FILE_WRITE, ',');
   FileWrite(handle, "Cost", "BarsNum");
   double d1 = Low[iLowest(NULL, 0, MODE_LOW, MaxLimit, 0)];
   double d2 = High[iHighest(NULL, 0, MODE_HIGH, MaxLimit, 0)];
   for (double d = d1; d <= d2; d += 0.0001)
     {
       double a = 0.0;
       for(int i = 0; i < MaxLimit; i++)
           if(d > Low[i] && d < High[i])
               a+=1;   
       FileWrite(handle, d, a);
     } 
   FileClose(handle);
   return(0);
  }
//+------------------------------------------------------------------+