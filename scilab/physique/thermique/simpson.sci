function [y] = simpson(a,b,n)

// simpson estime une integrale par la methode de Simpson
// a : borne inferieure
// b : borne superieure
// n : nombre d'intervalles (pair)
// y : valeur de l'integrale

n = 2*ceil(n/2);  // garantit que n soit pair
x = linspace(a,b,n+1)'; // les ordonnees
f = integrand(x);
h = x(2)-x(1);    // le pas

if n==0
  error('nombre d''intervalles insuffisant')
elseif n==2
	y = (f(1)+4*f(2)+f(3))*h/3;
else
	y = f(1)+f(n+1) + 4*sum(f(2:2:n)) + 2*sum(f(3:2:n-1));
	y = y*h/3;
end	
endfunction



function f = integrand(x)
// fournit l'integrand pour le calcul d'integrale
f = 3*sin(%pi*x);
endfunction
