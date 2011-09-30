if unknown sh: 
    input fonctions; 
fi;

if unknown Repere: 
    input reperes; 
fi;

%
% Courbe paramétrée
% -----------------------------------------------------------------------------
vardef Courbe(suffix fx)(suffix fy)(expr ti,tf,n) =
    save fpas;
    fpas := (tf-ti)/n;
    (fx(ti),fy(ti)) for i=1 upto n: ..(fx(ti+i*fpas),fy(ti+i*fpas)) endfor
enddef;

%
% Représentation de fonction
% -----------------------------------------------------------------------------
vardef Representation(suffix f)(expr ti,tf,n) =
    save fpas;
    fpas := (tf-ti)/n;
    (ti,f(ti)) for i=1 upto n: ..(ti+i*fpas,f(ti+i*fpas)) endfor
enddef;

%
% Courbe en polaire
% -----------------------------------------------------------------------------
vardef CourbeEnPolaires(suffix r)(expr ti,tf,n) =
    save fpas,t;
    fpas := (tf-ti)/n;
    r(ti)*(cos(ti),sin(ti)) 
    for i=1 upto n: hide(t:=ti+i*fpas) .. r(t)*(cos(t),sin(t)) endfor
enddef;


vardef ChampVecteurs(suffix f)(expr x,y,px,py,dx,couleur) =
  for i = 0 upto (x - rXMIN)/px:
     for j = 0 upto (y - rYMIN)/py:
       drawarrow 
        (((0,0)--dx*unitvector((1,f(x-i*px,y-j*py)))) 
                 shifted (x-i*px,y-j*py)) gENPLACE
                 withcolor couleur;
     endfor
     for j = 0 upto (rYMAX - y)/py:
       drawarrow 
        (((0,0)--dx*unitvector((1,f(x-i*px,y+j*py))))
                 shifted (x-i*px,y+j*py)) gENPLACE
                 withcolor couleur;
     endfor
  endfor
  for i = 0 upto (rXMAX - x)/px:
     for j = 0 upto (y - rYMIN)/py:
       drawarrow 
        (((0,0)--dx*unitvector((1,f(x+i*px,y-j*py)))) 
                 shifted (x+i*px,y-j*px)) gENPLACE
                 withcolor couleur;
     endfor
     for j = 0 upto (rYMAX - y)/py:
       drawarrow 
        (((0,0)--dx*unitvector((1,f(x+i*px,y+j*py)))) 
                 shifted (x+i*px,y+j*py)) gENPLACE
                 withcolor couleur;
     endfor
  endfor
enddef;

endinput;