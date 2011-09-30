% lsystem DRAGON1.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : DRAGON1.LS
%
% # next step:
% #   theta := theta - 90
% #   leng  := leng / 2
% #   iter  := iter + 2
%
% ratio   1
% seed    L
% rule    L -> L + R +
% rule    R -> - L - R
% delta   90
% theta   0
% leng    6
% iter    12
% x       160
% y       -66
% blue    .3
% green   .3
% red     1
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (1,.3,.3);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef R(expr n,m) =
   if m>0:
        tourne(n,-90);
        L(n,m-1);
        tourne(n,-90);
        R(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef L(expr n,m) =
   if m>0:
        L(n,m-1);
        tourne(n,90);
        R(n,m-1);
        tourne(n,90);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        L(n,m);
enddef;

beginfig(1);
    longueur = 6 / ( 1 ** 12 );
    tortue(1,160,-66,0,1);
    axiome(1,12);
endfig;
end
