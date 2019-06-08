reachable(StartState, FinalState, []) :- StartState = FinalState.
reachable(StartState, FinalState, [H|Input]) :- transition(StartState, H, States), member(X,States), reachable(X, FinalState, Input).