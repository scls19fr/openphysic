clear
T=1;  // periode
N=10000; // N = nombre de points de calcul -1
t=[0:T/N:T]'; // temps

// Continu
function [u]=u_continu()
	DC=5;
	u=DC*ones(N+1,1);
endfunction	

// Rectangle
function [u]=u_rectangle()
	Umax=1;
	Umin=-1;
	alpha=0.5;
	u=[];
	for time=0:T/N:T
		if (time<alpha*T)
			u=[u;Umax];
		else
			u=[u;Umin];
		end
	end
endfunction

// Rampe
function [u]=u_rampe()
	Umax=1;
	Umin=-1;
	u=(Umax-Umin)/T*t+Umin;
endfunction

// Triangle
function [u]=u_triangle()
	Umax=1;
	Umin=-1;
	alpha=0.5;
	u=[]
	for time=0:T/N:T
		if (time<alpha*T)
			u=[u;(Umax-Umin)/(alpha*T)*time+Umin]
		else
			u=[u;-(Umax-Umin)/((1-alpha)*T)*(time-alpha*T)+Umax]
		end
	end
endfunction



function Umoy=moyenne(u)
	Umoy=mean(u)
endfunction

function Ueff=efficace(u)
	Ueff=sqrt(mean(u.*u))
endfunction


// Changer le signal ici
// =====================
//u=u_continu();
//u=u_rectangle();
//u=u_rampe();
u=u_triangle();

plot2d(t,u)
Umoy=moyenne(u)
Ueff=efficace(u)

