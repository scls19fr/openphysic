// Remplissage d'une matrice avec
// M(i,j) = f(i,j)
// et affichage de la matrice
// selon une Žchelle de couleur

//clear

function f=f(i,j)
  //f = "a(" + string(i) + "," + string(j) + ")"
  f = i+j;
endfunction

lig = [0:0.1:1.2];
col = [0:0.1:0.8]';

clear M
//M = zeros(size(lig,'c'), size(col,'r'));

nb_lig = size(col,'r')
nb_col = size(lig,'c')
for i=1:nb_lig
  for j=1:nb_col
    //y=i;
    //x=j;
    x=lig(1,j);
    y=col(i,1);
    M(i,j)=f(y,x);
  end
end

//M

//colormap
//========

Mmax=max(M);

//cmap = hotcolormap(Mmax);
//cmap = graycolormap(Mmax);
cmap = jetcolormap(Mmax);
//cmap = (hotcolormap(Mmax) + jetcolormap(Mmax))/2;

//n=64;
//r=linspace(0,1,n)';
//g=linspace(1,0,n)';
//b=ones(n,1);
//cmap=[r g b];

xset("colormap",cmap);
clf();
//isoview();

Matplot(M)

//halt;

//clf();
//plot3d(col,lig,M)