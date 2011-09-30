n=4; // 4 secondes
fs=44100; // frq = 44kHz
t=soundsec(n, fs);
f1=440; // frq fondamental
s=cos(2*%pi*f1*t)+cos(2*%pi*3*f1*t)/9+cos(2*%pi*5*f1*t)/25;
s=s/(10*max(s)); // pour ajuster l'amplitude
plot(s);
halt();
xbasc();
analyze(s);
halt();
xbasc();
mapsound(s);
halt();
xbasc();
playsnd(s);
savewave("son2.wav",s,fs);

