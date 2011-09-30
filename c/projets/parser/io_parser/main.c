/*
This program emulate a device's firmware which is
able to understand some SCPI commands
Standard Commands for Programmable Instruments (SCPI)

Supported commands are:
*IDN? : get device identification
MEASure? : get value stored in the device
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "scpi.h"
#include "cmds.h"
#include "tests.h"

char s[STR_SIZE]; /* received string */
int parse_result;

/**
 * \fn int main (void)
 * \brief Program's entry point.
 *
 * \return 0 - Arrt normal du programme.
 */
int main(void) {
  printf("Running\n");
  
  tests();
  
  /*
  while(1) {
    printf("mydevice> "); // show device prompt
    // scanf("%s",s); // sending query string to device
    fgets(s, STR_SIZE, stdin);
    // delete \n char
    s[strlen(s)-1]='\0';
    printf("%s\n",s);
    
    // parse query string
    SCPI_Parse(s);
  }
  */
  
  /*
  *IDN?
  *IDN? *IDN?
  MEAS?
  SET MEAS 52
  SET MEASure 52
  */
  strcpy(s,"*IDN? *IDN?\n*IDN? MEAS? SET MEAS 0 MEAS? SET MEAS 52 MEAS? SET 53 SET MEAS BADVALUE  MEAS?");
  SCPI_Parse(s);

  

  printf("Stopping\n"); /* it should never happen on a real device ! */
  
  return EXIT_SUCCESS;
}
