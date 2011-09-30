% lsystem FILL1.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : FILL1.LS
% #       fill
%
% seed    L
% rule    L -> L+R++R-L--LL-R+
% rule    R -> -L+RR++R+L--L-R
% leng    7
% delta   60
% x       180
% y       50
% theta   90
% iter    4
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

vardef R(expr n,m) =
   if m>0:
        tourne(n,-60);
        L(n,m-1);
        tourne(n,60);
        R(n,m-1);
        R(n,m-1);
        tourne(n,60);
        tourne(n,60);
        R(n,m-1);
        tourne(n,60);
        L(n,m-1);
        tourne(n,-60);
        tourne(n,-60);
        L(n,m-1);
        tourne(n,-60);
        R(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef L(expr n,m) =
   if m>0:
        L(n,m-1);
        tourne(n,60);
        R(n,m-1);
        tourne(n,60);
        tourne(n,60);
        R(n,m-1);
        tourne(n,-60);
        L(n,m-1);
        tourne(n,-60);
        tourne(n,-60);
        L(n,m-1);
        L(n,m-1);
        tourne(n,-60);
        R(n,m-1);
        tourne(n,60);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        L(n,m);
enddef;

beginfig(1);
    longueur = 7 / ( 1 ** 4 );
    tortue(1,180,50,90,1);
    axiome(1,4);
endfig;
end
