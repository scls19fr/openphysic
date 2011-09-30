// Mouvement d'un satellite
// Sebastien CELLES

clear;
xdel;

G = 6.67E-11; // USI // constante

Rterre = 6378E3; // m // rayon de la Terre
Mterre = 5.9736E24; // kg // masse de la Terre

// temps
t0 = 0;
delta_t = 60;
tmax = 3600*24;
t = [t0:delta_t:tmax];
N = size(t,'c'); // nb de points


// Planète A
mA = Mterre; // kg // masse du point A
OA_0 = [0 0 0]; // m // position du point A
//vA_0 = [0 0 0]; // m/s // vitesse du point A

// Satellite B
mB = 100; // kg masse du point B

d_sat_geo = 35786E3+Rterre; // m // 36000km = hauteur Sat pour sat geostationnaire (par rapport au niveau du sol de la Terre)
v_sat_geo = 3.07E3; // m/s // vitesse sat geostationnaire
d = d_sat_geo;
v = v_sat_geo;;

//d = 16000E3;
//v = 3.08E3;

//d = 50000E3;
//v = 5E3;

OB_0 = [0 d 0]; // position du point B
vB_0 = [v 0 0]; // m/s // vitesse du point B
//vB_0 = [v*cos(45) -v*sin(45) 0];

// init A
OA = OA_0;
//vA = vA_0;

// init B
OB = OB_0;
vB = vB_0;


//ETAT_A_0 = [OA_0 ; vA_0];
ETAT_B_0 = [OB_0 ; vB_0];

// init ETAT
//ETAT_A = ETAT_A_0;
ETAT_B = ETAT_B_0;

function [f]=MonSecondMembre(t,ETAT)
  OB=ETAT(1,:);
  AB = OB - OA; // \vect{AB}
  F_AB = - G * (mA * mB) * AB / (norm(AB)^3);
  //F_BA = - F_AB;
  
  f(1,:) = ETAT(2,:);
  f(2,:) = F_AB/mB;
endfunction

ETAT_B = ode(ETAT_B_0,t0,t,MonSecondMembre);
POS_B = ETAT_B(1,:);
VIT_B = ETAT_B(2,:);
// size(POS_B) = 1 ligne et 4323 colonnes (4323=3*1441)

// tranformation en 3 vecteurs colonnes de 1441 lignes
//X_B = zeros(N,1);
//Y_B = X_B;
//Z_B = X_B;
//for n=1:1:N
// X_B(n) = POS_B(3*n - 2);
// Y_B(n) = POS_B(3*n - 1);
// Z_B(n) = POS_B(3*n);
//end
M_POS_B = matrix(POS_B',3,N)';
X_B = M_POS_B(:,1);
Y_B = M_POS_B(:,2);
Z_B = M_POS_B(:,3);
r_B = sqrt(X_B^2+Y_B^2+Z_B^2);

M_VIT_B = matrix(VIT_B',3,N)';
VX_B = M_VIT_B(:,1);
VY_B = M_VIT_B(:,2);
VZ_B = M_VIT_B(:,3);
V_B = sqrt(VX_B^2+VY_B^2+VZ_B^2);


isoview(min(X_B),max(X_B),min(Y_B),max(Y_B));
plot2d(X_B,Y_B,style=0); // trajectoire du satellite

xarc(-Rterre/2,Rterre/2,Rterre,Rterre,0,360*64); // dessin de la Terre

//halt()
//xbasc()
//plot2d(r_B,V_B,style=0); // plan de phase
