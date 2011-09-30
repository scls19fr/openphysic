ToDo :

 1st_order
T(s) = K / ( 1 + tau * s )

 corr_p
T(s) = K

 corr_pi
serie

parallele

 corr_d ou pd


 corr_pid (academic, parallel, serie)
C(s)=Gr + Td \cdot s + \frac{1}{Ti} \cdot \frac{1}{s}=\frac{Gr \cdot Ti \cdot s + Td \cdot Ti \cdot s^2 + 1}{Ti \cdot s}


 2nd_order
T(s) = K / ( 1 + (2*z/wo) s + (s/wo)^2 )


1st order
=========

Method 1
O(p) * (1 + tau p) = K I(p)
o(t) + tau * do/dt = K i(t)
with do/dt = ( o(t) - o(t-delta_t) ) / delta_t
we get o(t)=f(K,tau,i,o(t-delta_t))


Method 2
do/dt = K/tau i(t) - o(t)
                 do/dt
-i-->*K/tau---->+ --|intgrate|---- o
                -              |
                ^--------------
                o
integrate do/dt to get o(t) (using trapezium rule or Simpson's Rule)

2nd order
=========
y'' + b y' + c y = d ou y'' + 2m*w0^2 y' + w0^2 y = K*w0^2 e
on pose u1=y et u2=y'

u1' = u2
u2' = d - b u2 - c u1

(u1-u1_old)/delta_t = u2
 -> u1 = u2*delta_t+u1_old