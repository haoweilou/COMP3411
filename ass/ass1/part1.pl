/*HaoweiLou, z5258575, assignment1-part1*/

/*Q1.1 List Processing-Sumsq_even*/
sumsq_even([],0).
sumsq_even([Head|Tail],Result):-
    mod(Head,2) =:= 0,Power is Head * Head, 
    sumsq_even(Tail,Sum), Result is Power+Sum.
sumsq_even([_|Tail],Sum):-
    sumsq_even(Tail,Sum).
/*Q1.2 List Processing-log_table*/
log_table([],[]).
log_table([Head|Numlist],[[Head,Result]|Resultlist]):-
    Head > 0,Result is log(Head), log_table(Numlist,Resultlist).
log_table([_|Numlist],Resultlist):-
    log_table(Numlist,Resultlist).
/*Q1.3 List Processing-paruns*/
paruns([],[]).
paruns([Head|List],[[Head|Out]|Remain]):-
    mod(Head,2) =:= 0,even(List,Out),
    dele(List,Out,List2),paruns(List2,Remain);
    mod(Head,2) =:= 1,odd(List,Out),
    dele(List,Out,List2),paruns(List2,Remain).

dele(X,[],X).
dele([Head1|List],[Head2|Sublist],Result):-
    Head1=:=Head2, dele(List,Sublist,Result).

even([],[]).
even([Head|List],[Head|Out]):-
    mod(Head,2) =:= 0,even(List,Out).
even([Head|_],[]):-
    mod(Head,2) =:= 1.

odd([],[]).
odd([Head|List],[Head|Out]):-
    mod(Head,2) =:= 1,odd(List,Out).
odd([Head|_],[]):-
    mod(Head,2) =:= 0.
/*prolog terms*/
eval(Expr,V):-Expr.
add(X,Y):-X+Y.
