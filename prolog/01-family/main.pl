/*
 Prolog programming for artificial intelligence - Bratko, Ivan (2001)
 http://www.ailab.si/ivan
 Chapter 1
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
% ??? Who is(are) child(ren) of tom ?
?- parent(tom, X).
% press ";" to see others childrens
X = bob ;
X = liz.
 

% ??? Who is/are Bob parent(s) ?
?- parent(X, bob).
X = pam ;
X = tom ;
false.

% ??? 

*/