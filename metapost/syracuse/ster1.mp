% lsystem STER1.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : STER1.LS
% #       Koch snowflake
%
% ratio   3
% seed    F + + F + + F
% rule    F -> F - F + + F - F
% delta   60
% theta   60
% leng    400
% iter    4
% x       0
% y       -235
%% FIN du fichier

input tortue;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        tourne(n,-60);
        F(n,m-1);
        tourne(n,60);
        tourne(n,60);
        F(n,m-1);
        tourne(n,-60);
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
    longueur = 400 / ( 3 ** 4 );
    tortue(1,0,-235,60,1);
    axiome(1,4);
endfig;
end
