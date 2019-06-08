% This is what we use to run the transducer
pluralize(Input, Output) :-
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

sigma_arpabet(X) :-
    X = aa; X = ae; X = ah; X = ao; X = aw; X = ay; X = b; X = ch; X = d; X = dh; X = eh; X = er; X = ey; X = f;
    X = g; X = hh; X = ih; X = iy; X = jh; X = k; X = l; X = m; X = n; X = ng; X = ow; X = oy; X = p; X = r;
    X = s; X = sh; X = t; X = th; X = uh; X = uw; X = v; X = w; X = y; X = z; X = zh.

voiced_nonsibilant(Vns) :-
    sigma_arpabet(Vns),
    not(sibilant(Vns)),
    not(voiceless_nonsibilant(Vns)).

voiceless_nonsibilant(Vlessns) :-
    Vlessns = p; Vlessns = t; Vlessns = k; Vlessns = f; Vlessns = th.

sibilant(S) :-
    S = s; S = sh; S = z; S = jh; S = ch; S = zh.

transition(1, V, 1, V) :-
    voiced_nonsibilant(V).

transition(2, V, 1, V) :-
    voiced_nonsibilant(V).

transition(3, V, 1, V) :-
    voiced_nonsibilant(V).

transition(1, V, 2, V) :-
    voiceless_nonsibilant(V).

transition(2, V, 2, V) :-
    voiceless_nonsibilant(V).

transition(3, V, 2, V) :-
    voiceless_nonsibilant(V).

transition(1, V, 3, V) :-
    sibilant(V).

transition(2, V, 3, V) :-
    sibilant(V).

transition(3, V, 3, V) :-
    sibilant(V).

transition(1, "^", 4, eps).

transition(2, "^", 5, eps).

transition(3, "^", 6, eps).

transition(4, s, 8, z).

transition(5, s, 8, s).

transition(6, s, 7, ah).

transition(7, eps, 8, z).

transition(8, "#", 9, "#").

initial(1).
final(9).