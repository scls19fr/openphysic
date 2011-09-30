// Résolution de f(x)=0
// par la méthode de Newton

clear

function [y]=f(x)
	y=x^2-1
endfunction

delta_x=1E-09;
err_y=1E-09; // erreur acceptée sur y

x_ini=6; // MODIFIABLE

N=0
x=x_ini
y0=f(x)

err=y0;
while err>err_y
x0=x;
pente=(f(x0+delta_x)-f(x0))/delta_x;
// tangente d'équation
// y = pente*(x-x0)+y0
// On cherche le nouvel x pour lequel y=0
// 0 = pente*(x-x0)+y0 => x=-y0/pente+x0
N=N+1
x=-y0/pente+x0 // Attention pente doit être différent de 0 !
y0=f(x)
err=abs(y0);
end


