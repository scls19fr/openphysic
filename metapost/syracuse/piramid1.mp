% lsystem PIRAMID1.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : PIRAMID1.LS
% #       Piramide
%
% ratio   4
% seed    F ++ F ++ F
% rule    F -> F F [+ F ++ F ++ F] F F
% delta   60
% theta   240
% leng    542
% iter    4
% x       0
% y       235
% blue    .3
% green   .7
% red     1
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (1,.7,.3);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        F(n,m-1);
        blop(n,n+1);
        tourne(n+1,60);
        F(n+1,m-1);
        tourne(n+1,60);
        tourne(n+1,60);
        F(n+1,m-1);
        tourne(n+1,60);
        tourne(n+1,60);
        F(n+1,m-1);
        F(n,m-1);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        F(n,m);
        tourne(n,60);
        tourne(n,60);
        F(n,m);
        tourne(n,60);
        tourne(n,60);
        F(n,m);
enddef;

beginfig(1);
    longueur = 542 / ( 4 ** 4 );
    tortue(1,0,235,240,1);
    axiome(1,4);
endfig;
end
