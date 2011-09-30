/*
  Un petit essai sur la fonction synchronisation de signal d'un oscilloscope
 */

#include <stdio.h>
#include <math.h>
#include <stdint.h>
#include <stdbool.h>

#define PI 4*atan(1)


int main (void)
{
  uint16_t x, y, N;
  x = 0;
  y = 0;
  N = 0; // nb de pts

  //printf("%i\t%i\n", x, y);
  //x++;

  uint16_t liste[256];


  printf("define signal\n");

  do {
    y = -127*cos(2*PI/255*x) + 128;
    //printf("%i\t%i\n", x, y);
    liste[N] = y;
    x++;
    N++;
  } while (x < 256); //256);

  //printf("N=%i\n", N);


  uint16_t level = 200; // niveau de declenchement
  bool rising_level = false; // front montant (true) ou descendant (false)
  uint16_t pre_level = 0; // declenche x pts avant

  bool level_is_set = false;
  uint16_t i = 0;
  uint16_t i_level = 0;

  printf("synchronize signal\n");

  uint16_t liste_sync[256];
  x = 0;
  do { // initialisation à 0
    liste_sync[x] = 0;
    x++;
  } while (x < 256);

  do { // la partie synchro à proprement parler
    y = liste[i%N];
    if (level_is_set) {
      liste_sync[(i-i_level)%N] = y;
    } else {
      if ( ( (rising_level)
	        && ( liste[(i+1+pre_level)%N] > liste[(i+pre_level)%N] )
	        && ( liste[(i+1+pre_level)%N] >= level )
	        && ( liste[(i+pre_level)%N] < level ) )
	   || ( (!rising_level)
		&& ( liste[(i+1+pre_level)%N] < liste[(i+pre_level)%N] )
		&& ( liste[(i+1+pre_level)%N] <= level )
		&& ( liste[(i+pre_level)%N] > level ) )		  
	   ) {
	i_level = i;
	level_is_set = true;
      }
    }
    i++;
  } while ( (i-i_level)%N != 0);

  // synchro impossible avec valeur de level
  if ( !level_is_set ) {
    x = 0;
    do {
      liste_sync[x] = liste[x];
      x++;
    } while (x < N);
  }


  x = 0;
  do {
    y = liste_sync[x];
    printf("%i\t%i\n", x, y);
    x++;
  } while (x < N);


  return 0;
}
