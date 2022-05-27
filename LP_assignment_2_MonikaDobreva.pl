% TASK 1 - List Exercises
% a.

list_lenght([], 0).
list_lenght([Head|Tail], Lenght) :-  list_lenght(Tail, Count), Lenght is Count+1.

% ?- list_lenght([a,b,c],X).
% X = 3.

% ?- list_lenght([],X).
% X = 0.

% ?- list_lenght([a,b,c,a,a,a,a],X).
% X = 7.

% ?- list_lenght([a,b,c,[a,a,a,a]],X).
% X = 4.

% b.
% still showing empty lists, should append somehow?
% not sure how to properly fix it..

replace([], []) :- true, !.
replace([u|InTail], [i, OutTail]) :- replace(InTail, OutTail).
replace([i|InTail], [o, OutTail]) :- replace(InTail, OutTail).
replace([o|InTail], [u, OutTail]) :- replace(InTail, OutTail).
replace([X|InTail], [X|OutTail]) :- X \= u, X \= i, X \= o, replace(InTail, OutTail).

% TASK 2 - Encryption Functionality
% a.

xor_check(0,0,0).
xor_check(0,1,1).
xor_check(1,0,1).
xor_check(1,1,0).

xor([], [], []).
xor([P|Plaintext], [K|Key], [C|Cipher]) :- xor_check(P, K, C), xor(Plaintext, Key, Cipher).

% ?- xor([1,1],[0,1],Z),xor(Z,[0,1],Y).
% Z = [1, 0],
% Y = [1, 1] ;
% false.


% ?- xor(Z,[0,1],Y).
% Z = [0, 0],
% Y = [0, 1] ;
% Z = [0, 1],
% Y = [0, 0] ;
% Z = [1, 0],
% Y = [1, 1] ;
% Z = [1, 1],
% Y = [1, 0].

% ?- xor([0,0,0],[0,1,0],Z).
% Z = [0, 1, 0] ;
% false.

% ?- xor([1,1],[0,1],Z).
% Z = [1, 0].

% b.
% still need to see how to implement correctly..

substitute(a,b).
substitute(b,c).
substitute(c,d).
substitute(d,e).
substitute(e,f).
substitute(f,g).
substitute(g,h).
substitute(h,i).
substitute(i,j).
substitute(j,k).
substitute(k,l).
substitute(l,m).
substitute(m,n).
substitute(n,o).
substitute(o,p).
substitute(p,q).
substitute(q,r).
substitute(r,s).
substitute(s,t).
substitute(t,u).
substitute(u,v).
substitute(v,w).
substitute(w,x).
substitute(x,y).
substitute(y,z).
substitute(z,a).

encode([TextHead|TextTail],[CipherHead|CipherTail]) :- substitute(TextHead, CipherHead), encode(TextTail, CipherTail).
decode([CipherHead|CipherTail],[TextHead|TextTail]) :- substitute(TextHead, CipherHead), decode(CipherTail, TextTail).













