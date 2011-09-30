numeric Pi;
numeric E;

Pi := 3.14159265;
E  := 2.71828183;

vardef sin(expr x) = sind(x/Pi*180) enddef;
vardef cos(expr x) = cosd(x/Pi*180) enddef;
vardef tan(expr x) = sin(x)/cos(x) enddef;

vardef exp(expr x) =
        E**x
enddef;

vardef ln(expr x) = mlog(x)/256 enddef;
vardef ch(expr x) = (E**x + E**(-x))/2 enddef;
vardef sh(expr x) = (E**x - E**(-x))/2 enddef;
vardef th(expr x) = (E**(2*x) - 1)/(E**(2*x) + 1) enddef;

endinput