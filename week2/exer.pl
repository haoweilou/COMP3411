conc([],X,X).
conc([H|A],T,[H|Result]):-conc(A,T,Result).

insert(X,[],[X]).
insert(X,[Head|Tail],Result):-
X<Head,conc([X],[Head|Tail],Result).
insert(X,[Head|Tail],[Head|Result]):-
insert(X,Tail,Result).