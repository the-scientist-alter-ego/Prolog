:- use_module(library(tabling)).
:- table s/2.
:- table np/2.
:- table vp/2.
:- table pp/2.
:- table det/2.
:- table n/2.
:- table v/2.
:- table p/2.

% compelte the set of nonterminal rules below
s --> np, vp.
np --> det, n.
np --> np, pp.
vp --> vp, pp.
vp --> v, np.
pp --> p, np.


% complete the set of terminal rules below for
% determiners, nouns, and verbs
det --> [the].

n --> [dogs].
n --> [cats].
n --> [garden].

v --> [chased].


% do NOT edit the rules for prepositions given below
p --> [in].
p --> [by].



