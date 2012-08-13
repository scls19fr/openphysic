//+------------------------------------------------------------------+
//|                                           DrawHistoryCleanup.mq4 |
//|                        Copyright 2012, MetaQuotes Software Corp. |
//|                                        http://www.metaquotes.net |
//+------------------------------------------------------------------+
#property copyright "Copyright 2012, MetaQuotes Software Corp."
#property link      "http://www.metaquotes.net"

#define OBJ_PREFIX "OBJ_DrawHistory_"

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+

int ObjectNbWithPrefix(string prefix) {
    string objName;
    int ret = 0;
    for(int i=0 ; i < ObjectsTotal() ; i++) {
        objName=ObjectName(i);
        if (StringFind(objName, prefix)==0) {
            ret++;
        }
    }
    return(ret);
}

int ObjectDeletePrefix(string prefix) {
    string objName;
    int ret = 0;
    for (int i=0 ; i < ObjectsTotal() ; i++) {
        objName=ObjectName(i);
        if ( ObjectDelete(objName) )  {
            ret++;
        }
    }
    return(ret);
}

// ToDo : Utiliser GetLastError() au lieu de la boucle
int ObjectDeletePrefixLoop(string prefix) {
    int ret = ObjectNbWithPrefix(OBJ_PREFIX);
    int Nobj = ret;
    
    while ( ret!=0 ) {
        ObjectDeletePrefix(OBJ_PREFIX);
        ret = ObjectNbWithPrefix(OBJ_PREFIX);
    }
    
    return(Nobj);
}

int start()
  {
//----
//ObjectDelete(OBJ_PREFIX);
//ObjectsDeleteAll();
    int Nobj = ObjectDeletePrefixLoop(OBJ_PREFIX);

    Comment("DrawHistory " + "cleanup " + ObjectNbWithPrefix(OBJ_PREFIX) + "/" + Nobj);

// ToDo : suprimer que les objets avec prefixe OBJ_PREFIX

//----
    return(0);
  }
//+------------------------------------------------------------------+