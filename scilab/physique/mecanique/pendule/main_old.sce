// Résolution d'un problème de mécanique
//
// Mouvement d'un pendule simple
//
// Technique : application de la RFD
//								méthode d'Euler

// TO FIX : ne fonctionne pas

// par Sébastien CELLES
//
// Hyp : Terre = réf gali
// Système : pendule supposé ponctuel
// Forces : poids P
//          tension du fil T
//          rem : pour modifier les forces il faut changer les valeurs
//								dans la boucle (attention!)
//							 	ET au début (attention (bis !))
// Système de coordonnées : cartésien [ux uy uz]
// Horloge : t
//
//				     z 
//					 / \     |   ->
//  					/  | \   \|/  g
//              |
//  	       				|             y
//  					|           \
//					  +------------
//     			/	O	         /
//     | /
//     |/
//    x ---
//
//
//    *
//    | \
//    |  \
//    |th>\
//    |    *

clear;

function [F_t0] = calcul_force(F_t0)
// Poids
g0 = 9.81;
g = [0 0 -g0];
P = m*g;

// Tension du fil
// -m V^2 / R er-> = T-> + (P-> . er->) er->
//er = [0 OM_t0(3)/R -OM_t0(2)/R]
//et = [0 OM_t0(2)/R OM_t0(3)/R]
//T = [0 0 0]
x = OM_t0(1)
y = OM_t0(2)
z = OM_t0(3)
T = - m * ( (norm(v_t0)^2) / R - g0	* z/R ) * [0 z/R -y/R]

// Somme des forces
F_t0 = P + T;

endfunction


printf("\n");
printf("\n");
printf("Resolution\n");
printf("\n");
printf("\n");
printf("Calcul en cours... Patientez !\n");
printf("\n");


t_ini = 0;    // MODIFIABLE defaut : t_ini=0;
t_pas = 0.01; // MODIFIABLE defaut : t_pas=0.1;
t_fin = 2;    // MODIFIABLE defaut : t_fin=10;

t = [t_ini:t_pas:t_fin]';	// le prime sert à transposer pour avoir un vecteur colonne


R = 0.2; //  Longueur du fil du pendule
m = 1; // Masse du système (MODIFIABLE)


// Conditions initiales
t_0 = t_ini;          // Instant  courant

theta0 = 30*%pi/180;

OM_t0 = R*[0 sin(theta0) -cos(theta0)];    // Position initiale (MODIFIABLE)


V0 = 0;    // m/s
v_t0 = [0 V0*cos(theta0) V0*sin(theta0)]; 

F_t0 = calcul_force([0 0 0]);
a_t0 = F_t0/m;


// Initialisation (NE PAS MODIFIER)
OM_tm1 = OM_t0;       // Position précédente (t moins 1)
v_tm1 = v_t0;        // Vitesse  précédente (t moins 1)
a_tm1 = a_t0;        // Accélération précédente (t moins 1)
F_tm1 = F_t0;        // Force    précédente (t moins 1)

OM_tp1 = [0 0 0];  // Position suivante     (t plus 1)
v_tp1 = [0 0 0];   // Vitesse suivante      (t plus 1)
a_tp1 = [0 0 0];   // Accélération suivante (t plus 1)
F_tp1 = [0 0 0];   // Force  suivante       (t plus 1)



OM = OM_t0; // Matrice des positions [x_0 y_0 z_0]
// [x_1 y_1 z_1]
// [x_2 y_2 z_2]
// [   . . .   ]

v = v_t0; // Matrice des vitesses [vx_0 vy_0 vz_0]
// [vx_1 vy_1 vz_1]
// [vx_2 vy_2 vz_2]
// [     . . .    ]

a = a_t0; // Matrice des accélérations [ax_0 ay_0 az_0]           // A voir
// [ax_1 ay_1 az_1]
// [ax_2 ay_2 az_2]
// [     . . .    ]

F = F_t0; // Matrice des forces [Fx_0 Fy_0 Fz_0]
// [Fx_1 Fy_1 Fz_1]
// [Fx_2 Fy_2 Fz_2]
// [     . . .    ]


// Boucle sur la durée de l'expérience
while t_0 <= t_fin
  t_0 = t_0 + t_pas;
  
  printf(".");

  // calcul_force
  F_t0 = calcul_force(F_t0);

  // Relation Fondamentale de la Dynamique
  // Somme des forces = m * accélération
  // F=m*a
  // a=F/m
  a_t0 = F_t0/m;

  // Intégration 1 : vitesse
  // a = (v_tp1-v_t0)/t_pas
  v_tp1 = a_t0*t_pas + v_t0;

  // Intégration 2 : position
  // v = (M_tp1-M_t0)/t_pas
  OM_tp1 = v_t0*t_pas + OM_t0;

  // Mise à jour des matrices position, vitesse, force
  OM = [OM ; OM_tp1];
  v = [v ; v_tp1];
  a = [a ; a_t0];
  F = [F ; F_t0];

  // Décalage
  OM_t0 = OM_tp1;
  v_t0 = v_tp1;
  // a_t0=a_tp1;
  // F_t0=F_tp1;

  OM_tm1 = OM_t0;
  v_tm1 = v_t0;

end
// Fin de boucle
printf("\n");	// Retour à la ligne
printf("\n"); // Saut de ligne
printf("Fin des calculs !\n");
printf("\n");




// Mise en forme des résultats
// t (déja mis en forme)


// x y z
x = OM(:,1); // (rem sur TI on ne peut pas récupérer les colonnes mais uniquement les lignes
y = OM(:,2); //    alors (astuce !) on transpose on recupère une ligne et on retranspose)
z = OM(:,3);

// vx vy vz
vx = v(:,1);
vy = v(:,2);
vz = v(:,3);

// ax ay az
ax = a(:,1);
ay = a(:,2);
az = a(:,3);

NormV = sqrt(vx^2+vy^2+vz^2);
NormM = sqrt(x^2+y^2+z^2);


GLOBAL = [t,x,y,z,vx,vy,vz,ax,ay,az];		// Construction d'une variable contenant tous les résultats



xbasc()	// ou xclear() permet d'effacer l'écran graphique



printf("Trajectoire dans le plan xz\n");
plot2d(x,z);


//halt()  //c'est une pause mais ça ne s'appelle pas pause() !
//xbasc()	// ou xclear() permet d'effacer l'écran graphique
//printf("\n");


//printf("Trajectoire dans l espace\n");		// bizarrement SciLab n'aime pas l'aspostrophe
//param3d(x,y,z);
//plot3d(x,y,z);	Trace des surfaces

//halt()  //c'est une pause mais ça ne s'appelle pas pause() !
//xbasc()	// ou xclear() permet d'effacer l'écran graphique
//printf("\n");


//printf("Hodographe\n");
//param3d(vx,vy,vz);
//printf("Hodographe dans le plan yz\n");
//plot2d(vy,vz)
//plot3d(vx,vy,vz);


//halt()  //c'est une pause mais ça ne s'appelle pas pause() !
//xbasc()	// ou xclear() permet d'effacer l'écran graphique
//printf("\n");


//printf("az = f(ax,ay)\n");
//param3d(ax,ay,az);
//printf("az = f(ay)\n");
//plot2d(ay,az);
//plot3d(ax,ay,az);


//halt()  //c'est une pause mais ça ne s'appelle pas pause() !
//xbasc()	// ou xclear() permet d'effacer l'écran graphique
//printf("\n");


// Plan de phase x.=f(x)
// sqrt(vx^2+vy^2+vz^2) donne ||v->|| en fonction de t
// sqrt(x^2+y^2+z^2)		  donne ||M->|| en fonction de t
//printf("\n");
//printf("Plan de Phase\n");
//plot2d(NormM,NormV)


//halt()


printf("\n");
printf("\n");
printf("Tous les résultats sont dans les variables t,x,y,z,vx,vy,vz,ax,ay,az et GLOBAL\n");
printf("\n");
printf("\n");
printf("Sebastien CELLES\n");
//xbasc()
