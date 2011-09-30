clear
%theta_deg=[0:5:360]';
%theta=%theta_deg*2*%pi/360;
v1=sin(%theta);
v2=sin(%theta-2*%pi/3);
v3=sin(%theta-4*%pi/3);
u12=v1-v2;
u13=v1-v3;
u23=v2-v3;
u21=v2-v1;
u31=v3-v1;
u32=v3-v2;
plot2d(%theta,[v1 v2 v3 u12 u13 u21 u31 u32])
