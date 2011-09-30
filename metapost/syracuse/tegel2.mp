% lsystem TEGEL2.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : TEGEL2.LS
% #       Tegel-moza‹ek
%
% ratio   3
% seed    F - F - F - F
% rule    F -> F + F - F - F + F
% delta   90
% theta   135
% leng    332
% iter    4
% x       0
% y       -235
% blue    0
% green   1
% red     1
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (1,1,0);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        tourne(n,90);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,90);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        F(n,m);
        tourne(n,-90);
        F(n,m);
        tourne(n,-90);
        F(n,m);
        tourne(n,-90);
        F(n,m);
enddef;

beginfig(1);
    longueur = 332 / ( 3 ** 4 );
    tortue(1,0,-235,135,1);
    axiome(1,4);
endfig;
end
