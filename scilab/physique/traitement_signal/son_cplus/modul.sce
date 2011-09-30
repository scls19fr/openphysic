// codage d'un son (idem Canal+)
clear;

// definition de l'intervalle de frequences etudiees
fmin = 20;
fmax = 20000;

// creation du signal
n = 4; // 4 secondes
fs = 44100; // frq = 44kHz // echantillonnage
t = soundsec(n, fs);
f1 = 1000; // frq fondamental
s1 = cos(2*%pi*f1*t)+cos(2*%pi*3*f1*t)/9+cos(2*%pi*5*f1*t)/25;
//s1 = s1 + cos(2*%pi*17000*t); // composante au dela de 12800 (doit etre filtree)
s1 = s1/(10*max(s1)); // pour ajuster l'amplitude
savewave("son1.wav",s1,fs);
playsnd(s1);
//plot(t,s1);
//analyze(s1,fmin=20,fmax=20000,rate=fs)

// filtre numerique passe-bas avec frq coupure 12800 Hz
// RII ou IIR = reponse impulsionnelle infinie
fc = 12800; // Hz
[hz]=iir(15,'lp','ellip',[fc/fs 0],[1E-4 1E-4]);
s2 = flts(s1,hz);
//analyze(s2,fmin,fmax,rate=fs)

// Modulation d'amplitude
fM = 12800; // Hz
s3 = s2.*cos(2*%pi*fM*t);

analyze(s3,fmin,fmax,rate=fs)

savewave("son1_code.wav",s3,fs);
