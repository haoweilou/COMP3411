edge(o103, ts).
edge(o103, b3).
edge(o103, o109).
edge(ts, mail).
edge(b3, b1).
edge(b3, b4).
edge(b1, c2).
edge(b1, b2).
edge(c2, c1).
edge(c2, c3).
edge(c1, c3).
edge(b2, b4).
edge(b4, o109).
edge(o109, o119).
edge(o109, o111).
edge(o119, o123).
edge(o119, storage).
edge(o123, 125).
edge(o123, r123).

goal(r123).

depthfirst(N,[N]):-
    goal(N).
depthfirst(N,[N|Path]):-
    edge(N,Neighbours),
    depthfirst(Neighbours,Path).
