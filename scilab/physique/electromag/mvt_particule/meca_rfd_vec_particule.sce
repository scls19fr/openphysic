// Mvt d'une particule dans un chp E et B
//
// Technique : application de la RFD
//								méthode d'Euler

// par Sébastien CELLES
// Commencé le 06/02/2004
//
// Hyp : Terre = réf gali
// Système : particule chg
// Forces : Fe=qE
//          Fm->=q v-> vectoriel B->
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


clear

function [v]=crossP(v1,v2)
  // le produit vectoriel en vectoriel...
  // v1 et v2 doivent etre des matrices (3,n)
  v=zeros(v1)
  v(1,:) = v1(2,:).*v2(3,:) - v1(3,:).*v2(2,:)
  v(2,:) = v2(1,:).*v1(3,:) - v2(3,:).*v1(1,:)
  v(3,:) = v1(1,:).*v2(2,:) - v1(2,:).*v2(1,:)
endfunction

printf("\n");
printf("\n");
printf("Resolution d un probleme de mecanique terrestre en 3 dimensions \n");
printf("\n");
printf("\n");
printf("Calcul en cours... Patientez !\n");
printf("\n");

t_ini=0;              	         // MODIFIABLE defaut : t_ini=0;
t_pas=1E-13;                    // MODIFIABLE defaut : t_pas=0.1;
t_fin=1E-10;                      // MODIFIABLE defaut : t_fin=10;

// Testé sur ATHLON-XP-2100 avec 2000 pts en même pas 1 seconde !

// Exemples

// Obus dang g
//    t_ini = 0;
//    t_pas = 0.001;
// 			t_fin = 1.2;

//    m=1;
//		  q=0;
//		  g=9.81;

//			OM_ini=[0 0 0];
//			V0=10;
//			%alfa=30;
//			v_ini = [0 V0*cos(%alfa*2*%pi/360); V0*sin(%alfa*2*%pi/360)];


// e- dans B
//    t_ini = 0;
//    t_pas = 0.001;
// 			t_fin = 1.2;

// 			m = me;
//    q = qe;
//  	 h1 = 0;
//		  h2 = 0;
//	  	g0 = 0;

//			OM_ini = [0 0 0];
//    V0 = 10
//   	%alfa = 5
//    v_ini = [V0*sin(%alfa*2*%pi/360) 0 V0*cos(%alfa*2*%pi/360)];

//		  B=[0 0 1];

// A faire
// e- dans E
// e- dans E et B

t=[t_ini:t_pas:t_fin]';	// le prime sert à transposer pour avoir un vecteur colonne
N=size(t,'r');

// Constantes
g0 = 0; //9.81
 g = [0 0 -g0];              // Accélération de la pesanteur MODIFIABLE defaut : g=[0 0 -9.81]; (9.81m*s^-2)
h1 = 0;																 // Coefficient de frottement visqueux Fv=h1*v
h2 = 0;																 // Coefficient de frottement fluide   Ff=h2*v^2
qe = 1.6E-19;					 									   // Charge élémentaire
me = 9.109389E-31;												 // Masse d'un électron
mp = 1.672623E-27;												 // Masse d'un proton
mn = 1.676928E-27;												 // Masse d'un neutron
// k		= ;														 // Constante de raideur du ressort				Fr=k*(l-l0)
// l0 = 0.10;																 // Longueur à vide du ressort
// Gc = 6.67259E-11;											// Constante de la loi de gravitation
// R1 =																 // Rayon de la planète 1
// M1 =																 // Masse de la planète 1
// R2 =																 // Rayon de la planète 2
// M2 =																 // Masse de la planète 2
// %epsilon_0 = 1/(4*%pi*8.98755178737E9);
// %mu_0 = 4*%pi*100E-9

// Système
          m = me;                                    // Masse MODIFIABLE defaut : m=1; (1kg)
          q = qe;


// Conditions initiales
          OM_ini = [0 0 0];                       // Position initiale (MODIFIABLE)

          V0 = 10;
          %alfa = 5;			// degré
          //v_ini = [0 V0*cos(%alfa*2*%pi/360) V0*sin(%alfa*2*%pi/360)];        // Vitesse initiale  (MODIFIABLE)
					 v_ini = [V0*sin(%alfa*2*%pi/360) 0 V0*cos(%alfa*2*%pi/360)]; 


          F_ini = [0 0 0]; //m*g;                 // Penser à modifier la "force initiale" F(t=0) pour plus de précision et surtout dans la boucle
          a_ini = F_ini/m;              								// RFD





// Initialisation

t_0=t_ini;          // Instant  courant

OM_t0=OM_ini;        // Position courante
v_t0=v_ini;         // Vitesse  courante
a_t0=a_ini;         // Accélération courante
F_t0=F_ini;         // Force courante

OM_tm1=OM_ini;       // Position précédente (t moins 1)
v_tm1=v_ini;        // Vitesse  précédente (t moins 1)
a_tm1=a_ini;        // Accélération précédente (t moins 1)
F_tm1=F_ini;        // Force    précédente (t moins 1)

OM_tm2=OM_ini;       // Position précédente (t moins 2)
v_tm2=v_ini;        // Vitesse  précédente (t moins 2)
a_tm2=a_ini;        // Accélération précédente (t moins 2)
F_tm2=F_ini;        // Force    précédente (t moins 2)

OM_tp1=[0 0 0];  // Position suivante     (t plus 1)
v_tp1=[0 0 0];   // Vitesse suivante      (t plus 1)
a_tp1=[0 0 0];   // Accélération suivante (t plus 1)
F_tp1=[0 0 0];   // Force  suivante       (t plus 1)

OM=OM_ini;       // Matrice des positions [x_0 y_0 z_0]
                 //                       [x_1 y_1 z_1]
                 //                       [x_2 y_2 z_2]
                 //                       [   . . .   ]

v=v_ini;         // Matrice des vitesses  [vx_0 vy_0 vz_0]
                 //                       [vx_1 vy_1 vz_1]
                 //                       [vx_2 vy_2 vz_2]
                 //                       [     . . .    ]

a=a_ini;         // Matrice des accélérations  [ax_0 ay_0 az_0]           // A voir
                 //                            [ax_1 ay_1 az_1]
                 //                            [ax_2 ay_2 az_2]
                 //                            [     . . .    ]

F=F_ini;            // Matrice des forces         [Fx_0 Fy_0 Fz_0]
                 //                            [Fx_1 Fy_1 Fz_1]
                 //                            [Fx_2 Fy_2 Fz_2]
                 //                            [     . . .    ]


// Boucle sur la durée de l'expérience
k=0;
while N <> size(OM,'r') //t_0<=t_fin,

		 
       //****printf("***********  Nouvel instant t ***********\n");
				
				t_0 = t_0 + t_pas;
				k = k+1;
				
				printf(".");

        
    		  //****t_0

        // Forces             (MODIFIABLE mais ATTENTION !)

           // Poids
           P = m*g;
						
						// Force de frottement visqueux
						// Fv=-h1*v
						Fv = - h1*v_t0;

						// Force de frottement fluide
						// Ff=-h2*v^2
						if norm(v_t0)<>0
							uv_t0 = v_t0/norm(v_t0);	// Vecteur unitaire selon la direction de v à l'instant courant
						else
							uv_t0 = [0 0 0];									// cas où norm(v_t0) = 0
						end
						
						Ff = - h2*(v_t0*v_t0')*uv_t0;
						
						// Force EM Fe + Fb
						// Fe = q * E
						E  = [0 0 0];	// Champ électrique
						Fe = q*E;

						// Fb = q * (v vectoriel B) // Le produit vectoriel n'existe pas dans SciLab il faut "le faire" voir crossP
						B  = [0 0 1]; // Champ magnétique
						Fb = q*((crossP(v_t0',B'))');
						
						// Somme des forces
           F_t0 = P + Fv + Ff + Fe + Fb;



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
				//
				//
				//
				
				OM = [OM ; OM_tp1];
				v = [v ; v_tp1];
				a = [a ; a_t0];
				F = [F ; F_t0];

        // Décalage
                

                OM_t0=OM_tp1;
                v_t0=v_tp1;
//                a_t0=a_tp1;
//                F_t0=F_tp1;

                OM_tm1=OM_t0;
                v_tm1=v_t0;
//                a_tm1=a_t0;
//                F_tm1=F_t0;

                OM_tm2=OM_tm1;
                v_tm2=v_tm1;
//                a_tm2=a_tm1
//                F_tm2=F_tm1;

end


// Fin de boucle
printf("\n");	// Retour à la ligne

printf("\n"); // Saut de ligne
printf("Fin des calculs !\n");
printf("\n");

// Mise en forme des résultats
// t (déja mis en forme)


xbasc()	// ou xclear() permet d'effacer l'écran graphique


// x y z
x=OM(:,1); // (rem sur TI on ne peut pas récupérer les colonnes mais uniquement les lignes
y=OM(:,2); //    alors (astuce !) on transpose on recupère une ligne et on retranspose)
z=OM(:,3);
//printf("\n");
//printf("Trajectoire dans le plan yz\n");
//plot2d(y,z);

//halt()  //c'est une pause mais ça ne s'appelle pas pause() !
//xbasc()	// ou xclear() permet d'effacer l'écran graphique

printf("\n");
printf("Trajectoire dans l espace\n");		// bizarrement SciLab n'aime pas l'aspostrophe
param3d(x,y,z);
//plot3d(x,y,z);	Trace des surfaces

halt()  //c'est une pause mais ça ne s'appelle pas pause() !
xbasc()	// ou xclear() permet d'effacer l'écran graphique

// vx vy vz
vx=v(:,1);
vy=v(:,2);
vz=v(:,3);
printf("\n");
printf("Hodographe\n");
param3d(vx,vy,vz);
//printf("Hodographe dans le plan yz\n");
//plot2d(vy,vz)
//plot3d(vx,vy,vz);

halt()  //c'est une pause mais ça ne s'appelle pas pause() !
xbasc()	// ou xclear() permet d'effacer l'écran graphique

// ax ay az
ax=a(:,1);
ay=a(:,2);
az=a(:,3);
printf("\n");
printf("az = f(ax,ay)\n");
param3d(ax,ay,az);
//printf("az = f(ay)\n");
//plot2d(ay,az);
//plot3d(ax,ay,az);

halt()  //c'est une pause mais ça ne s'appelle pas pause() !
xbasc()	// ou xclear() permet d'effacer l'écran graphique

// Plan de phase x.=f(x)
// sqrt(vx^2+vy^2+vz^2) donne ||v->|| en fonction de t
// sqrt(x^2+y^2+z^2)		  donne ||M->|| en fonction de t
printf("\n");
printf("Plan de Phase\n");
NormV = sqrt(vx^2+vy^2+vz^2);
NormM = sqrt(x^2+y^2+z^2);
plot2d(NormM,NormV)

GLOBAL = [t,x,y,z,vx,vy,vz,ax,ay,az];		// Construction d'une variable contenant tous les résultats
halt()

printf("\n");
printf("\n");
printf("Tous les résultats sont dans les variables t,x,y,z,vx,vy,vz,ax,ay,az et GLOBAL\n");
printf("\n");
printf("\n");
printf("Sebastien CELLES\n");
printf("sebastien.celles@ac-limoges.fr\n");
xbasc()
