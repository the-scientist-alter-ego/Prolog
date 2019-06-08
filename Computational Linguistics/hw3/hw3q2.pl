% :- use_module(library(tabling)).
% :- table go/3.

% This is what we use to run the transducer
fst2(Input, Output) :-
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

sigma(X) :-
    X = aa; X = ae; X = ah; X = ao; X = aw; X = ay; X = b; X = ch; X = d; X = dh; X = eh; X = er; X = ey; X = f;
    X = g; X = hh; X = ih; X = iy; X = jh; X = k; X = l; X = m; X = n; X = ng; X = ow; X = oy; X = p; X = r;
    X = s; X = sh; X = t; X = th; X = uh; X = uw; X = v; X = w; X = y; X = z; X = zh.

% sym(X) :-
%     X \= p, X \= b, X \= t, X \= d, X \= k, X \= g.

initial(1).
final(1).

transition(1, X, 1, X) :-
    sigma(X).
transition(1, b, 1, p).
transition(1, p, 1, b).
transition(1, t, 1, d).
transition(1, d, 1, t).
transition(1, k, 1, g).
transition(1, g, 1, k).
