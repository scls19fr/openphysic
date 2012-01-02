/*
 Prolog programming for artificial intelligence - Bratko, Ivan (2001)
 http://www.ailab.si/ivan
 Chapter 1 : tree family code sample
*/

/* FACTS */

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female(pam).
female(liz).
female(ann).
female(pat).

male(jim).
male(tom).
male(bob).


offspring(Y, X) :-
  parent(X, Y).

mother(X, Y) :-
  parent(X, Y),
  female(X).

grandparent(X, Z) :-
  parent(X, Y),
  parent(Y, Z).

sister(X, Y) :-
  parent(Z, X),
  parent(Z, Y),
  female(X),
  different(X, Y).

predecessor(X, Z) :-
  parent(X, Z).

predecessor(X, Z) :-
  parent(X, Y),
  predecessor(Y, Z).

/* QUERIES */

/*
% see facts/rules...
?- listing.

% ???  ?
?-

% ??? Is Bob a parent of Pat ?
?- parent(bob, pat).
true.

% ??? Is Liz a parent of Pat ?
?- parent(liz, pat).
false.

% ??? Who is(are) child(ren) of Tom ?
?- parent(tom, X).
% press ";" to see others childrens
X = bob ;
X = liz.
 

% ??? Who is/are parent(s) of Bob ?
?- parent(X, bob).
X = pam ;
X = tom ;
false.

% ??? Who is/are a grandparent of Jim ?
?- grandparent(X, jim).
X = bob ;
false.

% ??? Who are Tom's grandchildren ?
?- grandparent(tom, X).
X = ann ;
X = pat ;
false.

*/