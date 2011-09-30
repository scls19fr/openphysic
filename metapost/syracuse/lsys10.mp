input tortue.mp; 
numeric d,iter; 
d = 6 ;
iter = 9;
color marron;
marron = (.5,.1,0);
 
path gf;

gf = (0,0)--(1,.8)--(0,0)--(-.5,1)--(0,0)--(-.7,-.1)--(0,0)--(0,-1.2)--(0,0)--(.7,-.4)--(0,0);

def pas(expr x) = x * 2.7mm + .5mm enddef;
def epaisseur(expr x) = .15mm * x + .1mm enddef;
def couleur(expr x) = (x/iter)[green,marron] enddef;

vardef trace(expr a,b) = 
 draw a--b 
      withpen pencircle scaled e
      withcolor c; 
enddef; 
 
%% lsys10
%% règle A => S[---LMA][++++B]
%% règle B => S[++LBg][--Cg]
%% règle C => S[-----LB]S[+MC]
%% règle g => ' ' % seulement exécutée au terme
%% règle L => S+S+S+S+S+S--cycle

vardef A (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m);
 e := epaisseur(m);
 c := couleur(m);
 if m>0:
   avance(n,h,trace);
   blop(n,n+1);
   tourne(n+1,-3*d); 
   L(n+1,m-1);
   retourne(n+1);
   A(n+1,m-1);
   blop(n,n+1);
   tourne(n+1,4*d);
   B(n+1,m-1);
 fi 
enddef; 

vardef B (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m);
 e := epaisseur(m);
 c := couleur(m);
 if m>0:
   avance(n,h,trace);
   blop(n,n+1);
   tourne(n+1,2*d); 
   L(n+1,m-1);
   B(n+1,m-1);
   g(n+1,m-1);
   blop(n,n+1);
   tourne(n+1,-2*d);
   C(n+1,m-1);
   g(n+1,m-1);
 fi 
enddef; 

vardef C (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m);
 e := epaisseur(m);
 c := couleur(m);
 if m>0:
   avance(n,h,trace);
   blop(n,n+1);
   tourne(n+1,-5*d); 
   L(n+1,m-1);
   B(n+1,m-1);
   avance(n,h,trace);
   blop(n,n+1);
   tourne(n+1,d);
   retourne(n+1);
   C(n+1,m-1);
 fi 
enddef; 
  
vardef L (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m/15);
 e := epaisseur(m/10);
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

vardef g (expr n,m) = 
 if m=0: 
   draw (gf scaled 3mm) shifted tortue_xy[n] 
                        withpen pencircle scaled 1pt
                        withcolor .2[red,black]; 
   draw (gf scaled 2.7mm) shifted tortue_xy[n] 
                        withpen pencircle scaled .2pt
                        withcolor black; 
 fi 
enddef; 


beginfig(1); 
tortue(1,0,0,90,1); 
A(1,iter);
endfig;

end