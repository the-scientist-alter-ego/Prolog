isUnion([], L, L).
isUnion([X|Set1], [X|Set2], [X|Union]) :-  isUnion(Set1,Set2,Union).
isUnion([X|Set1], Set2, [X|Union]) :-  isUnion(Set1,Set2,Union).
    %% remove fail and add body/other cases for this predicate


isIntersection([], _, []).
isIntersection([X|Set1], Set2, [X|Intersection]) :- member(X, Set2), isIntersection(Set1,Set2,Intersection).
isIntersection([X|Set1], Set2, Intersection) :- not(member(X, Set2)), isIntersection(Set1,Set2,Intersection).
    %% remove fail and add body/other cases for this predicate


isEqual([H|T],Set2) :- member(H, Set2), select(H,Set2,S),isEqual(T,S).
isEqual([],[]).
    %% remove fail and add body/other cases for this predicate

padditional(_,[],[]).
padditional(Ha,[H|T],X) :- padditional(Ha,T,Y), append([Z],Y,X), append([Ha],H,Z).


powerSet([H|T],Ps) :- powerSet(T,P), append(P,X,Ps), padditional(H,P,X).
        
powerSet([],[[]]).


