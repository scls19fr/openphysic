//+------------------------------------------------------------------+
//|                                               vOM_CleanupAll.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

#include <vOM.mqh>

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
//----
   GlobalVariablesDeleteAll(GV_PREFIX);
   ObjectsDeleteAll();

   //CleanupUnusedGlobalVariables();
   //CleanupUnusedObjects();   
//----
   return(0);
}
//+------------------------------------------------------------------+