// Résolution de f(x)=0
// par dichotomie

clear

function [y]=f(x)
	y=x^2-1
endfunction

N=0
x_start=0 // MODIFIABLE
x_end=5 // MODIFIABLE

err_x = 1E-05; // MODIFIABLE

err = abs(x_end - x_start);

while err>err_x
N=N+1
x_middle = (x_start + x_end)/2;
	if f(x_start)*f(x_middle)<=0 // La solution est entre x_start et x_middle (compris)
   x_start
   x_end = x_middle
	elseif f(x_middle)*f(x_end)<=0 // La solution est entre x_middle et x_end (compris)
		x_start = x_middle
		x_end
	end
  err=abs(x_end-x_start);
end

err_y = abs(f(x_middle))
