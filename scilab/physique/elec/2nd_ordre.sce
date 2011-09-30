clear();
xbasc();
xdel();
w0 = 1;
Q = 3;
tau=(2*Q)/w0;
T = 2*%pi/(w0*sqrt(1-1/(4*Q^2)));
w = 2*%pi/T;
t=0:0.1:30;
u=exp(-t/tau).*cos(w*t);
legends('Q=3',2,1);
xtitle('2nd ordre','t (s)','U (V)')
plot(t,u,t,0);
