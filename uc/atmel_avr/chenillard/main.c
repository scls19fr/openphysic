/**************************************************
Projet 		: Clignoteur à LED sur Kit STK 200
Version 	: 1.0 
Date    	: 19/03/2002
Auteur 		: PADIOLLEAU Jean-Luc
Etablissement 	: Lycée Maurice Genevoix - Ingré 45 

Défilement de l'allumage des LEDs
sur le PORT B (Anodes communes -> VDD)
La temporisation est obtenue en utilisant 
le Timer 0
 
Chip type           : AT90S8535
Clock frequency     : 4,000000 MHz
Memory model        : Small
Internal SRAM size  : 512
External SRAM size  : 0
Data Stack size     : 128
***************************************************/


#include <avr/io.h>

//Sous programme de tempo.  base de temps = 1ms
void tempo(unsigned int time)
{
 unsigned int i;
 for(i=0;i<time;i++)
 {
   TCNT0=255-63;   	//Chargement du compteur
   TCCR0=0x03;	        //Lancement du comptage avec prédiv de 64
   while (!(TIFR & 1)); //Attente fin de comptage
   TIFR|=1;             //RAZ indicateur
   TCCR0=0x00;          //Arret Timer
 } 
}
 

// Variables globales

unsigned char a=1;     //variable image de LED allumée

// Programme principale
int main(void)
{

// Port B en sortie
DDRB=0xFF;
PORTB=0xFE;

// Initialisation Timer
TIMSK=0x00;    

while (1)  //Boucle principale
  {
      if (a==0x80) a=0x01;
      else a=a<<1;	// Decalage bit actif
      PORTB=~a;         // Rafraichissement affichage
      tempo(1000);      // Tempo  1s
  }
return 0;
}
