//+------------------------------------------------------------------+
//|                                               Export_History.mq4 |
//|                                 Copyright © 2012, www.celles.net |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
  string str = "";
  string strLine = "";
  string strSep = ";";
  
  int hnd;
  int result;
  
  string filename = "myhistory.csv";
  hnd = FileOpen(filename, FILE_WRITE|FILE_CSV, ';');
  
// http://book.mql4.com/functions/files

  Comment("Export CSV history");
  
// Accounts informations

// Trade
  int i;

  result = FileWrite(hnd, "=== Account ===");
  result = FileWrite(hnd, "AccountNumber", AccountNumber());
  result = FileWrite(hnd, "AccountName", AccountName());
  result = FileWrite(hnd, "AccountCurrency", AccountCurrency());
  
  result = FileWrite(hnd, "=== Open Trades ===");

  for (i=0; i < OrdersTotal(); i++) {
    if(OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
      result = FileWrite(hnd, OrderTicket(), OrderOpenTime(),
            OrderType(), OrderLots(), OrderSymbol(), OrderOpenPrice(),
            OrderStopLoss(), OrderTakeProfit(), OrderCloseTime(), OrderClosePrice(),
            OrderCommission(), OrderSwap(), OrderProfit(), OrderComment(), OrderMagicNumber());
    }
  }

  result = FileWrite(hnd, "=== Closed Transactions ===");

// History

  for (i=0; i < OrdersHistoryTotal(); i++) {
    if(OrderSelect(i, SELECT_BY_POS, MODE_HISTORY)) {
      result = FileWrite(hnd, OrderTicket(), OrderOpenTime(),
            OrderType(), OrderLots(), OrderSymbol(), OrderOpenPrice(),
            OrderStopLoss(), OrderTakeProfit(), OrderCloseTime(), OrderClosePrice(),
            OrderCommission(), OrderSwap(), OrderProfit(), OrderComment(), OrderMagicNumber());
    }
  }
  
  FileClose(hnd);

  Comment("End of exporting CSV history");

  return(0);
}
//+------------------------------------------------------------------+