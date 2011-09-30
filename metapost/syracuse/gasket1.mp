% lsystem GASKET1.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : GASKET1.LS
% ratio   2
% seed    R
% rule    L -> R + L + R
% rule    R -> L - R - L
% delta   60
% theta   0
% leng    542
% iter    6
% x       -271
% y       -235
% blue    .3
% green   .3
% red     .8
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (.8,.3,.3);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef R(expr n,m) =
   if m>0:
        L(n,m-1);
        tourne(n,-60);
        R(n,m-1);
        tourne(n,-60);
        L(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef L(expr n,m) =
   if m>0:
        R(n,m-1);
        tourne(n,60);
        L(n,m-1);
        tourne(n,60);
        R(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        R(n,m);
enddef;

beginfig(1);
    longueur = 542 / ( 2 ** 6 );
    tortue(1,-271,-235,0,1);
    axiome(1,6);
endfig;
end
