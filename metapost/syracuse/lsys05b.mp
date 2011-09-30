input tortue.mp; 
numeric d,iter; 
d = 20 ;
iter = 15;
color marron;
marron = (.5,.1,0);
 

def pas(expr x) = x * 3mm + .5mm enddef;
def epaisseur(expr x) = .15mm * x + .1mm enddef;
def couleur(expr x) = (x/iter)[green,marron] enddef;

vardef trace(expr a,b) = 
 draw a--b 
      withpen pencircle scaled e
      withcolor c; 
enddef; 
 
%% lsys5 
%% règle A => SLMA
%% règle L => S+S+S+S+S+S--cycle

vardef A (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m);
 e := epaisseur(m);
 c := marron;
 if m>0:
   avance(n,h,trace);
   L(n,m-1);
   retourne(n);
   A(n,m-1);
 fi 
enddef; 
  
vardef L (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m/9);
 e := epaisseur(m)/4;
 c := green;
 if m>0: 
   blop(n,n+1);
   for j=1 upto 5:
     avance(n+1,h,trace);
     tourne(n+1,d);
   endfor
   avance(n+1,h,trace);
   retourne(n+1);
   tourne(n+1,180);
   avance(n+1,h,trace);
   remplis(n+1,.9*green);
 fi 
enddef; 

beginfig(1); 
tortue(1,0,0,90,1); 
A(1,iter);
endfig;

end