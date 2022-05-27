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
