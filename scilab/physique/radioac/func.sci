// Loi de décroissance radioactive
// ===============================

// ceci n'est que la partie affichage...
// ça n'est pas ça le plus important.
// mais je suis obligé de le définir au début
// pour pouvoir l'appeler ensuite dans le programme
function affiche_noyaux(sqrtN)
	M = zeros(sqrtN,sqrtN); // matrice carrée remplie de zeros

	// on remplit la matrice avec la liste des noyaux (radioactifs ou désintégrés)
   for i=1:sqrtN // ligne
     for j=1:sqrtN // colonne
       M(i,j)=ELT(j+(i-1)*sqrtN);
     end
   end

	// on applique la régle de couleur suivante :
	//  noir : noyau radioactif
	//  blanc : noyau désintégré
	M=M*(color("black")-color("white"))+color("white"); 
	
	// on dessine les noyaux !
	//xbasc() // on efface l'écran
	Matplot(M,frameflag=4,axesflag=0)
endfunction

function affiche_courbe(Nlist,sqrtN)
  //xbasc() // effacer l'écran
  plot(Nlist)
endfunction

function afficher(Nlist,sqrtN)
  xbasc();
  subplot(2,1,1);
  affiche_noyaux(sqrtN);
  subplot(2,1,2);
  //xset("default")
  affiche_courbe(Nlist,sqrtN);
endfunction

function affiche_logn()
  NlistSansZero=Nlist(1:size(Nlist,'r')-1,1);
  //xbasc()
  plot2d(log(NlistSansZero))
endfunction

function affiche_histo()
N1=Nlist(1:size(Nlist,'r')-1); // du premier à l'avant dernier
N2=Nlist(2:size(Nlist,'r')); // du deuxième au dernier
Nd=N1-N2;
// Il faut mainteant calculer les fréquences d'un nombre de désintégration
histplot(size(Nd,'r'),Nd,normalization=%f)
endfunction

// la partie importante du programme commence ici
function main(sqrtN, p0)
lines(0);

Nini = sqrtN^2

// Initialisation
j=0; // nb de tirage
ELT = ones(Nini,1); // Matrice colonne représentant
  // les atomes radioactifs (1)
  // ou les atomes désintégrés (0)
// Initialement tous les atomes sont radioactifs

N=sum(ELT) // nb de noyaux radioactifs
Nlist=[N]; // liste du nb de noyaux radioactifs

afficher();

halt()

// Tirage


while (sum(ELT)>0)
  j=j+1;

  for i=1:Nini
  	 p = rand(); // tirage au sort d'un nombre rnd entre 0 et 1
  	 if p<p0	 // p est inférieur à p0 le noyau est désintégré
      ELT(i,1) = 0;
    end
   	// sinon il reste tel quel ! (on ne fait rien)
  end

  N=sum(ELT) // nb de noyaux radioactifs
  Nlist=[Nlist;N]; // liste du nb de noyaux radioactifs
  afficher(Nlist,sqrtN);
  halt()
end


printf("Tous les noyaux radioactifs sont desintegres\n");

// L'allure de la courbe N=f(t) est une exponentielle
// On le vérifie en traçant log(N)
// Dans Scilab log = log népérien et log10 = log décimal
// Il faut éliminer le dernier point (0)
// car log(0) tend vers l'infini


halt();
//subplot(2,2,4)
xbasc();
affiche_logn();

//halt(),

// On veux montrer le caractère aléatoire d'une désintégration radioactive
// On trace un histogramme
//  y : nombre de fois où l'on détecte n désintégrations
//  x : nombre  de désintégrations (intervalles)
//xbasc()
//affiche_histo()

endfunction

