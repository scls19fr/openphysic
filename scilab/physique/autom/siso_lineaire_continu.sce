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


// Retard : voir approximation de Pade
function y=exp_pade(x) // approximation de Pade
 y = syslin('c',(1+x/2)/(1-x/2)); // ordre 1
 //y = syslin('c',(1+x/2+x^2/12)/(1-x/2+x^2/12)); // ordre 2
 //y = syslin('c',(1+x/2+x^2/10+x^3/120)/(1-x/2+x^2/10-x^3/120)); // ordre 3
endfunction


//halt(); // pause
//xbasc(); // effacer ecran

// Calculs
// =======
//poles et zeros (roots) d'un polynome (voir aussi poly)

// Reponse temporelle
// ==================
dt=0.01;
tmin=0;
tmax=5;
t=(tmin:dt:tmax)';
Npts=size(t,'r');
y=csim('step',t,H);

// Réponse à un signal d entree quelconque
Hd=dscr(H,dt); // discretisation
//u=zeros(1,Npts); u(1)=1; // impulse (pic)
//u=ones(1,Npts); // step (echelon)
//u=1*t'; // rampe
//u=t'^2; // parabole 
//yd=dsimul(Hd,u); // reponse //ybfd=flts(u,Hbfd);
//xdel();
//plot2d(t,[yd;u]');
//halt();

clf();
drawlater()
subplot(2,2,1);
  xtitle("Reponse impulsionnelle")
  u=zeros(1,Npts); u(1)=1; // impulse (pic)(ou u(1)=1/dt pour aire unitaire)
  yd=dsimul(Hd,u);
  plot2d(t,[yd;u]');
subplot(2,2,2);
  xtitle("Reponse indicielle")
  u=ones(1,Npts); // step (echelon)
  yd=dsimul(Hd,u);
  plot2d(t,[yd;u]');
subplot(2,2,3);
  xtitle("Reponse a une rampe")
  u=1*t'; // rampe
  yd=dsimul(Hd,u);
  plot2d(t,[yd;u]');
subplot(2,2,4);
  xtitle("Reponse a une parabole")
  u=t'^2; // parabole
  yd=dsimul(Hd,u);
  plot2d(t,[yd;u]');
drawnow()

halt();

// Reponse frequentielle
// =====================
//bode(H,1E-2,1E2);
//black(H)
//nyquyst(H)
clf();
drawlater()
subplot(1,3,1);
  bode(H,1E-2,1E2);
subplot(1,3,2);
  black(H);
subplot(1,3,3);
  nyquist(H);
drawnow()

halt()

// Chaine de retour
// ================
// feedback (/.)
B=ones(1,1); // ones car retour unitaire (et pas 1 pour eviter de confondre H/.1 avec H/0.1 =10*H)
Hbf=H/.B
ybf=csim('step',t,Hbf);

xdel();
clf();
drawlater()
subplot(2,1,1);
  plot2d(t,y);
  xtitle("Reponse indicielle en BO","t","yBO");
subplot(2,1,2);
  plot2d(t,ybf);
  xtitle("Reponse indicielle en BF","t","yBF");
drawnow()

halt();


Hbfd=dscr(Hbf,dt);
clf();
drawlater()
subplot(2,2,1);
  xtitle("Reponse impulsionnelle (BF)")
  u=zeros(1,Npts); u(1)=1; // impulse (pic)(ou u(1)=1/dt pour aire unitaire)
  yd=dsimul(Hbfd,u);
  plot2d(t,[yd;u]');
subplot(2,2,2);
  xtitle("Reponse indicielle (BF)")
  u=ones(1,Npts); // step (echelon)
  yd=dsimul(Hbfd,u);
  plot2d(t,[yd;u]');
subplot(2,2,3);
  xtitle("Reponse a une rampe (BF)")
  u=1*t'; // rampe
  yd=dsimul(Hbfd,u);
  plot2d(t,[yd;u]');
subplot(2,2,4);
  xtitle("Reponse a une parabole (BF)")
  u=t'^2; // parabole
  yd=dsimul(Hbfd,u);
  plot2d(t,[yd;u]');
drawnow()

halt();


clf();
drawlater()
subplot(1,2,1);
  bode(H,1E-2,1E2);
  xtitle("Diagramme de Bode du systeme en BO");
subplot(1,2,2);
  bode(Hbf,1E-2,1E2);
  xtitle("Diagramme de Bode du systeme en BF");
drawnow()


