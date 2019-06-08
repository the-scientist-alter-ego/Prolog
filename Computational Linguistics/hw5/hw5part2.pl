:- use_module(library(tabling)).
:- table s/3.
:- table np/3.
:- table vp/3.
:- table pp/3.
:- table det/3.
:- table n/3.
:- table v/3.
:- table p/3.
% :- table np/2.
% :- table vp/2.
% :- table pp/2.
% :- table det/2.
% :- table n/2.
% :- table v/2.
% :- table p/2.


% enter your rules below
s(s(NP, VP)) --> np(NP), vp(VP).
np(np(DET, N)) --> det(DET), n(N).
np(np(NP, PP)) --> np(NP), pp(PP).
vp(vp(VP, PP)) --> vp(VP), pp(PP).
vp(vp(V, NP)) --> v(V), np(NP).
pp(pp(P, NP)) --> p(P), np(NP).

% complete the set of terminal rules below for
% determiners, nouns, and verbs
det(det(the)) --> [the].

n(n(dogs)) --> [dogs].
n(n(house)) --> [house].
n(n(cats)) --> [cats].
n(n(garden)) --> [garden].

v(v(chased)) --> [chased].


% do NOT edit the rules for prepositions given below
p(p(in)) --> [in].
p(p(by)) --> [by].



