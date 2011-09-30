#include "scpi.h"
#include "cmds.h"

#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
//#include <regex.h>
#include <stdbool.h>

int i;

int state;

char *token;

/* const char delimiters[] = " .,;:!-"; */
const char delimiters[] = " \n";


/*
http://groups.google.de/group/de.sci.electronics/msg/c1467276cd3776c9
http://groups.google.fr/group/comp.arch.embedded/browse_thread/thread/ccb95613fc65cb27#
*/
enum TokenType {
        T_UNDEF,
        T_IDN,
        T_MEAS_GET, // MEAS? or MEASure?
        T_MEAS,
        T_SET,
        T_GET,
        T_NUMBER
};
int token_type;

/**
 * \fn enum TokenType get_token_type(char * token)
 * \brief Send the type of a token
 *
 * \param token to know type.
 * \return enum TokenType
 */
enum TokenType get_token_type(char * token) {
	if ( SCPI_Compare(token, "*IDN?") ) {
	  return T_IDN;
	} else if ( SCPI_Compare(token, "MEASure?") ) {
	  return T_MEAS_GET;
	} else if ( SCPI_Compare(token, "MEASure") ) {
	  return T_MEAS;
	} else if ( SCPI_Compare(token, "SET") ) {
	  return T_SET;
	} else if ( contain_number(token) ) {	  
	   return T_NUMBER;
	} else {
	  return T_UNDEF;
	}	
}


/**
 * \fn int SCPI_Compare(char * s1, char * s2)
 * \brief Compare two strings
 *
 * \param s1 string to compare.
 * \param s2 string to compare.
 * \return 0 if s1==s2.
 */
int SCPI_Compare(char * s1, char * s2) {
  /* s2=strupr(s2); */
  char *s2_abb = NULL;
  s2_abb=SCPI_Abbreviate(s2);
  return ( strcasecmp(s1, s2)==0 ) || ( strcasecmp(s1, s2_abb)==0 ) ;
  /*
  strcmp, strncmp - Comparaison de deux chaînes.
  strcasecmp, strncasecmp - Comparer deux chaînes en ignorant les différences majuscules/minuscules. 
  */
}


/**
 * \fn char * str_toupper (const char *ct)
 * \brief Convert a string to upper case.
 *
 * \param ct string to convert.
 * \return Converted string.
 */
 /*
char * str_toupper (const char *ct) {
  char *s = NULL;
  if (ct != NULL) {
    int i;
    s = malloc (sizeof (*s) * (strlen (ct) + 1));
    if (s != NULL) {
      for (i = 0; ct[i]; i++) {
        s[i] = toupper (ct[i]);
      }
      s[i] = '\0';
    }
  }
  free(s);
  return s;
}
*/


/**
 * \fn char * SCPI_Abbreviate (const char *ct)
 * \brief Convert a string to its abbreviated form.
 *
 * \param ct string to convert.
 * \return Converted string.
 */
char * SCPI_Abbreviate (const char *ct) {
  char *s = NULL;
  if (ct != NULL) {
    s = malloc (sizeof (*s) * (strlen (ct) + 1)); 
    
    if (ct != NULL) {
      int i, j;
      /* int state=0; */
      j=0;
      /*
      state==0 : upper case
      state==1 : lower case
      state==2 : symbol ? * ...
      */
    
      for (i = 0; i<strlen(ct)+1 ; i++) {
        if ( isalpha(ct[i]) ) {
          if (isupper(ct[i])) {
            /* state=0; */
            s[j]=ct[i];
            j=j+1;
          } /* else {
            state=1;
          } */
        } else {
          /* state=2; */
          s[j]=ct[i];
          j=j+1;
        }
  
        /* printf("%i",state); */
      }
    }
    /* printf("\n"); */
  }
  return s;
}


/**
 * \fn int contain_number(const char * token)
 * \brief Return if string contain a number or not.
 *
 * \param s string to parse.
 * \return true if string contains only a number.
 */
int contain_number(const char * token) {
  /* long int strtol ( const char * str, char ** endptr, int base ); */
  char * endptr;
  long int val;
  val=strtol(token, &endptr, 0);
  
  return !(val==0 && endptr==token);
}

/**
 * \fn int SCPI_Parse(char * s)
 * \brief Parse a query string.
 *
 * \param s string to parse.
 * \return 0 if string has been well parsed.
 */
int SCPI_Parse(char * s) {
  // puts(s);
  
  token = strtok (s, delimiters);
  while (token!=NULL) {
    token_type=get_token_type(token);
  
  	//printf("%s ",token);
    if ( token_type==T_IDN ) {
      printf("\t*IDN? = device identification\n");
      state=0;
    } else if ( token_type==T_MEAS_GET  ) {
      printf("\tmeasure=%li\n",measure);
      state=0;
    } else if ( token_type==T_SET || token_type==T_MEAS || token_type==T_NUMBER ) {
      if ( SCPI_Compare(token,"SET") && state==0) {
        state=1;
      } else if ( SCPI_Compare(token,"MEASure") && state==1 ) {
        state=2;
      } else if ( state==2 && contain_number(token) ) {
		printf("\tset measure to %s\n",token);
		// atoi atof strtold strtoll strtoul strtoull...
		//measure=atoi(token);
		measure=strtol(token, NULL, 0);
        state=0;
      } else {
      	fprintf(stderr, "\tError ! Correct syntax is 'SET MEAS value'\n");
        state=0;
      }
    } else {
      fprintf(stderr, "\tError ! this firmware doesn't understand this command (%s : %d)\n",token,token_type);
      state=0;
    }
    token = strtok(NULL, delimiters);
  }
  
  return 0;
}
