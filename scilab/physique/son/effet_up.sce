clear;
n=20; // n secondes
fs=22050; // frq echantillonnage en Hz
t=soundsec(n, fs);
f1=440; // frq fondamental
s=cos(2*%pi*f1*t)/10;
tau_up=1;
u=1-exp(-t/tau_up);
s2=s.*u;
plot(s);
halt();
xbasc();
plot(s2);
halt();
xbasc();
mapsound(s,dt=0.1,simpl=1,fmin=100,fmax=3000,rate=fs);
savewave("son3.wav",s,fs);
halt();
xbasc();
mapsound(s2,dt=0.1,simpl=1,fmin=100,fmax=3000,rate=fs);
savewave("son3_up.wav",s2,fs);
