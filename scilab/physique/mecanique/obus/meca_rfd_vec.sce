// Résolution d'un problème de mécanique terrestre en 3 dimensions avec SciLab 2.7
//
// Lancé d'un obus sans frottement ou avec frottement visqueux et/ou avec frottement fluide
//
// Technique : application de la RFD
//								méthode d'Euler

// par Sébastien CELLES
// Commencé le 06/02/2004
// Derniere modification le 31/03/2005
//
// Hyp : Terre = réf gali
// Système : obus supposé ponctuel
// Forces : poids
//          rem : pour modifier les forces il faut changer les valeurs
//								dans la boucle (attention!)
//							 	ET au début (attention (bis !))
// Système de coordonnées : cartésien [ux uy uz]
// Horloge : t
//
//				     z 
//					 / \     |   ->
//  					/ | \   \|/  g
//					  |
//  						|             y
//  						|           \
//					  +------------
//     			/	O	         /
//     | /
//     |/
//    x ---
//
//
//  z
//  / \
//   |
//   |           ***
//   |        *       *
//   |     *             *
//   |   *                 *
//   | *                    *
//   |*                      *  \
//   *------------------------*--  y
//                              /

clear;

function [v]=crossP(v1,v2)
// le produit vectoriel en vectoriel...
// v1 et v2 doivent etre des matrices (3,n)
v=zeros(v1)
v(1,:) = v1(2,:).*v2(3,:) - v1(3,:).*v2(2,:)
v(2,:) = v2(1,:).*v1(3,:) - v2(3,:).*v1(1,:)
v(3,:) = v1(1,:).*v2(2,:) - v1(2,:).*v2(1,:)
endfunction




function [F_t0]=calcul_force(F_t0)
//printf("F");

// Poids
g0 = 9.81;
g = [0 0 -g0];
me = 9.109389E-31; // Masse d'un électron
mp = 1.672623E-27; // Masse d'un proton
mn = 1.676928E-27; // Masse d'un neutron
P = m*g;


// Force de frottement visqueux
// Fv=-h1*v
h1=0;
Fv = - h1*v_t0;


// Force de frottement fluide
// Ff=-h2*v^2
h2=0;
if norm(v_t0)<>0
  uv_t0 = v_t0/norm(v_t0);	// Vecteur unitaire selon la direction de v à l'instant courant
else
  uv_t0 = [0 0 0];		// cas où norm(v_t0) = 0
end
Ff = - h2*(v_t0*v_t0')*uv_t0;


// Force electrique
// Fe = q * E
qe = 1.6E-19;      // Charge élémentaire
q = 0; // Charge du système (MODIFIABLE)
// %epsilon_0 = 1/(4*%pi*8.98755178737E9);
E  = [0 0 0];	// Champ électrique
Fe = q*E;


// Force magnetique
// Fb = q * (v vectoriel B) // Le produit vectoriel n'existe pas dans SciLab il faut "le faire" voir crossP
// %mu_0 = 4*%pi*100E-9
B  = [0 0 1]; // Champ magnétique
Fb = q*((crossP(v_t0',B'))');


// Force de rappel d'un ressort
// k		= ; // Constante de raideur du ressort Fr=k*(l-l0)
// l0 = 0.10; // Longueur à vide du ressort

// Interactions gravitationnels
// Gc = 6.67259E-11; // Constante de la loi de gravitation
// R1 =	// Rayon de la planète 1
// M1 =	// Masse de la planète 1
// R2 =	// Rayon de la planète 2
// M2 =	// Masse de la planète 2




// Somme des forces
F_t0 = P + Fv + Ff + Fe + Fb;
endfunction




printf("\n");
printf("\n");
printf("Resolution d un probleme de mecanique terrestre en 3 dimensions \n");
printf("\n");
printf("\n");
printf("Calcul en cours... Patientez !\n");
printf("\n");

// Testé sur ATHLON-XP-2100 avec 2000 pts en même pas 1 seconde !

// Exemples

// Obus dang g
// t_ini = 0;
// t_pas = 0.001;
// t_fin = 1.2;
// m=1;
// q=0;
// g=9.81;
// OM_ini=[0 0 0];
// V0=10;
// %alfa=30;
// v_ini = [0 V0*cos(%alfa*2*%pi/360); V0*sin(%alfa*2*%pi/360)];


// e- dans B
// t_ini = 0;
// t_pas = 0.001;
// t_fin = 1.2;
// m = me;
// q = qe;
// h1 = 0;
// h2 = 0;
// g0 = 0;
// OM_ini = [0 0 0];
// V0 = 10
// %alfa = 5
// v_ini = [V0*cos(%alfa*2*%pi/360) 0 V0*sin(%alfa*2*%pi/360)];
// B=[0 0 1];


// A faire
// Acceleration e- dans E
// Deviation e- dans E
// e- dans E et B
// Cyclotron

t_ini=0;    // MODIFIABLE defaut : t_ini=0;
t_pas=0.01; // MODIFIABLE defaut : t_pas=0.1;
t_fin=2;    // MODIFIABLE defaut : t_fin=10;

t=[t_ini:t_pas:t_fin]';	// le prime sert à transposer pour avoir un vecteur colonne


m = 1; // Masse du système (MODIFIABLE)


// Conditions initiales
t_0=t_ini;          // Instant  courant


OM_t0 = [0 0 0];    // Position initiale (MODIFIABLE)


V0 = 10;    // m/s
%alfa = 30; // degré 
v_t0 = [V0*cos(%alfa*2*%pi/360) 0 V0*sin(%alfa*2*%pi/360)]; 
F_t0=calcul_force([0 0 0]);
a_t0 = F_t0/m;


// Initialisation (NE PAS MODIFIER)
OM_tm1=OM_t0;       // Position précédente (t moins 1)
v_tm1=v_t0;        // Vitesse  précédente (t moins 1)
a_tm1=a_t0;        // Accélération précédente (t moins 1)
F_tm1=F_t0;        // Force    précédente (t moins 1)

OM_tp1=[0 0 0];  // Position suivante     (t plus 1)
v_tp1=[0 0 0];   // Vitesse suivante      (t plus 1)
a_tp1=[0 0 0];   // Accélération suivante (t plus 1)
F_tp1=[0 0 0];   // Force  suivante       (t plus 1)



OM=OM_t0; // Matrice des positions [x_0 y_0 z_0]
// [x_1 y_1 z_1]
// [x_2 y_2 z_2]
// [   . . .   ]

v=v_t0; // Matrice des vitesses [vx_0 vy_0 vz_0]
// [vx_1 vy_1 vz_1]
// [vx_2 vy_2 vz_2]
// [     . . .    ]

a=a_t0; // Matrice des accélérations [ax_0 ay_0 az_0]           // A voir
// [ax_1 ay_1 az_1]
// [ax_2 ay_2 az_2]
// [     . . .    ]

F=F_t0; // Matrice des forces [Fx_0 Fy_0 Fz_0]
// [Fx_1 Fy_1 Fz_1]
// [Fx_2 Fy_2 Fz_2]
// [     . . .    ]


// Boucle sur la durée de l'expérience
while t_0<=t_fin
  t_0 = t_0 + t_pas;
  
  printf(".");

  // calcul_force
  F_t0=calcul_force(F_t0);


  // Relation Fondamentale de la Dynamique
  // Somme des forces = m * accélération
  // F=m*a
  // a=F/m
  a_t0=F_t0/m;

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
  OM_t0=OM_tp1;
  v_t0=v_tp1;
  // a_t0=a_tp1;
  // F_t0=F_tp1;

  OM_tm1=OM_t0;
  v_tm1=v_t0;

end
// Fin de boucle
printf("\n");	// Retour à la ligne
printf("\n"); // Saut de ligne
printf("Fin des calculs !\n");
printf("\n");




// Mise en forme des résultats
// t (déja mis en forme)


// x y z
x=OM(:,1); // (rem sur TI on ne peut pas récupérer les colonnes mais uniquement les lignes
y=OM(:,2); //    alors (astuce !) on transpose on recupère une ligne et on retranspose)
z=OM(:,3);

// vx vy vz
vx=v(:,1);
vy=v(:,2);
vz=v(:,3);

// ax ay az
ax=a(:,1);
ay=a(:,2);
az=a(:,3);

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
printf("sebastien.celles@ac-limoges.fr\n");
//xbasc()
