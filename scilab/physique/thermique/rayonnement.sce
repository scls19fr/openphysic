// Etude numérique du rayonnement d'un corps noir

clear

h = 6.6256e-34; 
c0 = 2.9979e8;
nlambda = 1;
clambda = c0/nlambda
kB = 1.3807e-23;

function Llambda = corpsnoir(lambda,T)
  
  // définit la distribution de luminance énergétique monochromatique
  // du rayonnement thermique du corps noir en fonction
  // de la température thermodynamique.
  //   T        temperature [K] (scalaire)
  //   Llambda  luminance énergétique monochromatique
  
  Llambda = (2*h*clambda^2)./(lambda^5)./ (exp(h*clambda./(kB*T*lambda))-1); // Loi de Planck
endfunction

lambda = [1E-10:0.01E-6:2E-6];
T = 10000; // temperature (K)

phi_lambda = corpsnoir(lambda,T);

clf

plot2d(lambda,phi_lambda)

[phi_lambda_max,nmax] = max(phi_lambda);
lambda_max = lambda(nmax);

// Loi du déplacement de Wien : lambda_max*T=sigma_w
sigma_w_exp = lambda_max*T
sigma_w = 2.898768651*10^(-3) // constante de Wien m.K
eps = abs(sigma_w-sigma_w_exp)/sigma_w*100

// Loi de Stefan-Boltzmann M=sigma*T^4
L = inttrap(lambda, phi_lambda);
M = %pi*L // Loi de Lambert
sigma = 5.670400*10^(-8); // constante de Stefan-Boltzmann W m^-2.K^-4
M_exp = sigma*T^4
eps = (M-M_exp)/M*100