year_1953_1996_novels(Book) :- novel(Book,1953); novel(Book,1996).
    %% remove fail and add body/other cases for this predicate


period_1800_1900_novels(Book) :- novel(Book,X), X >= 1800, X =< 1900.
    %% remove fail and add body/other cases for this predicate


lotr_fans(Fan) :- fan(Fan,Y), member(the_lord_of_the_rings, Y).
    %% remove fail and add body/other cases for this predicate


author_names(Author) :- fan(chandler, Y), author(Author, X), member(Z, X), member(Z,Y).
    %% remove fail and add body/other cases for this predicate


fans_names(Fan) :- author(brandon_sanderson, Y), fan(Fan, X), member(Z, X), member(Z,Y).
    %% remove fail and add body/other cases for this predicate


mutual_novels(Book) :- fan(phoebe, X), fan(ross, Y), member(Book, X), member(Book, Y); fan(phoebe, X), fan(monica, Z), member(Book, X), member(Book, Z); fan(ross, Y), fan(monica, Z),member(Book, Y), member(Book, Z).
    %% remove fail and add body/other cases for this predicate
