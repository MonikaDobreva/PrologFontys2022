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




