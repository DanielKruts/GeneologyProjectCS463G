fib(1,1).
fib(2,1).
fib(N,F) :-
    N > 2,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1,F1),
    fib(N2,F2),
    F is F1 + F2.

myfib(_,Y,1,Y).
myfib(X,Y,N,Z) :-
    N > 1,
    T is X + Y,
    N1 is N - 1,
    myfib(Y,T,N1,Z).

basefamilytree(rag, gervin_the_bold).
basefamilytree(freya, gervin_the_bold).
basefamilytree(gervin_the_bold, ulric_the_old).
children_of(Parent, Kid) :-
    basefamilytree(Kid, Parent).


