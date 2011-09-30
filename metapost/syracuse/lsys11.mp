input tortue.mp; 
numeric d,iter; 
d = 3 ;
iter = 15;
color marron;
marron = (.5,.1,0);
 
path gf;

gf = (0,0)--(1,.8)--(0,0)--(-.5,1)--(0,0)--(-.7,-.1)--(0,0)--(0,-1.2)--(0,0)--(.7,-.4)--(0,0);

def pas(expr x) = x * .3mm + .5mm enddef;
def epaisseur(expr x) = .12mm * x + .1mm enddef;
def couleur(expr x) = (x/iter)[green,marron] enddef;

vardef trace(expr a,b) = 
 draw a--b 
      withpen pencircle scaled e
      withcolor c; 
enddef; 

%% lsys11
%% règle A => GS[---fA][++MB];
%% règle B => C
%% règle C => A
%% règle f => g
%% règle g => k
%% règle k => ' ' 
%% règle G => HS
%% règle H => IS
%% règle I => GLMS
%% règle L => S+S+S+S+S+S--cycle
vardef A (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m);
 e := epaisseur(m);
 c := couleur(m);
 if m>0:
   G(n,m-1); 
   avance(n,h,trace); 
   blop(n,n+1); 
   tourne(n+1,-3*d);
   f(n+1,m-1);
   A(n+1,m-1); 
   blop(n,n+1); 
   tourne(n+1,2*d); 
   retourne(n+1);
   B(n+1,m-1); 
 fi 
enddef; 

vardef B (expr n,m) = 
 if m>0: C(n,m-1); fi 
enddef; 

vardef C (expr n,m) = 
 if m>0: A(n,m-1); fi 
enddef; 

vardef f (expr n,m) = 
 if m>0: 
   g(n,m-1); 
 else:
   fill (fullcircle scaled 2.5mm) shifted tortue_xy[n] withcolor .5[red,white]; 
   draw (fullcircle scaled 2.5mm) shifted tortue_xy[n] withcolor red; 
 fi
enddef; 
 
vardef g (expr n,m) = 
 if m>0: 
   k(n,m-1); 
 else:
   draw (gf scaled 5mm) rotated tortue_a[n] shifted tortue_xy[n]
                        withpen pencircle scaled 1pt
                        withcolor .2[red,black]; 
   draw (gf scaled 4.7mm) shifted tortue_xy[n] 
                        withpen pencircle scaled .2pt
                        withcolor black; 
 fi
enddef;

vardef k (expr n,m) = 
  if m=0:
   fill (fullcircle xscaled 5mm yscaled 2mm) shifted tortue_xy[n] withcolor (green+red); 
   draw (fullcircle xscaled 5mm yscaled 2mm) shifted tortue_xy[n] withcolor marron;
  fi
enddef;

vardef G (expr n,m) = 
 save h;
 h := pas(m-1);
 if m>0: 
   H(n,m-1); 
   avance(n,h,trace); 
 fi 
enddef; 

vardef H (expr n,m) = 
 save h;
 h := pas(m-1);
 if m>0: 
   I(n,m-1); 
   avance(n,h,trace); 
 fi 
enddef; 
 
vardef I (expr n,m) = 
 save h;
 h := pas(m-1);
 if m>0: 
   G(n,m-1);
   L(n,m-1);
   retourne(n); 
   avance(n,h,trace); 
 fi 
enddef; 

vardef L (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m);
 e := epaisseur(m/10);
 c := green;
 if m>0: 
   blop(n,n+1);
   for j=1 upto 5:
     avance(n+1,h,trace);
     tourne(n+1,3*d);
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
