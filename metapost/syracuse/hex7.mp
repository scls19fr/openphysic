% lsystem HEX7.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : HEX7.LS
% #
%
% move    f
% ratio   2
% seed    F + F + F + F + F + F
% rule    F -> F [ + f ++ F] F
% rule    f -> ff
% delta   60
% theta   210
% leng    235
% iter    6
% x       0
% y       235
% blue    1
% green   .7
% red     .3
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (.3,.7,1);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        blop(n,n+1);
        tourne(n+1,60);
        f(n+1,m-1);
        tourne(n+1,60);
        tourne(n+1,60);
        F(n+1,m-1);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef f(expr n,m) =
   if m>0:
        f(n,m-1);
        f(n,m-1);
   else:
        avance(n,longueur,deplace);
   fi
enddef;

vardef axiome(expr n,m) =
        F(n,m);
        tourne(n,60);
        F(n,m);
        tourne(n,60);
        F(n,m);
        tourne(n,60);
        F(n,m);
        tourne(n,60);
        F(n,m);
        tourne(n,60);
        F(n,m);
enddef;

beginfig(1);
    longueur = 235 / ( 2 ** 6 );
    tortue(1,0,235,210,1);
    axiome(1,6);
endfig;
end
