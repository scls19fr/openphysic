//+------------------------------------------------------------------+
//|                                               vOM_CleanupAll.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

#include <vOM.mqh>

#define MY_SCRIPTNAME "Cleanup"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
//----

   CommentClear(getTitle());
   CommentAddLine(MY_SCRIPTNAME);

   Comment(strComment);

   GlobalVariablesDeleteAll(GV_PREFIX);
   ObjectsDeleteAll();
   
   //CleanupUnusedGlobalVariables();
   //CleanupUnusedObjects();
   
   //Sleep(1000);

   CommentAddLine("Done");
   Comment(strComment);
   //MessageBox("Done");

//----
   return(0);
}
//+------------------------------------------------------------------+