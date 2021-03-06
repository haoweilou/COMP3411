% A grammar the covers most of the examples in COMP3411 lectures

:- dynamic(history/1).

sentence(VP) --> noun_phrase(Number, Actor), verb_phrase(Actor, Number, VP).

noun_phrase(plural, set(NP1, NP2)) --> np1(_, NP1), [and], noun_phrase(_, NP2).
noun_phrase(Number, NP1) --> np1(Number, NP1).

np1(Number, thing(Noun, Properties)) -->
	determiner(Number, _),
	adjp(Properties),
	noun(Number, Noun).
np1(Number, thing(Noun, [PP | Properties])) -->
	determiner(Number, _),
	adjp(Properties),
	noun(Number, Noun),
	pp(Number, PP).
np1(Number, thing(Name, [])) -->
	proper_noun(Number, _, Name).
np1(Number, personal(Pro)) -->
	pronoun(Number, _, Pro).
np1(Number1, possessive(Pos, NP)) -->
	possessive_pronoun(Number1, _, Pos), noun_phrase(_, NP).
np1(Number, object(Noun)) -->
	num(Number), noun(Number, Noun).

adjp([Adj]) --> adjective(Adj).
adjp([]) --> [].

verb_phrase(Actor, Number, event(V, [actor(Actor) | Adv])) -->
	verb(Number, V),
	adverb(Adv).
verb_phrase(Actor, Number, event(V, [actor(Actor), object(NP) | Adv])) -->
	verb(Number, V),
	noun_phrase(_, NP),
	adverb(Adv).
verb_phrase(Actor, Number, event(V, [actor(Actor), object(NP), PP])) -->
	verb(Number, V),
	noun_phrase(_, NP),
	pp(Number, PP).
verb_phrase(Actor, Number, event(V, [actor(Actor), PP])) -->
	verb(Number, V),
	pp(_, PP).

pp(_, PP) --> prep(NP, PP), noun_phrase(_, NP).

% The next set of rules represent the lexicon

prep(NP, object(NP)) --> [of].
prep(NP, object(NP)) --> [to].
prep(NP, instrument(NP)) --> [with].
prep(NP, object(NP)) --> [in].
prep(NP, object(NP)) --> [for].

determiner(singular, det(a)) --> [a].
determiner(_, det(the)) --> [the].
determiner(plural, det(those)) --> [those].
determiner(_, _) --> [].

pronoun(singular, masculine, he) --> [he].
pronoun(singular, feminine, she) --> [she].
pronoun(singular, neutral, that) --> [that].
pronoun(plural, neutral, those) --> [those].
pronoun(singular, neutral, Pro) --> [Pro], {member(Pro, [i, someone, it])}.
pronoun(plural, neutral, Pro) --> [Pro], {member(Pro, [they, some])}.

possessive_pronoun(singular, masculine, his) --> [his].
possessive_pronoun(singular, feminine, her) --> [her].

prep(of) --> [of].
prep(to) --> [to].
prep(with) --> [with].
prep(in) --> [in].
prep(for) --> [for].

num(singular) --> [one].
num(plural) --> [two];[three];[four];[five];[six];[seven];[eight];[nine];[ten].

noun(singular, Noun) --> [Noun], {thing(Noun, Props), member(number(singular), Props)}.
noun(plural, Noun) --> [Noun], {thing(Noun, Props), member(number(plural), Props)}.

proper_noun(singular, Gender, Name) -->
	[Name],
	{
		thing(Name, Props), member(isa(person), Props), member(gender(Gender), Props)
	}.
proper_noun(singular, neutral, france) --> [france].

adjective(prop(Adj)) --> [Adj], {member(Adj, [red,green,blue])}.

verb(_, Verb) --> [Verb], {member(Verb, [lost,found,did,gave,looked,saw,forgot,is])}.
verb(singular, Verb) --> [Verb], {member(Verb, [scares,hates])}.
verb(plural, Verb) --> [Verb], {member(Verb, [scare,hate])}.

adverb([adv(too)]) --> [too].
adverb([]) --> [].

% You may chose to use these items in the database to provide another way
% of capturing an objects properties.

thing(john, [isa(person), gender(masculine), number(singular)]).
thing(sam, [isa(person), gender(masculine), number(singular)]).
thing(bill, [isa(person), gender(masculine), number(singular)]).
thing(jack, [isa(person), gender(masculine), number(singular)]).
thing(monet, [isa(person), gender(masculine), number(singular)]).

thing(mary, [isa(person), gender(feminine), number(singular)]).
thing(annie, [isa(person), gender(feminine), number(singular)]).
thing(sue, [isa(person), gender(feminine), number(singular)]).
thing(jill, [isa(person), gender(feminine), number(singular)]).

thing(wallet, [isa(physical_object), gender(neutral), number(singular)]).
thing(car, [isa(physical_object), gender(neutral), number(singular)]).
thing(book, [isa(physical_object), gender(neutral), number(singular)]).
thing(telescope, [isa(physical_object), gender(neutral), number(singular)]).
thing(pen, [isa(physical_object), gender(neutral), number(singular)]).
thing(pencil, [isa(physical_object), gender(neutral), number(singular)]).
thing(cat, [isa(physical_object), gender(neutral), number(singular)]).
thing(mouse, [isa(physical_object), gender(neutral), number(singular)]).
thing(man, [isa(physical_object), gender(neutral), number(singular)]).
thing(bear, [isa(physical_object), gender(neutral), number(singular)]).

thing(cats, [isa(physical_object), gender(neutral), number(plural)]).
thing(mice, [isa(physical_object), gender(neutral), number(plural)]).
thing(men, [isa(physical_object), gender(neutral), number(plural)]).
thing(bears, [isa(physical_object), gender(neutral), number(plural)]).

thing(capital, [isa(abstract_object), gender(neutral), number(singular)]).

thing(france, [isa(place), gender(neutral), number(singular)]).

event(lost, [actor(_), object(_), tense(past)]).
event(found, [actor(_), object(_), tense(past)]).
event(saw, [actor(_), object(_), tense(past)]).
event(forgot, [actor(_), object(_), tense(past)]).
event(scares, [actor(_), object(_), tense(present), number(singular)]).
event(scare, [actor(_), object(_), tense(present), number(plural)]).
event(hates, [actor(_), object(_), tense(present), number(singular)]).
event(hate, [actor(_), object(_), tense(present), number(plural)]).
event(gave, [actor(Person1), recipient(Person2), object(_), tense(past)]) :- Person1 \= Person2.

personal(i, [number(singular), gender(neutral)]).
personal(he, [number(singular), gender(masculine)]).
personal(she, [number(singular), gender(feminine)]).
personal(it, [number(singular), gender(neutral)]).
personal(that, [number(singular), gender(neutral)]).
personal(those, [number(plural), gender(neutral)]).
personal(they, [number(plural), gender(neutral)]).

possessive(his, [number(singular), gender(masculine)]).
possessive(her, [number(singular), gender(feminine)]).

% You have to write this:
% Stop if there is no logical form
search_noun_verb([]).
% List
search_noun_verb([X]):-search_noun_verb(X).
% object
search_noun_verb(object(X)):-search_noun_verb(X).
% actor
search_noun_verb(actor(X)):-search_noun_verb(X).
% If the current form is pronouns, skip and search next
search_noun_verb(possessive(_,LogicalForm)):-
    search_noun_verb(LogicalForm).
search_noun_verb(personal(_)).
% Save information into history if the current word is noun, and search next
search_noun_verb(thing(Name,LogicalForm)):-
    thing(Name,Properties),
    assert(history(thing(Name,Properties))),
    search_noun_verb(LogicalForm).
% And
search_noun_verb(set(A,B)):-search_noun_verb(A),search_noun_verb(B).
% Save information into history if the current word is verb, search for actor and object
search_noun_verb(event(Verb,[Actor,Object])):-
    search_noun_verb(Actor),search_noun_verb(Object),
    assert(history(event(Verb,[Actor,Object]))).
% Particular for gave
search_noun_verb(event(Verb,[actor(Actor),recipient(Recipient),object(Object)])):-
    search_noun_verb(Actor),
    search_noun_verb(Recipient),
    search_noun_verb(Object),
    assert(history(event(Verb,[actor(Actor),recipient(Recipient),object(Object)]))).

% object
search_pronouns(object(X),Answer):-search_pronouns(X,Answer).
% actor
search_pronouns(actor(X),Answer):-search_pronouns(X,Answer).
% Verb
search_pronouns(event(_,[Actor,Object]),Answer):-
    search_pronouns(Actor,Lis1),
    search_pronouns(Object,Lis2),
    append(Lis1,Lis2,Answer).
% If and exist
search_pronouns(set(A,B),Answer):-
    search_pronouns(A,A1),
    search_pronouns(B,B1),
    append(A1,B1,Answer),
    assert(history(set(A,B))).
% Noun
search_pronouns(thing(_,[]),[]).
search_pronouns(thing(_,[Head|Tail]),Answer):-
    search_pronouns(Head,A1),
    search_pronouns(thing(_,Tail),B1),
    append(A1,B1,Answer).
% If it is pronouns
search_pronouns(possessive(Name,LogicalForm),[Name|List1]):-
    search_pronouns(LogicalForm,List1).
search_pronouns(personal(Name),[Name]).
% Start search objects
search_objects([],[]).

search_objects([Head|Tail],[Found|Remain]):-
    search_in_db(Head,Found),
    search_objects(Tail,Remain).

search_in_db(Pronouns,Answers):-
    Pronouns = he,history(thing(Answers,[isa(person), gender(masculine), number(singular)]));
    Pronouns = his,history(thing(Answers,[isa(person), gender(masculine), number(singular)]));
    Pronouns = she,history(thing(Answers,[isa(person), gender(feminine), number(singular)]));
    Pronouns = her,history(thing(Answers,[isa(person), gender(feminine), number(singular)]));
    Pronouns = it,history(thing(Answers,[isa(physical_object), gender(neutral), number(singular)]));
    Pronouns = they,history(set(thing(A,_),thing(B,_))),Answers=[A,B].

find_they(Prev,[Name|Answers2]):- 
    history(thing(Name,_)),
    not(member(Name,Prev)),
    append(Prev,[Name],Prev1),
    find_they(Prev1,Answers2).

    

process([],[],[]).
process(LogicalForm, Ref1, Ref2):-
    search_noun_verb(LogicalForm),
    search_pronouns(LogicalForm,Answer),
    search_objects(Answer,Object),
    append(Ref1,Object,Ref2).

run(S, Refs) :-
	sentence(X, S, []), !,
	writeln(X),
	process(X, [], Refs),
	listing(history/1).