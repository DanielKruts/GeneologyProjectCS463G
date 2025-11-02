%Facts (AKA, the large number of relations between our family tree
%Gervin the Bold and Nivreg's children
parent(Gervin_the_Bold, Gervin_the_Weird).
parent(Gervin_the_Bold, Eden).
parent(Nivreg, Gervin_the_Weird).
parent(Nivreg, Eden).

%Gervin the Weird and Rag's Children
parent(Gervin_the_Weird, Gervin_the_Inferno).
parent(Gervin_the_Weird, Quasimoto).
parent(Rag, Gervin_the_Inferno).
parent(Rag, Quasimoto).

%Quasimoto and Frog's child
parent(Quasimoto, Thea).
parent(Frog, Thea).

%Gervin the Inferno and Priscilla's children
parent(Gervin_the_Inferno, Gervin_the_Reborn).
parent(Gervin_the_Inferno, Vulkan).
parent(Gervin_the_Inferno, Dorn).
parent(Gervin_the_Inferno, Lion).
parent(Priscilla, Gervin_the_Reborn).
parent(Priscilla, Vulkan).
parent(Priscilla, Dorn).
parent(Priscilla, Lion).

%Eden and Adam's children
parent(Eden, Geoffry).
parent(Eden, Sheoldred).
parent(Eden, Titus).


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

