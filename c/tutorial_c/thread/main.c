#include <stdio.h> 
#include <stdlib.h> 
#include <pthread.h> 

volatile char theChar = '\0'; 
volatile char afficher = 0; 

void* lire (void* name) { 
  do { 
    while (afficher == 1) ; /* attendre mon tour */ 
    theChar = getchar(); 
    afficher = 1; /* donner le tour */ 
  } 
  while (theChar != 'F');
  return NULL;
} 

void* affichage (void* name) { 
  int cpt = 0; 
  do { 
    while (afficher == 0) cpt ++; /* attendre */ 
    printf("cpt = %d, car = %c\n", cpt, theChar); 
    afficher = 0; /* donner le tour */ 
  } 
  while (theChar != 'F');
  return NULL;
} 

int main (void) { 
  pthread_t filsA, filsB; 

  if (pthread_create(&filsA, NULL, affichage, "AA")) { 
    perror("pthread_create"); 
    exit(EXIT_FAILURE); 
  } 
  if (pthread_create(&filsB, NULL, lire, "BB")) { 
    perror("pthread_create"); 
    exit(EXIT_FAILURE); 
  } 

  if (pthread_join(filsA, NULL)) 
    perror("pthread_join"); 

  if (pthread_join(filsB, NULL)) 
    perror("pthread_join"); 

  printf("Fin du pere\n") ;
  return (EXIT_SUCCESS);
}
