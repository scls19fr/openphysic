// Cet exemple permet de trouver
// les zeros de y
// en "explorant" les diverses valeurs

clear;

// Trouve l'index des solutions
function [values]=find_zeros_index(y,tol)
res = (abs(y)<tol);
values = [];
  for i=[1:size(y,'r')] do
    if ( res(i,1) ) then
      values = [values;i]
    end
  end
endfunction

// Trouve les diverses solutions (x) à partir
// de l'index trouvé précédemment
function [xval]=x_index(index,x)
xval = [];
  for i=[1:size(index,'r')] do
    xval = [xval;x(index(i,1),1)]
  end
endfunction

// Trouve directement les solutions (x)
// à partir des vecteurs x et y
// et avec une tolérance tol
function [xval]=find_zeros_x(x,y,tol)
  index = find_zeros_index(y,tol);
  xval = x_index(index,t)
endfunction

// Cherche les x tels que y=value
function [xval]=find_value_x(x,y,value,tol)
  index = find_zeros_index(y-value,tol);
  xval = x_index(index,t)
endfunction


// Utilisation
t = [0:1:740]'; // vecteur colonne
y = cos(2*%pi/360*t);
tol = 1E-4;
find_zeros_x(t,y,tol) // solutions x de y(x)=0
//find_value_x(t,y,1,tol) // solutions x de y(x)=1
//find_value_x(t,y,-1,tol) // solutions x de y(x)=-1

