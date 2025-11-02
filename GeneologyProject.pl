%Facts (AKA, the large number of relations between our family tree)
%gervin the bold and nivreg's children
child(gervin_the_bold, gervin_the_weird).
child(gervin_the_bold, eden).
child(nivreg, gervin_the_weird).
child(nivreg, eden).

%gervin the weird and rag's children
child(gervin_the_weird, gervin_the_inferno).
child(gervin_the_weird, quasimoto).
child(rag, gervin_the_inferno).
child(rag, quasimoto).

%quasimoto and frog's child
child(quasimoto, thea).
child(frog, thea).

%gervin the inferno and priscilla's children
child(gervin_the_inferno, gervin_the_reborn).
child(gervin_the_inferno, vulkan).
child(gervin_the_inferno, dorn).
child(gervin_the_inferno, lion).
child(priscilla, gervin_the_reborn).
child(priscilla, vulkan).
child(priscilla, dorn).
child(priscilla, lion).

%eden and adam's children
child(eden, geoffry).
child(eden, sheoldred).
child(eden, titus).
child(adam, geoffry).
child(adam, sheoldred).
child(adam, titus).

%geoffry and turbine's children
child(geoffry, dude).
child(geoffry, dudette).
child(geoffry, guy).
child(turbine, dude).
child(turbine, dudette).
child(turbine, guy).

%titus and nurgle's children
child(titus, chairon).
child(titus, gadriel).
child(nurgle, chairon).
child(nurgle, gadriel).

%Ages of the old farts
age(gervin_the_bold, 90).
age(nivreg, 88).
age(gervin_the_weird, 67).
age(eden, 70).
age(rag, 68).
age(quasimoto, 48).
age(gervin_the_inferno, 49).
age(frog, 20).
age(thea, 3).
age(priscilla, 22).
age(gervin_the_reborn, 11).
age(vulkan, 4).
age(dorn, 6).
age(lion, 12).
age(adam, 69).
age(geoffry, 50).
age(sheoldred, 46).
age(titus, 53).
age(turbine, 36).
age(dude, 13).
age(dudette, 14).
age(guy, 15).
age(nurgle, 52).
age(chairon, 32).
age(gadriel, 33).

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
    child(Grandparent, Parent),
    child(Parent, Grandchild).

cousin_of(Cousin1,Cousin2) :-
    child(Grandparent,Parent1),
    child(Grandparent,Parent2),
    child(Parent1,Cousin1),
    child(Parent2,Cousin2),
    Parent1 \= Parent2,
    Cousin1 \= Cousin2.


cousins_list(Person, Unique) :-
    findall(Cousin, cousin_of(Person, Cousin), Cousins),
    sort(Cousins, Unique).

