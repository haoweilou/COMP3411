later(date(Y,M,D1),date(Y,M,D2)) :- D1>D2.
later(date(Y,M1,_),date(Y,M2,_)) :- M1>M2.
later(date(Y1,_,_),date(Y2,_,_)) :- Y1>Y2.