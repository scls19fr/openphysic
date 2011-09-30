//cmap = hotcolormap(32);
//cmap = graycolormap(32);
cmap = jetcolormap(32);
//cmap = (hotcolormap(32) + jetcolormap(32))/2;

//n=64;
//r=linspace(0,1,n)';
//g=linspace(1,0,n)';
//b=ones(n,1);
//cmap=[r g b];

M = [0:0.01:100];

xset("colormap",cmap);
xbasc();
//isoview();

Matplot(M);
