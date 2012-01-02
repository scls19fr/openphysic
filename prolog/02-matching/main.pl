/*
 Prolog programming for artificial intelligence - Bratko, Ivan (2001)
 http://www.ailab.si/ivan
 Chapter 2 : matching
*/

/* FACTS */




vertical(seg(point(X,Y), point(X,Y1))).
horizontal(seg(point(X,Y), point(X1,Y))).

/* QUERIES */

/*
?- triangle = triangle,
point(1,1) = X,
A = point(4, Y),
point(2,3) = point(2,Z).
X = point(1, 1),
A = point(4, Y),
Z = 3.

?- vertical(seg(point(1, 1), point(1, 2))).
true

?- vertical(seg(point(1, 1), point(2, Y))).
false.

?- horizontal(seg(point(1,1),point(2,Y))).
Y = 1.
*/