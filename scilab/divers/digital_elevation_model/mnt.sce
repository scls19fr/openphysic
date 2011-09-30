// Generation du maillage d'un plan
// pour faire un modele numerique de terrain

// eq d'un plan
// a1*x+b1*y+c1*z = d1
// ou
// z = a*x + b*y + z0
//  il faut 3 points pour determiner a b z0

clear

delta_z = 0.4; // amplitude chaos

// Definition du plan via 3 points
xA = 0;
yA = 0;
zA = delta_z;

xB = 0;
yB = 100;
zB = delta_z;

xC = 100;
yC = 0;
zC = 4+delta_z;

// Nb de points du maillage
Nx = 10; // nb de points en x
Ny = 50; // nb de points en y

// Definition de xmin, ymin, xmax et ymax
xmin = min(xA, xB, xC);
ymin = min(yA, yB, yC);

xmax = max(xA, xB, xC);
ymax = max(yA, yB, yC);

// Debut des calculs
x = xmin;
y = ymin;
z = 0;

A3 = [xA yA 1 ; xB yB 1 ; xC yC 1];
Z3 = [zA ; zB ; zC];
X3 = A3^-1*Z3;
a  = X3(1);
b  = X3(2);
z0 = X3(3);

X = [];
Y = [];
Z = [];

for i=1:Nx,
  for j=1:Ny,
    X = [X ; x];
    Y = [Y ; y];
    z = a*x + b*y + z0;
    z = z + delta_z*((rand()-0.5)*2);
    Z = [Z ; z];
    y = ymin + j * (ymax - ymin) / Ny;
  end
  x = xmin + i * (xmax - xmin) / Nx;
end

// [X';Y';Z']'

//mprintf("%.3f;%.3f;%.3f\n",X,Y,Z); // sortie stdout

// Generation du fichier csv
fd = mopen("mnt.csv","w"); // ouverture en ecriture d'un fichier
sep = ",";
mfprintf(fd,"%.3f"+sep+"%.3f"+sep+"%.3f"+"\n",X,Y,Z); // sortie fichier
mclose(fd); // fermeture du fichier

clf
param3d(X,Y,Z);
//plot3d(X,Y,Z);