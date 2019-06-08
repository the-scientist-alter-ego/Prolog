% :- use_module(library(tabling)).
% :- table go/3.

% This is what we use to run the transducer
fst4(Input, Output) :-
  initial(State),
  move(State, Input, Output).

% This is how we know that we've reached the end of the run
move(CurrentState, [], []) :-
  final(CurrentState).

% Use a transition with no eps on either side
move(CurrentState, [A|InString], [B|OutString]) :-
  transition(CurrentState, A, NextState, B),
  A \= eps,
  B \= eps,
  move(NextState, InString, OutString).

% use a transition with eps on the input side
move(CurrentState, InString, [B|OutString]) :-
  transition(CurrentState, eps, NextState, B),
  B \= eps,
  move(NextState, InString, OutString).

% use a transition with eps on the output side
move(CurrentState, [A|InString], OutString) :-
  transition(CurrentState, A, NextState, eps),
  A \= eps,
  move(NextState, InString, OutString).

% here you need to add a move/3 predicate tha can
% handle an epsilon:epsilon transition
move(CurrentState, InString, OutString) :-
  transition(CurrentState, eps, NextState, eps),
  move(NextState, InString, OutString).


%voiceless stops: p,t,k

sigma_q4(X) :-
    X = aa; X = ae; X = ah; X = ao; X = aw; X = ay; X = b; X = ch; X = d; X = dh; X = eh; X = er; X = ey; X = f;
    X = g; X = hh; X = ih; X = iy; X = jh; X = k; X = l; X = m; X = n; X = ng; X = ow; X = oy; X = p; X = r;
    X = s; X = sh; X = t; X = th; X = uh; X = uw; X = v; X = w; X = y; X = z; X = zh;
    X = aa1; X = ae1; X = ah1; X = ao1; X = aw1; X = ay1; X = eh1; X = er1; X = ey1;
    X = ih1; X = iy1; X = ow1; X = oy1; X = uh1; X = uw1.

stressed_vowel(X) :-
    X = aa1; X = ae1; X = ah1; X = ao1; X = aw1; X = ay1; X = eh1; X = er1; X = ey1;
    X = ih1; X = iy1; X = ow1; X = oy1; X = uh1; X = uw1.

initial(1).
final(1).
final(2).

transition(1, s, 2, s).
transition(1, X, 1, X) :-
    X \= s, sigma_q4(X).
transition(1, p, 3, p_h).
transition(1, t, 4, t_h).
transition(1, k, 5, k_h).

transition(2, s, 2, s).
transition(2, X, 1, X) :-
    X \= s, sigma_q4(X).

transition(3, X, 1, X) :-
    stressed_vowel(X).
transition(4, X, 1, X) :-
    stressed_vowel(X).
transition(5, X, 1, X) :-
    stressed_vowel(X).

