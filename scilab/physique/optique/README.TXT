Ce code devrait tre vectorise
cf http://groups.google.fr/group/comp.soft-sys.math.scilab/browse_thread/thread/758e2c63a1b41434#

Vectorize code
Hello,

I'm writting a code to approximate RGB values for visible wavelengths
(using linear approximation)
I wonder if I can vectorize this code or if I must use a "for" loop to
get R G B value 


Francis
f.drossaert@googlemail.com

When using lambda >= 380 is creating a boolean vector and not a vector
with the elements. You could try to use the boolean vectors with any
if statements in the function. Something like (not tested):

function [R,G,B] = spectre(lambda)

R = zeros(lambda);
G = zeros(lambda);
B = zeros(lambda);

boolvec = (lambda>=380&lambda<=440);
R(boolvec) = (440-lambda(boolvec)/(440-380);
G(boolvec) = 0;
B(boolvec) = 1;

boolvec = (lambda>=440 & lambda<=490);
... 