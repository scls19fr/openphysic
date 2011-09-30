% lsystem FILL3.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : FILL3.LS
% ratio   5
% seed    R
% rule    L -> LL-R-R+L+L-R-RL+R+LLR-L+R+LL+R-LR-R-L+L+RR-
% rule    R -> +LL-R-R+L+LR+L-RR-L-R+LRR-L-RL+L+R-R-L+L+RR
% leng    470
% delta   90
% x       -235
% y       -235
% theta   0
% iter    2
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
        tourne(n,90);
        L(n,m-1);
        L(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,90);
        L(n,m-1);
        tourne(n,90);
        L(n,m-1);
        R(n,m-1);
        tourne(n,90);
        L(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        R(n,m-1);
        tourne(n,-90);
        L(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,90);
        L(n,m-1);
        R(n,m-1);
        R(n,m-1);
        tourne(n,-90);
        L(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        L(n,m-1);
        tourne(n,90);
        L(n,m-1);
        tourne(n,90);
        R(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,-90);
        L(n,m-1);
        tourne(n,90);
        L(n,m-1);
        tourne(n,90);
        R(n,m-1);
        R(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef L(expr n,m) =
   if m>0:
        L(n,m-1);
        L(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,90);
        L(n,m-1);
        tourne(n,90);
        L(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        L(n,m-1);
        tourne(n,90);
        R(n,m-1);
        tourne(n,90);
        L(n,m-1);
        L(n,m-1);
        R(n,m-1);
        tourne(n,-90);
        L(n,m-1);
        tourne(n,90);
        R(n,m-1);
        tourne(n,90);
        L(n,m-1);
        L(n,m-1);
        tourne(n,90);
        R(n,m-1);
        tourne(n,-90);
        L(n,m-1);
        R(n,m-1);
        tourne(n,-90);
        R(n,m-1);
        tourne(n,-90);
        L(n,m-1);
        tourne(n,90);
        L(n,m-1);
        tourne(n,90);
        R(n,m-1);
        R(n,m-1);
        tourne(n,-90);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        R(n,m);
enddef;

beginfig(1);
    longueur = 470 / ( 5 ** 2 );
    tortue(1,-235,-235,0,1);
    axiome(1,2);
endfig;
end
