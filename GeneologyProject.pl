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

marriage(gervin_the_bold, nivreg).
marriage(nivreg, gervin_the_bold).

marriage(gervin_the_weird, rag).
marriage(rag, gervin_the_weird).

marriage(quasimoto, frog).
marriage(frog, quasimoto).

marriage(gervin_the_inferno, priscilla).
marriage(priscilla, gervin_the_inferno).

marriage(eden, adam).
marriage(adam, eden).
marriage(geoffry, turbine).
marriage(turbine, geoffry).

marriage(titus, nurgle).
marriage(nurgle, titus).

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
%Finds the grandparents of the grandchild or the opposite way around
grandparent(Grandparent, Grandchild) :-
     child(Parent, Grandparent),
     child(Grandchild, Parent).

%Finds all siblings of a single person
sibling(Sibling1, Sibling2) :-
    parent(Parent, Sibling1),
    parent(Parent, Sibling2),
    Sibling1 \= Sibling2.

%Parent predicate given child facts
parent(Parent, Child) :-
    child(Child, Parent).
% child is known, gives a parent and what order child they are
kthchild(Child, Parent, K) :-
    nonvar(Child),
    birth_order(Child, Parent, K).
% This will calculate all kth children of a parent or all parents if no parent given and what order children hey are
kthchild(Child, Parent, K) :-
    var(Child),
    findall(K-TempChild-TempParent,
            birth_order(TempChild, TempParent, K),
            Children),
    sort(Children, OrderedChildren),
    member(K-Child-Parent, OrderedChildren).
% Given you know the child and K, finds the parent(s) if the K value is what kth order child they are to their parents
kthchild(Child, Parent, K) :-
    nonvar(Child),
    nonvar(K),
    birth_order(Child, Parent, K).
% This takes a child and a parent, and finds the birth order of the child among all the parent's children
% Ex: given gervin_the_reborn and gervin_the_inferno, it returns 2, since there is one child older than gervin_the_reborn
birth_order(Child, Parent, Order) :-
    child(Child, Parent),
    findall(OtherChild, (
        child(OtherChild, Parent),
        age(OtherChild, OtherAge),
        age(Child, ChildAge),
        OtherAge > ChildAge), 
        OlderSiblings),
    length(OlderSiblings, K),
    Order is K + 1.

valid_n(N) :- % Having a Valid N and K allows general inputs to be set and to be able to still increment
% without going out of bounds
    between(0, 3, N).
valid_k(K) :- 
    between(0, 3, K).

% Inputs are the Child, the Ancestor, the number of generations N, and the Path taken as a list
% Path is in order from Child to Ancestor, skips Child however
% Base Case: 0 generations means Child = Ancestor, Path is empty
% Another Base Case: 1 generation means Parent is Ancestor, Path is just the [Parent]
nthparent(ChildParent, ChildParent, 0, []).
nthparent(Child, Parent, 1, [Parent]) :-
    child(Child, Parent).
nthparent(Child, Ancestor, N, [Parent|RestPath]) :-
    valid_n(N),
    N > 1,
    child(Child, Parent),
    N1 is N - 1,
    nthparent(Parent, Ancestor, N1, RestPath).

% Finds the second to last element in a list
% Used to find the little common ancestor in the cousin function
second_to_last(LilAncestor, [LilAncestor,_]).
second_to_last(LilAncestor, [_|RestPath]) :-
    second_to_last(LilAncestor, RestPath).

% Finds if two people are Nth cousins,
% Current tree only goes up to 2rd cousins
% Finds two people who share a common ancestor N+1 generations back,
% but not N generations back, which is called LilAncestor (to avoid siblings, first cousins, etc)
% Also ensures that the common ancestor is not married to the other's LilAncestor, to prevent 
% possible duplicates via marriage
nthcousin(Cousin1, Cousin2, N) :-
    valid_n(N),
    Generations is N + 1,
    nthparent(Cousin1, Ancestor1, Generations, Path1),
    nthparent(Cousin2, Ancestor2, Generations, Path2),
    second_to_last(LilAncestor1, Path1),
    second_to_last(LilAncestor2, Path2),
    marriage(Ancestor1, Partner1),
    marriage(Ancestor2, Partner2),
    Ancestor1 \= Partner2,
    Ancestor2 \= Partner1,  
    Cousin1 \= Cousin2,
    LilAncestor1 \= LilAncestor2,
    Ancestor1 = Ancestor2.

% Finds if two people are Nth cousins K times removed
% Runs two cases, one where you go up K generations and find that Ancestor's Nth cousin,
% and the other where you find your Nth cousin, and go down K generations to find their descendant
nthcousinkthremoved(Person1, Person2, N, K) :-
    valid_n(N),
    valid_k(K),
    (
        ( K > 0 ->
            nthparent(Person1, KthAncestor1, K, _)
        ;   KthAncestor1 = Person1
        ),
        nthcousin(KthAncestor1, Person2, N)
    ).

nthcousinkthremoved(Person1, Person2, N, K) :-
    valid_n(N),
    valid_k(K),
    (
        ( K > 0 ->
            nthparent(Person2, KthAncestor2, K, _)
        ;   KthAncestor2 = Person2
        ),
        nthcousin(Person1, KthAncestor2, N)
    ).
