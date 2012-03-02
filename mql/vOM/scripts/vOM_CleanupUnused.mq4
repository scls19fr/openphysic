//+------------------------------------------------------------------+
//|                                            vOM_CleanupUnused.mq4 |
//|                               Copyright © 2012, Sebastien Celles |
//|                                            http://www.celles.net |
//+------------------------------------------------------------------+
#property copyright "Copyright © 2012, Sebastien Celles"
#property link      "http://www.celles.net"

#include <vOM.mqh>

#define MY_SCRIPTNAME "CleanupUnused"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
int start() {
//----

   CommentClear(getTitle());
   CommentAddLine(MY_SCRIPTNAME);

   Comment(strComment);

   //GlobalVariablesDeleteAll(GV_PREFIX);
   //ObjectsDeleteAll();
   
   CleanupUnusedGlobalVariables();
   //CleanupUnusedObjects();
   
   Sleep(200);

   CommentAddLine("Done");
   Comment(strComment);
   //MessageBox("Done");

//----
   return(0);
}
//+------------------------------------------------------------------+