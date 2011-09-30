// Résolution d'une équation différentielle
// y' + b y = c
// on cherche la solution y(x)
// S. Celles
// 08/12/2004

clear

x_ini=0;   // MODIFIABLE defaut : x_ini=0;
x_pas=0.1;	// MODIFIABLE defaut : x_pas=0.1;
x_fin=10;  // MODIFIABLE defaut : x_fin=10;

x=[x_ini:x_pas:x_fin]';	// le prime sert à transposer pour avoir un vecteur colonne

//N=size(x,'r');

b = 1; // MODIFIABLE
c = 1; // MODIFIABLE..
			 // Remarque si c n'est pas une constante mais une fonction de x 
			 // on doit calculer la valeur de cette fonction pour chaque x dans la boucle while

// Conditions initiales
y_ini = 0;

// Initialisation
x_cour=x_ini;

	// Point courant
	y_cour = y_ini;

	// Point précédent
	y_prec = y_ini;
	
	x=[x_ini]; // sert à stocker les x
	y=[y_ini]; // sert à stocker les y
	
// Méthode
// y' + b*y = c
// (y(x)-y(x-%delta_x))/%delta_x + b*y(x) = c
// => y(x) = f( b,c,%delta_x, y(x-%delta_x) )

// Boucle sur l'intervalle de x
while x_cour<=x_fin,
	x_cour = x_cour + x_pas;
	y_cour = (c*x_pas+y_prec)/(1+b*x_pas);
	x = [x;x_cour];
	y = [y;y_cour];
	y_prec = y_cour;
end

plot2d(x,y)
