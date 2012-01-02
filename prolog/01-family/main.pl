/*
 Prolog programming for artificial intelligence - Bratko, Ivan (2001)
 http://www.ailab.si/ivan
 Chapter 1
*/

%write('Prolog - code sample'),nl.
%write('Hello World!'),nl,fail.

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

% parent(tom, X).