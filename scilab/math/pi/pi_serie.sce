// Calcul approché de %pi
// par S. CELLES
// Méthode : série convergente
//   sum(1/n^2,n=1..infinity)=%pi^2/6 => %pi =

clear

S = 0;

N=5000; // Nb d'itérations

for i=1:1:N
 	 S = S+1/i^2;
end

sqrt(6*S)
