clear;
xdel;

filename = "son2";
s1 = loadwave(filename+"_code.wav");
s1 = s1(1,:); // mono ou voie 1 si stereo
//plot(s);
fmin = 20;
fmax = 20000;
fs = 44100; // frq = 44kHz // echantillonnage
n = 1/fs * size(s1,'c'); // duree en s

//analyze(s1,fmin,fmax,rate=fs);
//mapsound(s1,0.1,fmin,fmax,simpl=1,rate=fs);

t = soundsec(n, fs);


fM = 12800; // frq porteuse
fc = fM; // frq coupure filtre passe-bas

// filtre passe-bas avec frequence coupure 12800 Hz
[hz]=iir(15,'lp','ellip',[fc/fs 0],[1E-4 1E-4]);
s2 = flts(s1,hz);
//analyze(s2,fmin,fmax,rate=fs);

// modulation AM avec porteuse 12800 Hz
s3 = s2.*cos(2*%pi*fM*t);
//analyze(s3,fmin,fmax,rate=fs);

// filtre passe-bas avec frequence coupure 12800 Hz
// (c'est le meme filtre)
s4 = flts(s3,hz);
//analyze(s4,fmin,fmax,rate=fs);

//mapsound(s4,0.1,fmin,fmax,simpl=1,rate=fs);

// sauvegarde du son
savewave(filename+"_decode.wav",s4,fs);


