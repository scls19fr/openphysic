% lsystem FILL4.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : FILL4.LS
% ratio   3
% ignore  L R
% seed    L
% rule    L -> LFRFL-F-RFLFR+F+LFRFL
% rule    R -> RFLFR+F+LFRFL-F-RFLFR
% rule    F -> F
% leng    470
% delta   90
% x       -235
% y       -235
% theta   90
% iter    3
% blue    .8
% green   0
% red     .7
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (.7,0,.8);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef R(expr n,m) =
   if m>0:
        R(n,m-1);
        F(n,m-1);
        L(n,m-1);
        F(n,m-1);
        R(n,m-1);
        tourne(n,90);
        F(n,m-1);
        tourne(n,90);
        L(n,m-1);
        F(n,m-1);
        R(n,m-1);
        F(n,m-1);
        L(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        F(n,m-1);
        L(n,m-1);
        F(n,m-1);
        R(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef L(expr n,m) =
   if m>0:
        L(n,m-1);
        F(n,m-1);
        R(n,m-1);
        F(n,m-1);
        L(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        F(n,m-1);
        L(n,m-1);
        F(n,m-1);
        R(n,m-1);
        tourne(n,90);
        F(n,m-1);
        tourne(n,90);
        L(n,m-1);
        F(n,m-1);
        R(n,m-1);
        F(n,m-1);
        L(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        L(n,m);
enddef;

beginfig(1);
    longueur = 470 / ( 3 ** 3 );
    tortue(1,-235,-235,90,1);
    axiome(1,3);
endfig;
end
