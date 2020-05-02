append([],X,X).
append([A|B],C,[A|D]):-append(B,C,D).