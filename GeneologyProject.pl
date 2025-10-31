factorial(1,1).
factorial(X,Y):-
	X>1,
	A is X-1,
	factorial(A,B),
	Y is B*X.

contains([H|_],H).
contains([_|T],Y):-
	contains(T,Y).

containsall(_,[]).
containsall([H|T],[H|T]):-
	contains(X,H),
	\+ contains(T,H),
	containsall(X,T)

perm(X,Y):-
	length(X,Z),
	length(Y,Z),
	containsall(X,Y),
        containsall(Y,X).
%bitches be tripping
