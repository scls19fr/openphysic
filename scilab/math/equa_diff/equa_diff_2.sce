// Résolution d'une équation différentielle
// y'' + b y' + c y = d
// on cherche la solution y(x)
// S. Celles
// 08/12/2004

clear

x_ini=0;   // MODIFIABLE defaut : x_ini=0;
x_pas=0.1;	// MODIFIABLE defaut : x_pas=0.1;
x_fin=10;  // MODIFIABLE defaut : x_fin=10;

x=[x_ini:x_pas:x_fin]';	// le prime sert à transposer pour avoir un vecteur colonne

b = 1; // MODIFIABLE
c = 1; // MODIFIABLE
d = 1; // MODIFIABLE
			 // Remarque si d n'est pas une constante mais une fonction de x 
			 // on doit calculer la valeur de cette fonction pour chaque x dans la boucle while

// Conditions initiales (MODIFIABLE)
y_ini = 0;
y1_ini= 0; // y1 = y'

// Initialisation
x_cour=x_ini;

	// Point courant
	y_cour = y_ini;
	y1_cour = y1_ini;

	// Point précédent
	y_prec = y_ini;
	y1_prec = y1_ini;
		
	
	x=[x_ini]; 		// sert à stocker les x
	y=[y_ini]; 		// sert à stocker les y
	y1=[y1_ini];	// sert à stocker les y'
	
// Méthode
// y" + by' + c*y = d
// y1=y'

// Boucle sur l'intervalle de x
while x_cour<=x_fin,
	x_cour = x_cour + x_pas;
	
	y1_cour = ((d-c*y_cour)*x_pas+y1_prec)/(1+b*x_pas);
	y_cour = y1_cour*x_pas + y_prec;
	
	x = [x;x_cour];
	y = [y;y_cour];
	y1 = [y1;y1_cour];
	y_prec = y_cour;
	y1_prec = y1_cour;
end

plot2d(x,y)

