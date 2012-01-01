/*
 Prolog programming for artificial intelligence - Bratko, Ivan (2001)
 http://www.ailab.si/ivan
 Chapter 1
*/

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

female().
male().
male().
female().
female().
female().
male().

% parent(tom, X).