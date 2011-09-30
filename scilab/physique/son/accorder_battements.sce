clear;
n=10; // duree
fs=44100; // frq ech
f1=440; // frq de ref
delta_f = 0.5; // erreur de f
t=soundsec(n, fs);
sref=sin(2*%pi*f1*t)*0.1;
s2=sin(2*%pi*(f1+delta_f)*t)*0.2;
s=sref+s2;
plot2d(t,s);
savewave("accorder_battements.wav",s,fs);
