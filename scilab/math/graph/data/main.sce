clear(); // effacer les variables
M=fscanfMat('data.txt'); // lire les donnees
x=M(:,1); // recuperation de la 1ere colonne : x
y=M(:,2); // recuperation de la 2ieme colonne : y
[a,b,sig]=reglin(x',y') // regression lineaire
ylin=a*x+b
plot(x,[y ylin]) // trace
