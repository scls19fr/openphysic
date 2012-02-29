//+------------------------------------------------------------------+
//|                                                        _Test.mq4 |
//|                      Copyright © 2011, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2011, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#include <stderror.mqh>
#include <stdlib.mqh>

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
  Comment("Test");

  Sleep(500);

  int err=GetLastError();
  if (err!=ERR_NO_ERROR && err!=1) {
    string strErr = "error(" + err + "): " + ErrorDescription(err);
    Comment(strErr);
  }

  Sleep(500);
  
  Comment("End of test");

  return(0);
}

