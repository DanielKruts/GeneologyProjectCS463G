%Facts (AKA, the large number of relations between our family tree)
%gervin the bold and nivreg's children
parent(gervin_the_bold, gervin_the_weird).
parent(gervin_the_bold, eden).
parent(nivreg, gervin_the_weird).
parent(nivreg, eden).

%gervin the weird and rag's children
parent(gervin_the_weird, gervin_the_inferno).
parent(gervin_the_weird, quasimoto).
parent(rag, gervin_the_inferno).
parent(rag, quasimoto).

%quasimoto and frog's child
parent(quasimoto, thea).
parent(frog, thea).

%gervin the inferno and priscilla's children
parent(gervin_the_inferno, gervin_the_reborn).
parent(gervin_the_inferno, vulkan).
parent(gervin_the_inferno, dorn).
parent(gervin_the_inferno, lion).
parent(priscilla, gervin_the_reborn).
parent(priscilla, vulkan).
parent(priscilla, dorn).
parent(priscilla, lion).

%eden and adam's children
parent(eden, geoffry).
parent(eden, sheoldred).
parent(eden, titus).
parent(adam, geoffry).
parent(adam, sheoldred).
parent(adam, titus).

%geoffry and turbine's children
Parent(geoffry, dude).
parent(geoffry, dudette).
parent(geoffry, guy).
parent(turbine, dude).
parent(turbine, dudette).
parent(turbine, guy).

%titus and nurgle's children
parent(titus, chairon).
parent(titus, gadriel).
parent(nurgle, chairon).
parent(nurgle, gadriel).

%test stuff
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

children_of(Parent, Kid) :-
    parent(Parent, Kid).

grandchildren_of(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

cousin_of(Cousin1,Cousin2) :-
    parent(Grandparent,Parent1),
    parent(Grandparent,Parent2),
    parent(Parent1,Cousin1),
    parent(Parent2,Cousin2).


