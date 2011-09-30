#include <windows.h>
#include <commctrl.h>
#pragma hdrstop
#include "..\bin\blackbox.h"
int WINAPI DllEntryPoint(HINSTANCE, unsigned long, void*) {return 1;}

// 74xx30


DECLARE_PINS
   DIGITAL_IN(SIG_IN1, 1);  // Signal input 1  
   DIGITAL_OUT(SIG_OUT, 2); // Signal output
END_PINS

DECLARE_VAR
END_VAR

USE_WINDOW(0);
//USE_WINDOW(WINDOW_USER_1);  // Dialog identifier from RC file

const char *On_create()
{
   return NULL; // OK
}

void On_destroy() {
}

void set_output() {
   if ( GET_LOGIC(SIG_IN1) == TRUE ) {
      SET_LOGIC(SIG_OUT, FALSE);
   } else {
      SET_LOGIC(SIG_OUT, TRUE);
   }
//   SET_LOGIC(SIG_OUT, !(GET_LOGIC(SIG_IN1)));
}

void On_simulation_begin() {
   set_output();
}


void On_digital_in_edge(PIN pDigitalIn, EDGE pEdge, double pTime)
{
   set_output();
}

void On_gadget_notify(GADGET pGadgetId, int pCode)
{
}

void On_time_step(double pTime)
{
}

void On_remind_me(double pTime, int pData)
{
}
