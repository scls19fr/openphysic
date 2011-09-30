#include <stdio.h>
#include <stdbool.h>

#define putchar(c) putc((c), stdout)

#define str_file_in "fr_FR.dic" 
#define str_file_out "dic_fr.txt"


char minucule_majuscule(char c) {
  if ( c >='a' && c<='z' ) {
    c -= 'a'-'A'; // mettre en majuscule
  } else if ( c >='A' && c<='Z' ) {
    // ne rien faire (normal)
  } else if ( c=='-' || c=='\'' || c=='.' ) {
    // ne rien faire (enlever le mot ?)
  } else if ( c=='á' || c=='à' || c=='ä' || c=='â'
	      || c=='À') {
    c = 'A';
  } else if ( c=='é' || c=='è' || c=='ë' || c=='ê'
	      || c=='É' || c=='È' || c=='Ê' ) {
    c = 'E';
  } else if ( c=='í' || c=='ï' || c=='î' ) {
    c = 'I';
  } else if ( c=='ó' || c=='ö' || c=='ô' ) {
    c = 'O';
  } else if ( c=='ù' || c=='ü' || c=='û' ) {
    c = 'U';
  } else if ( c=='ÿ' ) {
    c = 'Y';
  } else if ( c=='ç' ) {
    c = 'C';
  } else if ( c >='0' && c<='9' ) {
    c = ' ';
  }
  return c;
}

int main(void)
{ 
  FILE * file_in;
  file_in = fopen(str_file_in, "r"); /* Ouverture du fichier fcntl.h */

  FILE * file_out;
  file_out = fopen(str_file_out, "w+");

  char c;

  bool good_part; // bonne partie du mot
  good_part = true;

  while( (c = getc(file_in)) != EOF ) {
    if ( c=='/' ) {
      good_part = false;
      c = '\0';
    } else if ( c=='\n' ) {
      // Ne rien faire
      good_part = true;
    }

    c = minucule_majuscule(c);

    if (good_part==true) {
      //putchar(c);
      //putc((c), stdout);
      putc((c), file_out);
    }

  }
  
  fclose(file_in); /* Fermeture du fichier */

  return 0;
}
