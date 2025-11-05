%Facts (AKA, the large number of relations between our family tree)
%gervin the bold and nivreg's children
child(gervin_the_weird,gervin_the_bold).
child(eden,gervin_the_bold).
child(gervin_the_weird, nivreg).
child(eden, nivreg).

%gervin the weird and rag's children
child(gervin_the_inferno, gervin_the_weird).
child(quasimoto, gervin_the_weird).
child(gervin_the_inferno, rag).
child(quasimoto, rag).

%quasimoto and frog's child
child(thea,quasimoto).
child(thea,frog).

%gervin the inferno and priscilla's children
child(gervin_the_reborn, gervin_the_inferno).
child(vulkan, gervin_the_inferno).
child(dorn, gervin_the_inferno).
child(lion, gervin_the_inferno).
child(gervin_the_reborn, priscilla).
child(vulkan, priscilla).
child(dorn, priscilla).
child(lion, priscilla).

% eden and adam's children
child(geoffry, eden).
child(sheoldred, eden).
child(titus, eden).
child(geoffry, adam).
child(sheoldred, adam).
child(titus, adam).

% geoffry and turbine's children
child(dude, geoffry).
child(dudette, geoffry).
child(guy, geoffry).
child(dude, turbine).
child(dudette, turbine).
child(guy, turbine).

% titus and nurgle's children
child(chairon, titus).
child(gadriel, titus).
child(chairon, nurgle).
child(gadriel, nurgle).

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

%Finds the grandparents of the grandchild or the opposite way around
grandparent(Grandparent, Grandchild) :-
    child(Parent, Grandparent),
    child(Grandchild, Parent).

%Parent predicate given child facts
parent(Parent, Child):-
    child(Child, Parent).

% Will find if the two people are 1st cousins, but not nth cousins, and
% will find all 1st cousins of a singular person given
cousin_of(Cousin1,Cousin2) :-
    %child(Grandparent,Parent1),
    %child(Grandparent,Parent2),
    %child(Parent1,Cousin1),
    %child(Parent2,Cousin2),
    child(Cousin1, Parent1),
    child(Cousin2, Parent2),
    child(Parent1, Grandparent1),
    child(Parent2, Grandparent2),
    Grandparent1 = Grandparent2,
    Parent1 \= Parent2.

cousins_list(Person, Unique) :-
    findall(Cousin, cousin_of(Person, Cousin), Cousins),
    sort(Cousins, Unique).

%Returns whether two cousins are nth cousins or not
nthcousin(C1,C2,1):-
    cousin_of(C1,C2).
nthcousin(C1,C2,N):-
    N>1,

% This will compute given two cousins, the label of which nth cousin
% they are however many removed
nthcousinkremoved(N,K,X,Y):-
    child(X,Y).

% This will compute given some child and parent? Each parent's children
% are found?
nthchild(C,P,N):-
    child(X,Y).
