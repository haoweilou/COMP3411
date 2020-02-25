depthfirst(N,[N]):-goal(N).

depthfirst(N,[N|Path]):-edge(N,Neighbours),depthfirst(Neighbours,Path).

edge(o103,ts).
edge(o103,b3).
edge(o103,o109).
edge(ts,mail).
edge(b3,b1).
edge(o103,o109).
edge(o109,o111).
edge(o119,o111).

iter(Start, Solution, L, MaxDepth):-
    L<MaxDepth,
    bounded_search(Start,Solution, L).
iter(Start,Solution,L,MaxDepth):-
    L<MaxDepth,
    Limit is L + 1,
    write("Increasing Limit to "), writeln(Limit),
    iter(Start,Solution,Limit,MaxDepth).