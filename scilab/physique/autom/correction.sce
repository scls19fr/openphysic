clear();
xdel();

s=poly(0,'s'); // ou s=%s

// 1er ordre
tau1=1;
H10=1;
H1=syslin('c',H10*1/(1+tau1*s));

// 2nd ordre
H20=1;
z=0.5;
w0=10;
H2=syslin('c',H20/(1+2*z/w0*s+s^2/w0^2));

// 3ieme ordre
w31=1;
w32=10;
w33=1000;
H3=syslin('c',1/((1+s/w31)*(1+s/w32)*(1+s/w33)));

H=H2;

// Correcteur
// ==========
K = 0.7;
Ti = 0.1;
Td = 1;
a = 0.7;
Tph = 0.1;

NoC=1; // pas de correcteur
Cp = K; // correcteur proportionnel
Cav_ph = syslin('c',K*(1+a*s)/(1+Tph*s)); // correcteur a avance de phase
Cret_ph = syslin('c',K*(1+s)/(1+a*Tph*s)); // correcteur a retard de phase
Cpi = K*(1 + syslin('c',1/(Ti*s))); // K*(1 + 1/(Ti*s));
//Cpd = syslin('c',K*(1+Td*s); // K*(1 + Td*s)
//Cpid = syslin('c',K*(1+1/(Ti*s)+Td*s));
//Cpir = // predicteur de Smith

//C = NoC; //pas de correcteur
C = Cpi; // correcteur

Hbo = H * C; // avec correcteur

// Reponse temporelle
// ==================
dt=0.01;
tmin=0;
tmax=5;
t=(tmin:dt:tmax)';
Npts=size(t,'r');
ybo=csim('step',t,Hbo); // reponse indicielle en BO

//xdel();
//plot2d(t,ybo);

// Chaine de retour
// ================
// feedback (/.)
B=ones(1,1); // ones car retour unitaire 
Hbf=Hbo/.B;
ybf=csim('step',t,Hbf); // reponse indicielle en BF
//ybf=csim('impuls',t,Hbf); // reponse impulsionnelle en BF

xdel();
plot2d(t,ybf);

//halt();
//xdel();

//bode(Hbo,1E-2,1E2);
//bode(C,1E-2,1E2);

printf("marge de gain (en BO) = %f\n",g_margin(Hbo));
printf("marge de phase (en BO) = %f\n",p_margin(Hbo));

//black(Hbo);

//nyquist(Hbo);


// Réponse à un signal quelconque
Hbfd=dscr(Hbf,dt); // discretisation
//u=zeros(1,Npts); u(1)=1; // impulse (pic)
u=ones(1,Npts); // step (echelon)
//u=1*t'; // rampe
//u=t'^2; // parabole 
ybfd=dsimul(Hbfd,u); // reponse //ybfd=flts(u,Hbfd);
xdel();
plot2d(t,[ybfd;u]');

