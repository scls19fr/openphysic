clear

// Position des charges

//Charge positive seule
OA = [-1 0 0]; // en m
q = [1]; // en C

//Charge négative seule
//OA = [-1 0 0]; // en m
//q = [-1]; // en C


//Dipole Electrostatique + +
//OA = [-0.5 0 0 ; 0.5 0 0]; // en m
//q = [1 ; 1]; // en C

//Dipole Electrostatique + -
//OA = [-0.5 0 0 ; 0.5 0 0]; // en m
//q = [1 ; -1]; // en C


Ncharge = size(q,'r');

// Point où l'on calcule le champ 
OM = [2 2 0]; // en m

// Constantes
epsilon0 = 8.85418781762E-12;
ke = 1/(4*%pi*epsilon0);

// Définition des bornes de l'espace
xmin = -2; xmax = 2; xstep = 0.1; xlist=xmin:xstep:xmax;
ymin = -2; ymax = 2; ystep = 0.1; ylist=ymin:ystep:ymax;
//zmin = -2; zmax = 2; zstep = 0.1; zlist=zmin:zstep:zmax;

DATA = [];
OM_DATA = [];
E_DATA = [];
V_DATA = [];
V_MATRIX = zeros(size(xlist,'c'),size(ylist,'c'));

//for z=zlist,
z = 0;
   for y=ylist,
      for x=xlist,
        V = 0;
        E = [0 0 0];
      
         for i=1:Ncharge,
            OM = [x y z];

            // Vecteur charge -> point où on mesure le champ
            AM = OM - OA(i,:);

            // Calcul du champ électrique E
            if norm(AM) <> 0 then
               E = E + ke * q(i,1) / norm(AM)^3 * AM;
               V = V + ke * q(i,1) / norm(AM);
//            else
               //E = E + [0 0 0];
               //V = V + 0;
            end
     
            
         end
         
         //DATA = [DATA; OM E V];
         OM_DATA = [OM_DATA; OM];
         E_DATA = [E_DATA; E];
         V_DATA = [V_DATA; V];
         //V_MATRIX(x,y) = V;
      end
   end
//end

Ex_DATA = E_DATA(:,1);
Ey_DATA = E_DATA(:,2);
Ez_DATA = E_DATA(:,3);

DATA = [OM_DATA E_DATA V_DATA];


V_MATRIX = zeros(size(xlist,'c'),size(ylist,'c'));


for i=1:size(ylist,'c'), // ligne ; y
  for j=1:size(xlist,'c'), // colonne ; x
    V_MATRIX(size(xlist,'c')-j+1,i) = V_DATA((j-1)*size(xlist,'c')+i);
  end
end


cmap = hotcolormap(32);
//cmap = graycolormap(32);
//cmap = jetcolormap(32);
//cmap = (hotcolormap(32) + jetcolormap(32))/2;

//n=64;
//r=linspace(0,1,n)';
//g=linspace(1,0,n)';
//b=ones(n,1);
//cmap=[r g b];


xset("colormap",cmap);

xbasc(); isoview();
V_MAT2 = V_MATRIX/2E9;
//nc=xget("lastpattern"); // TO FIX Negative value
//V_MAT2 = (V_MAT2-min(V_MAT2))/(max(V_MAT2)-min(V_MAT2))*(nc-1)+1; // TO FIX Negative value
Matplot(V_MAT2)

//champ1(xlist,ylist,...,...);
//matplot ?


