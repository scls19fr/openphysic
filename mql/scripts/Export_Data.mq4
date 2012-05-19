//+------------------------------------------------------------------+
//|                                                  RSI_to_File.mq4 |
//|                                                 Copyright © 2011 |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2007, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.ru/"

#property show_inputs
string SymbolsArray[13]={"","EURUSD","GBPUSD","USDJPY","AUDUSD","USDCAD","USDCHF","EURGBP","EURAUD","EURCHF","EURJPY","GBPJPY","GBPCHF"};

//+------------------------------------------------------------------+
//| string SymbolByNumber                                   |
//+------------------------------------------------------------------+
string GetSymbolString(int Number)
  {
//----
   string res="";
   res=SymbolsArray[Number];   
//----
   return(res);
  }

//+------------------------------------------------------------------+
//| возвращает период                                                |
//+------------------------------------------------------------------+
int PeriodNumber(int number)
   {
   int per_min;
   switch (number)
      {
      case 0: per_min=PERIOD_M1;break;
      case 1: per_min=PERIOD_M5;break;
      case 2: per_min=PERIOD_M15;break;
      case 3: per_min=PERIOD_M30;break;
      case 4: per_min=PERIOD_H1;break;
      case 5: per_min=PERIOD_H4;break;
      default: per_min=PERIOD_D1;break;
      }
   return(per_min);   
   }

//+------------------------------------------------------------------+
//|   выводит в файл котировки + значения индикатора                 |
//+------------------------------------------------------------------+
void RSI_output(string SymbolName,int PeriodMinutes)
   {
   int size=iBars(SymbolName,PeriodMinutes);
//----
   if (size==0) return;
   int handle=FileOpen("data_"+SymbolName+"_"+PeriodMinutes+".csv",FILE_CSV|FILE_WRITE,',');
   if (handle<0) return;
   FileWrite(handle,"Date,Time,Open,Low,High,Close,Volume,RSI");  //failo pirmoji eilute
   for (int i=size-1;i>=0;i--)
      {
      //irasoma i faila eilutemis
      FileWrite(handle,
      
      //iTime(SymbolName,PeriodMinutes,i),      
      StringSubstr(TimeToStr(iTime(SymbolName,PeriodMinutes,i)),0,10),
      
      StringSubstr(TimeToStr(iTime(SymbolName,PeriodMinutes,i)),11,5),
      
      iOpen(SymbolName,PeriodMinutes,i),iLow(SymbolName,PeriodMinutes,i),
      
      iHigh(SymbolName,PeriodMinutes,i),iClose(SymbolName,PeriodMinutes,i),
      
      iVolume(SymbolName,PeriodMinutes,i),iCustom(SymbolName,PeriodMinutes,"RSI",0,i)
      );
      }
   FileClose(handle);      
//----
   return;
   }
//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start()
  {
  int SymbolCounter,PeriodCounter; 
//----                                jeigu 3 tai eur, gbp, geriausia 7

/*
   for (SymbolCounter=1;SymbolCounter<=12;SymbolCounter++)
      {
      for (PeriodCounter=1;PeriodCounter<=1;PeriodCounter++)
         {
         //Print("NewBar on ",GetSymbolString(SymbolCounter),PeriodNumber(PeriodCounter),"M");
         RSI_output(GetSymbolString(SymbolCounter),PeriodNumber(PeriodCounter));
         }
      }
*/

   //RSI_output("EURUSD",PERIOD_D1);
   RSI_output(Symbol(),Period());
   
//----
   return(0);
  }
//+------------------------------------------------------------------+