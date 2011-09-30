// Generation du maillage d'un terrain
//  definition d'un profil et extrusion

clear

xmin = 0;
xmax = 100;
ymin = 0;
ymax = 100;

// Nb de points du maillage
Nx = 50; // nb d'ecartements en x
Ny = 50; // nb d'ecartements en y

X = [xmin:(xmax-xmin)/(Nx-1):xmax]';
Y = [ymin:(ymax-ymin)/(Ny-1):ymax]';
Z = [];

xlim = 40;
for i=1:Nx,
  x = X(i);
  if x<xlim then,
    z = 0.09 * x;
    zlim = 0.09 * xlim;
  else
    z = 0.02 * (x - xlim) + zlim;
  end
  Z = [Z ; z];
end

clf
plot2d(X, Z, style=-1); // visu profil

X1 = X;
Y1 = Y;
Z1 = Z;
// extrusion
for i=1:Nx-1,
  Y = [Y ; Y1];
end

for j=1:Ny-1,
  X = [X ; X1];
  Z = [Z ; Z1];
end


// Generation du fichier csv
DIR = ""
//DIR = "/Users/scls/openphysic/scilab/divers/digital_elevation_model/"
//DIR = "C:\"
fd = mopen(DIR+"mnt2.csv","w"); // ouverture en ecriture d'un fichier
sep = ",";
mfprintf(fd,"%.3f"+sep+"%.3f"+sep+"%.3f"+"\n",X,Y,Z); // sortie fichier
mclose(fd); // fermeture du fichier

halt

clf
//plot3d(X,Y,Z);

param3d(X,Y,Z);
p=gce();//get the handle on the just drawn polyline
p.mark_mode='on';//enable the mark drawing (a mark at each given point)
p.line_mode='off';//disable line drawing between given points


//drawlater();
//param3d1(X,Y,list(Z,ones(Z)))
//drawnow(); 

//halt

//xdel