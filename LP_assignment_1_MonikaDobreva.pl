% DAY 1,
% TASK 1 - Gryffindor table

sits_right_of(natalieMcDonald, kathieBell).
sits_right_of(kathieBell, parvatiPatil).
sits_right_of(parvatiPatil, lavenderBrown).
sits_right_of(lavenderBrown, nevilleLongbottom).
sits_right_of(nevilleLongbottom, aliciaSpinnet).
sits_right_of(aliciaSpinnet, fredWeasley).
sits_right_of(fredWeasley, georgeWeasley).
sits_right_of(georgeWeasley, leeJordan).
sits_right_of(leeJordan, dennisCreevey).
sits_right_of(dennisCreevey, deanThomas).
sits_right_of(deanThomas, ginnyWeasley).
sits_right_of(ginnyWeasley, angelinaJohnson).
sits_right_of(angelinaJohnson, seamusFinnigan).
sits_right_of(seamusFinnigan, colinCreevey).
sits_right_of(colinCreevey, harryPotter).
sits_right_of(harryPotter, hermioneGranger).
sits_right_of(hermioneGranger, ronWeasley).
sits_right_of(ronWeasley, natalieMcDonald).

sits_left_of(X, Y) :- sits_right_of(Y, X).

are_neighbors_of(X, Y, Z) :- sits_left_of(X, Z), sits_right_of(Y, Z).

next_to_each_other(X, Y) :- sits_left_of(X, Y).
next_to_each_other(X, Y) :- sits_right_of(X, Y).

% Is Hermione to the right of Harry?
% ?- sits_right_of(hermioneGranger, harryPotter).
% false.

% Is Harry to the right of Ginny?
% ?- sits_right_of(harryPotter, ginnyWeasley).
% false.

% Who is to the right of Harry?
% ?- sits_right_of(X, harryPotter).
% X = colinCreevey.

% Who is sitting at the table?
% ?- sits_right_of(X, Y).
% X = natalieMcDonald,
% Y = kathieBell ;
% X = kathieBell,
% Y = parvatiPatil ;
% X = parvatiPatil,
% Y = lavenderBrown ;
% X = lavenderBrown,
% Y = nevilleLongbottom ;
% X = nevilleLongbottom,
% Y = aliciaSpinnet ;
% X = aliciaSpinnet,
% Y = fredWeasley ;
% X = fredWeasley,
% Y = georgeWeasley ;
% X = georgeWeasley,
% Y = leeJordan ;
% X = leeJordan,
% Y = dennisCreevey ;
% X = dennisCreevey,
% Y = deanThomas ;
% X = deanThomas,
% Y = ginnyWeasley ;
% X = ginnyWeasley,
% Y = angelinaJohnson ;
% X = angelinaJohnson,
% Y = seamusFinnigan ;
% X = seamusFinnigan,
% Y = colinCreevey ;
% X = colinCreevey,
% Y = harryPotter ;
% X = harryPotter,
% Y = hermioneGranger ;
% X = hermioneGranger,
% Y = ronWeasley ;
% X = ronWeasley,
% Y = natalieMcDonald.

% Is Hermione to the left of Harry?
% ?- sits_left_of(hermioneGranger, harryPotter).
% true.

% Who are Neville's neighbors?
% ?- are_neighbors_of(X, Y, nevilleLongbottom).
% X = aliciaSpinnet,
% Y = lavenderBrown.

% Who is sitting two seats to the right of Neville?
% ?- sits_right_of(X, nevilleLongbottom).
% X = lavenderBrown.
% ?- sits_right_of(X, lavenderBrown).
% X = parvatiPatil.

% Who is sitting between Neville and Parvati?
% ?- are_neighbors_of(parvatiPatil, nevilleLongbottom, X).
% false.
% ?- are_neighbors_of(nevilleLongbottom, parvatiPatil, X).
% X = lavenderBrown.

% Are Kathie Bell and Colin Creevey sitting next to each other?
% ?- next_to_each_other(kathieBell, colinCreevey).
% false.

% Are Dean Thomas and Dennis Creevey sitting next to each other?
% ?- next_to_each_other(deanThomas, dennisCreevey).
% true

%TASK 2 - Harry's family relationships

male(harry).
male(paul).
male(albert).
male(james).
male(vernon).
male(dudley).
% adding great-great-grandparents for Harry for testing purposes.
male(greatGrandfather).
male(greatGreatGrandfather).

female(greatGrandmother).
female(greatGreatGrandmother).
female(lili).
female(petunia).
female(ruth).
female(helen).

parent_of(paul, petunia).
parent_of(helen, petunia).
parent_of(paul, lili).
parent_of(helen, lili).
parent_of(albert, james).
parent_of(ruth, james).
parent_of(james, harry).
parent_of(lili, harry).
parent_of(petunia, dudley).
parent_of(vernon, dudley).
parent_of(greatGrandfather, albert).
parent_of(greatGranmother, albert).
parent_of(greatGreatGrandfather, greatGrandfather).
parent_of(greatGreatGrandmother, greatGrandfather).

father_of(Father, Child) :- male(Father), parent_of(Father, Child).
mother_of(Mother, Child) :- female(Mother), parent_of(Mother, Child).

grandfather_of(Grandfather, Child) :- parent_of(Parent, Child), father_of(Grandfather, Parent).
grandmother_of(Grandmother, Child) :- parent_of(Parent, Child), mother_of(Grandmother, Parent).

sister_of(Sister, Person) :- parent_of(Parent, Person), parent_of(Parent, Sister), female(Sister), Sister \= Person.

aunt_of(Aunt, Person) :- parent_of(Parent, Person), sister_of(Aunt, Parent).
uncle_of(Uncle, Person) :- aunt_of(Aunt, Person), mother_of(Aunt, Other), father_of(Uncle, Other).

ancestor_of(X, Y) :- parent_of(X, Y).
ancestor_of(X, Y) :- parent_of(X, Z), ancestor_of(Z, Y).

not_parent(X, Y) :- not(parent_of(X, Y)).


% Does Harry have an uncle?
% ?- uncle_of(X, harry).
% X = vernon .

% Who are the grandparents of Harry?
% ?- grandmother_of(X, harry).
% X = ruth ;
% X = helen .
% ?- grandfather_of(X, harry).
% X = albert ;
% X = paul ;
% false.

% Who are the grandchildren of Paul and Helen?
% ?- grandmother_of(helen, X).
% X = harry ;
% X = dudley ;
% false.
% ?- grandfather_of(paul, X).
% X = harry ;
% X = dudley ;
% false.

% Does James have a sister?
% ?- sister_of(X, james).
% false.

% Is Albert an ancestor of Harry?
% ?- ancestor_of(albert, harry).
% true ;
% false.

% Who are the ancestors of Harry?
% ?- ancestor_of(X, harry).
% X = james ;
% X = lili ;
% X = paul ;
% X = helen ;
% X = albert ;
% X = ruth ;
% X = greatGrandfather ;
% X = greatGranmother ;
% X = greatGreatGrandfather ;
% X = greatGreatGrandmother ;
% false.

% Is Dudley an ancestor of Harry?
% ?- ancestor_of(dudley, harry).
% false.

% Who are the descendants of James?
% ?- ancestor_of(james, X).
% X = harry ;
% false.

% Is Dudley a parent of Harry?
% ?- not_parent(dudley, harry).
% true.

% Is James Harry's father?
% ?- father_of(james, harry).
% true.

% Is Lili Harry's father?
% ?- father_of(lili, harry).
% false.

% Is Helen Lili's mother?
% ?- mother_of(helen, lili).
% true.

% Is Albert Harry's grandfather?
%?- grandfather_of(albert, harry).
%true

% Is Helen Harry's grandmother?
% ?- grandmother_of(helen, harry).
% true













