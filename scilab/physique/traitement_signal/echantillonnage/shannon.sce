clear;

n=4; // 4 secondes
f1=6000; // frq fondamental
fmin=20
fmax=20000

rate=44100;
t=soundsec(n, rate);
s=cos(2*%pi*f1*t);

plot(t(1:100),s(1:100));
halt();
xbasc();

playsnd(s);
//savewave("son_sans_repliement.wav",s,rate);

analyze(s,fmin,fmax,rate);
halt();
xbasc();


rate=22050;
t=soundsec(n, rate);
s=cos(2*%pi*f1*t);

plot(t(1:100),s(1:100));
halt();
xbasc();

analyze(s,fmin,fmax,rate);
// 2 raies
//  - une à 6000 Hz = 6 kHz
//  - l'autre (repliement) à 22050-6000 =16050 Hz = 16,05 kHz
halt();
xbasc();

playsnd(s);
//savewave("son_avec_raie_audible.wav",s,rate);

f1=15000;
rate=22050;
t=soundsec(n, rate);
s=cos(2*%pi*f1*t);


analyze(s,fmin,fmax,rate);

playsnd(s);
//savewave("son_avec_repliement.wav",s,rate);
