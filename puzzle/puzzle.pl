


safe(A) :- A = state(F,W,G,_), F=W,W=G; A = state(F,_,G,C), F=G,G=C; A = state(_,W,G,C), W=left, G=right,C=left; A = state(_,W,G,C), W=right, G=left,C=right.


possiblemoves(X,Y) :- X= state(right,right,G,C),Y= state(left,left,G,C); X= state(left,left,G,C),Y= state(right,right,G,C); X= state(right,W,right,C),Y= state(left,W,left,C); X= state(left,W,left,C),Y= state(right,W,right,C); X= state(right,W,G,right),Y= state(left,W,G,left); X= state(left,W,G,left),Y= state(right,W,G,right); X= state(right,W,G,C),Y= state(left,W,G,C); X= state(left,W,G,C),Y= state(right,W,G,C).


solve(F1,W1,G1,C1,F2,W2,G2,C2) :- X = state(F1,W1,G1,C1), safe(X), Z=state(F2,W2,G2,C2), generate(X,Z,[]).


generate(X,Z,_) :- X=Z.
generate(X,Z,V) :- append([X],V,Vnew), possiblemoves(X,Y), safe(Y), not(member(Y,V)), generate(Y,Z,Vnew).

