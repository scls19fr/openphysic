clear

A0=0; // Valeur moyenne
f1=100; // Fréquence du fondamental

// Rectangle
A=[1, 0, 1/3, 0, 1/5, 0, 1/7, 0, 1/9]; // Amplitude harmoniques de fréquence f1,2*f1,3*f1,...
phi=[0,0,0,0,0,0,0,0,0]; // Amplitude harmoniques de fréquence f1,2*f1,3*f1,...

// Triangle
//A=[1, 0, 1/9, 0, 1/25, 0, 1/49, 0, 1/81]; // Amplitude harmoniques de fréquence f1,2*f1,3*f1,...
//phi=[0,0,%pi,0,0,0,%pi,0,0]; // Amplitude harmoniques de fréquence f1,2*f1,3*f1,...


// Attention A et phi doivent avoir le même nombre d'éléments


t=[0:1/(100*f1):1/f1];

N=min(size(A,'c'),size(phi,'c')); // Nombre d'harmoniques
f=f1*[1:1:N]; //  crée la liste f1,2*f1,3*f1,...

S=A0;
for i=1:1:N
  S=S+A(i)*sin(i*2*%pi*f1*t-phi(i));
end

plot2d(f,A,style=-1)
halt()
xbasc()
plot2d(f,phi,style=-2)
halt()
xbasc()
plot2d(t,S,style=1)


