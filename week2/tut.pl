insert(Num,[],[Num]).
insert(NUM,[Head|REST1],[Head|REST2]):-NUM>Head,insert(NUM,REST1,REST2).
insert(Num,[Head|REST],[NUM,Head|REST]):-insert(NUM,[],NUM).