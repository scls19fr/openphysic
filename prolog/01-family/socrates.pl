/* FACTS */

man(socrates). % Socrates is a man
fallible(X) :- man(X). % All men are fallible

/* QUERY (interactive mode only) */
%listing.

% is Socrates fallible ?
% fallible(socrates)