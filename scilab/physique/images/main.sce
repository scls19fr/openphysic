// Traitement d'images numeriques
// Scilab + toolbox SIVP
// http://sivp.sourceforge.net/doc.php

clear // effacement de toutes les variables

stacksize(1E7); // augmentation de la taille de la pile

// Chargement de la toolboxe SIVP


// Chargement de l'image et recuperation dans une hypermatrice
a=imread("lena.png");

// Taille de l'image
si=size(a);
b = hypermat(si);

// Recuperation des canaux RGB
R=a(:,:,1);
G=a(:,:,2);
B=a(:,:,3);

Z=zeros(si(1),si(2));
O=ones(si(1),si(2));

b(:,:,1)=R;
b(:,:,2)=G;
b(:,:,3)=255*O;

Y = 0,299*R + 0,587*G + 0,114*B; // Luminance


//for i=2:(si(1)-1)
//  for j=2:(si(2)-1)
//    c(i,j,1)=0; // R
//    c(i,j,2)=a(i,j,2); // G
//    c(i,j,3)=0; // B
//  end
//end


imshow(a)

// Comparative study of Matlab and Scilab
// http://www.ossrc.org.in/downloads/comparative-study-of-Matlab-and-Scilab.pdf
//Averaging
// The same operation can be accomplished using the imaver function given in the appendix A
// written by srikanth
//  a=imread('d.jpg');
//   si=size(a);
//    for i=2:(si(1)-1)
//         for j=2:(si(2)-1)
//            c(i,j)=a(i,j)+a(i-1,j)+a(i+1,j)+a(i,j+1)+a(i-1,j+1)+a(i+1,j+1)+a(i,j-1)+a(i-1,j-1)+a(i+1,j-1);
//            c(i,j)=c(i,j)/9;
//         end
//    end
//  imshow(c);

//Slicing
// this operation of bit slicing can be performed on SCILAB using the im2bw function where the
// threshold value can be used to control the degree of darkness
//         im=gray_imread('d.jpg');
//         bwim=im2bw(im,0.4);
//         imshow(bwim);

