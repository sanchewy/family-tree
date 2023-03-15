% Facts
wife(mum, george).
wife(kydd, spencer).
wife(elizabeth, philip).
wife(diana, charles).
wife(anne, mark).
wife(sarah, andrew).

daughter(elizabeth, george).
daughter(elizabeth, mum).
daughter(margaret, george).
daughter(margaret, mum).
daughter(diana, spencer).
daughter(diana, kydd).
daughter(anne, elizabeth).
daughter(anne, philip).
daughter(zara, mark).
daughter(zara, anne).
daughter(beatrice, andrew).
daughter(beatrice, sarah).
daughter(eugenie, andrew).
daughter(eugenie, sarah).

son(charles, philip).
son(charles, elizabeth).
son(andrew, philip).
son(andrew, elizabeth).
son(edward, philip).
son(edward, elizabeth).
son(william, charles).
son(william, diana).
son(harry, charles).
son(harry, diana).
son(peter, mark).
son(peter, anne).

% Rules
husband(A, B) :- wife(B, A).
spouce(A, B) :- wife(A, B); husband(A, B).
child(A, B) :- daughter(A, B); son(A,B).
parent(A, B) :- child(B, A).
grandChild(A, B) :- child(A, C), child(C, B).
greatGrandParent(A, B) :- parent(A, C), parent(C, D), parent(D, B).
brother(A, B) :- parent(C, B), \+(wife(C, _)), son(A, C), A \= B.
sister(A, B) :- parent(C, B), \+(wife(C, _)), daughter(A, C), A \= B.
uncle(A, B) :- brother(A, C), child(B, C).
aunt(A, B) :- sister(A, C), child(B, C).
brotherInLaw(A, B) :- spouce(C, B), brother(A, C).
sisterInLaw(A, B) :- spouce(C, B), sister(A, C).
firstCousin(A, B) :- (aunt(C, B); uncle(C, B)), child(A, C).
