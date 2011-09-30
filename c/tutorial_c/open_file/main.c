#include <stdio.h>
#define putchar(c) putc((c), stdout)

int main(void)
{ 
  FILE * file;
  char c;
  file = fopen("main.txt", "r"); /* Ouverture du fichier fcntl.h */
  while( (c = getc(file)) != EOF ) {
    putchar(c);
  }
  
  fclose(file); /* Fermeture du fichier */

  return 0;
}
