clear;

fc = 12800; // freq de coupure filtre passe-bas
fs = 44100; // freq echantillonnage

// filtre passe bas analogique
//hs=analpf(20,'ellip',[1E-4 1E-4],fc);
//fr=20:100:20000;
//hf=freq(hs(2),hs(3),%i*fr);
//hm=abs(hf);
//plot(fr,hm)

// filtre numerique RII reponse impulsionnelle infinie (passe-bande)
//hz=iir(3,'bp','ellip',[.15 .25],[.08 .03]);
//[hzm,fr]=frmag(hz,256);
//plot2d(fr',hzm');
//xtitle('Discrete IIR filter band pass  0.15<fr<0.25 ',' ',' ');
//q=poly(0,'q');     //to express the result in terms of the ...
//hzd=horner(hz,1/q); //delay operator q=z^-1

// filtre numerique RII passe-bas (low-pass)
//On parle de réponse infinie quand le mode de calcul du flux de sortie
//dépend à la fois des valeurs du flot d'entrée et des valeurs du flot
//de sortie calculées précédemment. Si l'on applique une impulsion en
//entrée de ce filtre, la sortie peut ne jamais se stabiliser, d'où
//cette idée de réponse infinie à une impulsion.
//[hz]=iir(15,'lp','ellip',[0.1 0],[1E-4 1E-4]);
//[hzm,fr]=frmag(hz,256);
//plot2d(fr',hzm');


[hz]=iir(15,'lp','ellip',[fc/fs 0],[1E-4 1E-4]);
[hzm,fr]=frmag(hz,256);
plot2d(fr',hzm');

// ???
//[cells,fact,zzeros,zpoles]=eqiir('lp','ellip',[2*%pi*fc,2*%pi*2*fc],1E-6,1E-6);
//hz=fact*poly(zzeros,'z')/poly(zpoles,'z');
//[hzm,fr]=frmag(hz,256);
//plot2d(fr',hzm');

// filtre numerique RIF passe-bas (low-pass)
//On parle de réponse finie quand le mode de calcul du flot de sortie
//ne dépend que des valeurs du flot d'entrée. De ce fait, quel que
//soit le filtre, sa réponse à une impulsion aura une valeur finale,
//stable, dépendant du nombre de coefficients du filtre.
//[hz]=ffilt('lp',20,0.1,0);
//[hzm,fr]=frmag(hz,256);
//plot2d(fr',hzm');

