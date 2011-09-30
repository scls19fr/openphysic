clear();
xbasc();
xdel();
tau = 5;
t=0:0.1:30;
u=exp(-t/tau);
legends('tau = 5s',2,1);
xtitle('1er ordre','t (s)','U (V)')
plot(t,u,t,0);
