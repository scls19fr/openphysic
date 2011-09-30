// Approximate RGB values for Visible Wavelengths
// from http://www.physics.sfasu.edu/astro/color/spectra.html
// converted to Scilab by S. Celles

clear

BITS=8;
MAX=1; // 2^BITS-1; // 2^8-1=255
GAMMA=.80;

function RGB = spectre(lambda)
  // lambda en nm
  
  if lambda>=380 & lambda<=440 then
    R=(440-lambda)/(440-380);
    G=0;
    B=1;

  elseif lambda>=440 & lambda<=490 then
    R=0;
    G=(lambda-440)/(490-440);
    B=1;

  elseif lambda>=490 & lambda<=510 then
    R=0;
    G=1;
    B=(510-lambda)/(510-490);

  elseif lambda>=510 & lambda<=580 then
    R=(lambda-510)/(580-510);
    G=1;
    B=0;

  elseif lambda>=580 & lambda<=645 then
    R=1;
    G=(645-lambda)/(645-580);
    B=0;

  elseif lambda>=645 & lambda<=780 then
    R=1;
    G=0;
    B=0;
    
  else
    R=0;
    G=0;
    B=0;

  end
  
  
  // Let the intensity SSS fall off near the vision limits
  if lambda>700 then
    SSS=.3+.7* (780-lambda)/(780-700)
  elseif lambda<420 then
    SSS=.3+.7*(lambda-380)/(420-380)
  else
    SSS=1
  end
  
  RGB=[R,G,B];
  
  RGB = MAX*(SSS*RGB)^GAMMA;
  
endfunction;

lambda=[380:1:780]';
//lambda=[350:1:800]';

RGB=[];

// Spectum type
//  1=Plain spectrum
//  2=Sodium absorption spectra
//  3=Sodium emission spectra
//  4=Hydrogen Balmer absorption spectra
//  5=Hydrogen Balmer emission spectra

stype=2;

for i=1:size(lambda,'r'),
  title="Plain spectrum";
  x=spectre(lambda(i));
  
  if stype==2 then
    title="Sodium absorption spectra";
    if abs(lambda(i)-589)<1.1 then
      x=[0 0 0];
    end
    
  elseif stype==3 then
    title="Sodium emission spectra";
    if abs(lambda(i)-589)>1 then
      x=[0 0 0];
    end
    
  elseif stype==4 then
    title="Hydrogen Balmer absorption spectra";
    if abs(lambda(i)-410)<1.1 | abs(lambda(i)-433)<1.1 | abs(lambda(i)-486)<1.1 | abs(lambda(i)-656)<1.1 then
      x=[0 0 0];
    end
    
  elseif stype==5 then
    title="Hydrogen Balmer emission spectra";
    if abs(lambda(i)-410)>1 & abs(lambda(i)-433)>1 & abs(lambda(i)-486)>1 & abs(lambda(i)-656)>1 then
      x=[0 0 0];
    end
  end

  RGB=[RGB;x];
end

clf

xset("colormap",[1 0 0 ; 0 1 0 ; 0 0 1]);
plot2d(lambda,RGB)
xtitle('Approximate RGB values for Visible Wavelengths','lambda (nm)','value');

halt('Press a key')

clf
//Matplot
M = [0:1:450];
xset("colormap",RGB);
Matplot(M);
xtitle(title);
