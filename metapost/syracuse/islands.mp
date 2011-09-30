% lsystem ISLANDS.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : ISLANDS.LS
% #       islands
%
% ratio   6
% move    f
% seed    F+F+F+F
% rule    F -> F+f-FF+F+FF+Ff+FF-f+FF-F-FF-Ff-FFF
% rule    f -> ffffff
% leng    236
% delta   90
% x       118
% y       -118
% theta   90
% iter    2
%% FIN du fichier

input tortue;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        tourne(n,90);
        f(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        F(n,m-1);
        tourne(n,90);
        F(n,m-1);
        tourne(n,90);
        F(n,m-1);
        F(n,m-1);
        tourne(n,90);
        F(n,m-1);
        f(n,m-1);
        tourne(n,90);
        F(n,m-1);
        F(n,m-1);
        tourne(n,-90);
        f(n,m-1);
        tourne(n,90);
        F(n,m-1);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        f(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        F(n,m-1);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef f(expr n,m) =
   if m>0:
        f(n,m-1);
        f(n,m-1);
        f(n,m-1);
        f(n,m-1);
        f(n,m-1);
        f(n,m-1);
   else:
        avance(n,longueur,deplace);
   fi
enddef;

vardef axiome(expr n,m) =
        F(n,m);
        tourne(n,90);
        F(n,m);
        tourne(n,90);
        F(n,m);
        tourne(n,90);
        F(n,m);
enddef;

beginfig(1);
    longueur = 236 / ( 6 ** 2 );
    tortue(1,118,-118,90,1);
    axiome(1,2);
endfig;
end
