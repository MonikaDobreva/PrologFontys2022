% TASK 2 - Extending the English DCG since my mother tongue (Bulgarian)
% would not be very understandable (I am submitting an interesting file
% together with the assignment about the Bulgarian and DCGs in prolog)

s --> np(subj), vp.
np(_) --> det, adj, n, rel.
np(_) --> negn, adj, n.
np(_) --> pn.
np(CASE) --> pro(CASE).
vp --> vi.
vp --> vt, np(obj).
vp --> vd, vin.
vp --> vd, vtn, np(obj).
vp --> vd, negv, vin.
vp --> vd, negv, vtn, np(obj).
rel --> [].
rel --> pro(relt), vp.

%% ----- Alphabet
det --> [a].
det --> [the].
n --> [bride].
n --> [nurse].
n --> [whiskey].
pn --> [bill].
pro(subj) --> [he].
pro(subj) --> [she].
pro(obj) --> [him].
pro(obj) --> [her].
pro(relt) --> [who].
pro(relt) --> [that].
vi --> [whistles].
vt --> [drinks].
vt --> [kills].
vtn --> [kill].
vtn --> [drink].
vin --> [whistle].
vd --> [does].
negv --> [not].
negn --> [no].
adj --> [].
adj --> [pretty].
adj --> [nice].
adj --> [bad].

% ?- s([a,bride,drinks,a,bride],[]).
% true ;
% false.

% ?- s([a,bride,does,drink,a,bride],[]).
% true ;
% false.

% ?- s([a,bride,does,not,drink,a,bride,who,does,not,kill,bill],[]).
% true ;
% false.

% ?- s([a,bad,bride,does,not,drink,a,bride,who,does,not,kill,bill],[]).
% true ;
% false.

% ?- s([a,bad,bride,does,not,drink,the,pretty,bride,who,does,not,kill,bill],[]).
% true ;
% false.

% ?- s([a,bad,bride,does,not,drink,a,bride,who,does,not,kill,bill],L).
% L = [who, does, not, kill, bill] ;
% L = [] ;

% ?- np(L,Rest,K).
% Rest = [a, bride|K] ;
% Rest = [a, bride, who, whistles|K] ;
% Rest = [a, bride, who, drinks, a, bride|K] ;
% Rest = [a, bride, who, drinks, a, bride, who, whistles|K]

% ?- s(M,L).
% M = [a, bride, whistles|L] ;
% M = [a, bride, drinks, a, bride|L] ;
% M = [a, bride, drinks, a, bride, who, whistles|L] ;
% M = [a, bride, drinks, a, bride, who, drinks, a, bride|...] ;
