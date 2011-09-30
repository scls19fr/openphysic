// Etude du rayonn
h = 6.6260755E-34  // cst de Planck (J.s)
k_B = 1.3806504E-23 // cst de Boltzmann (J/K)
c_0 = 2.99792458E8; // vitesse de la lumière dans le vide (m/s)
c_1 = 2*%pi*h*c_0^2; // cst rayonnement 1
c_2 = h*c_0/k_B ; // cst rayonnement 2

T = 6000; // temperature (K)
lambda = [0:0.1E-6:2E-6];

phi_lambda = (c_1/lambda^5).*(1/(exp(c_2/(lambda*T))-1))'; // loi de rayonnement de Wien

plot2d(lambda,phi_lambda)