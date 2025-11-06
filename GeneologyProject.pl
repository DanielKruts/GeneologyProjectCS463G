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


% This will compute given some child and parent? Each parent's children
% are found?
%nthchild(C,P,N):-
    %child(X,Y).
% Base case: direct (first) cousins
nkCousin(Cousin1, Cousin2, 1, _) :-
    cousin_of(Cousin1, Cousin2).


% Recursive case: Nth cousins (N > 1)
nkCousin(Child1, Child2, N, K) :-
    K1 is K + 1,
    N > 1,
    N1 is N - 1,
    child(Child1, Parent1),
    child(Child2, Parent2),
    nkCousin(Parent1, Parent2, N1, K1).

nkList(Person, AllCousins, N, K) :-
    N > 1,
    N1 is N - 1,
    % Find all (N-1)th cousins of Person's parents
    findall(Cousin,
        (
            child(Child, Person),     % go up to the parent
            nkList(Child, ParentCousins, N1, K),
            member(Cousin, ParentCousins)
        ),
        CousinLists
    ),
    % Flatten into a single list
    flatten(CousinLists, AllCousins).

% Base case: N = 1, get the direct parent
nthparent(Child, Parent, 1) :-
    child(Child, Parent).

nthparent(Child, Ancestor, N, [LilAncestor]) :-
    N > 1,
    child(Child, Parent),
    N is N1 + 1,
    nthparent(Parent, Ancestor, N1. [NewLilAncestor]),
    NewLilAncestor = [Ancestor | LilAncestor].


nthLilAncestor(Child, Ancestor, N, [LilAncestor]) :-
    M is N - 1,
    child(Child, Parent),
    nthparent(Parent, Ancestor, M, [LilAncestor]).

nthcousin(Cousin1, Cousin2, N, K) :-
    % find first common ancestor
    nthparent(Cousin1, Ancestor, N),
    nthparent(Cousin2, Ancestor, N),
    nthLilAncestor(Cousin1, LilAncestor1, N, [LilList1]),
    sort(LilList1, SortedLilList1),
    nthLilAncestor(Cousin2, LilAncestor2, N, [LilList2]),
    sort(LilList2, SortedLilList2),
    SortedLilList1 \= SortedLilList2,
    Cousin1 \= Cousin2,
    LilAncestor1 \= LilAncestor2,
    K is 0.
