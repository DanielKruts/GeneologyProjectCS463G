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

marrige(gervin_the_bold, nivreg).
marrige(nivreg, gervin_the_bold).

marrige(gervin_the_weird, rag).
marrige(rag, gervin_the_weird).

marrige(quasimoto, frog).
marrige(frog, quasimoto).

marrige(gervin_the_inferno, priscilla).
marrige(priscilla, gervin_the_inferno).

marrige(eden, adam).
marrige(adam, eden).
marrige(geoffry, turbine).
marrige(turbine, geoffry).

marrige(titus, nurgle).
marrige(nurgle, titus).

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

% %test stuff
% fib(1,1).
% fib(2,1).
% fib(N,F) :-
%     N > 2,
%     N1 is N - 1,
%     N2 is N - 2,
%     fib(N1,F1),
%     fib(N2,F2),
%     F is F1 + F2.

% myfib(_,Y,1,Y).
% myfib(X,Y,N,Z) :-
%     N > 1,
%     T is X + Y,
%     N1 is N - 1,
%     myfib(Y,T,N1,Z).

% %Finds the grandparents of the grandchild or the opposite way around
% grandparent(Grandparent, Grandchild) :-
%     child(Parent, Grandparent),
%     child(Grandchild, Parent).

% %Parent predicate given child facts


% % Will find if the two people are 1st cousins, but not nth cousins, and
% % will find all 1st cousins of a singular person given
% cousin_of(Cousin1,Cousin2) :-
%     child(Cousin1, Parent1),
%     child(Cousin2, Parent2),
%     child(Parent1, Grandparent),
%     child(Parent2, Grandparent),
%     Parent1 \= Parent2,
%     Cousin1 \= Cousin2.

% cousins_list(Person, Unique) :-
%     findall(Cousin, cousin_of(Person, Cousin), Cousins),
%     sort(Cousins, Unique).

% % base case
% ancestor(Ancestor, Descendant, 1):-
%     parent(Ancestor, Descendant).
% % find the ancestor or descendant of any given person
% ancestor(A, D, N):-
%     parent(A, X),
%     ancestor(X, D, M),
%     N is M + 1.

% %Finds all common ancestors given two people C1 and C2 and which generation for each
% commonAncestor(A,C1,C2,G1,G2):-
%     ancestor(A,C1,G1),
%     ancestor(A,C2,G2),
%     A \= C1,
%     A \= C2.

% %Returns whether two cousins are nth cousins or not
% nthcousin(C1,C2,1):-
%     cousin_of(C1,C2).
% nthcousin(C1,C2,N):-
%     child(C1,C2),
%     N is N + 1.

% nthcousinkremoved(N,K,X,Y):-
%     N = K,
%     cousin_of(X,Y).
% % This will compute given two cousins, the label of which nth cousin
% % they are however many removed
% nthcousinkremoved(N,K,X,Y):-
%     commonAncestor(A,X,Y,G1,G2),
%     number(G1), number(G2),
%     (   G1 >= G2
%     ->  K is G1 - G2,
%         N is G2
%     ;   K is G2 - G1,
%         N is G1
%     ).
% Base case: 0th parent, empty path
kthchild(Person, Person, _).
kthchild(Child, NthParent, K) :-
    child(LilParent, NthParent),
    kthchild(Grandchild, LilParent, K),
    write('Child is:'), write(LilParent), nl.

% -----------------------------------------------------------------------------
% kthchild_list(Ancestor, K, ChildList)
% Collects *all* Kth descendants of Ancestor into a list.

kthchild_list(Ancestor, K, ChildList) :-
    setof(Child, kthchild(Child, Ancestor, K), ChildList).

valid_n(N) :- 
    between(0, 3, N).

nthparent(ChildParent, ChildParent, 0, []).

nthparent(Child, Parent, 1, [Parent]) :-
    child(Child, Parent).

nthparent(Child, Ancestor, N, [Parent|RestPath]) :-
    valid_n(N),
    N > 1,
    child(Child, Parent),
    N1 is N - 1,
    nthparent(Parent, Ancestor, N1, RestPath).

second_to_last(LilAncestor, [LilAncestor,_]).
second_to_last(LilAncestor, [_|RestPath]) :-
    second_to_last(LilAncestor, RestPath).

% Helper predicate to print paths for debugging
nthcousin(Cousin1, Cousin2, N, K) :-
    % Option 1, Cousins 
    nthparent(Cousin1, Ancestor1, N, Path1),
    nthparent(Cousin2, Ancestor2, N, Path2),
    second_to_last(LilAncestor1, Path1),
    second_to_last(LilAncestor2, Path2),
    marrige(Ancestor1, Partner1),
    marrige(Ancestor2, Partner2),
    Ancestor1 \= Partner2,
    Ancestor2 \= Partner1,  
    Cousin1 \= Cousin2,
    LilAncestor1 \= LilAncestor2,
    Ancestor1 = Ancestor2,
    write('Cousin1 path: '), write(Path1), nl,
    write('Cousin2 path: '), write(Path2), nl.

