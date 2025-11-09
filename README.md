# GeneologyProjectCS463G
Prolog implementation of the GeneologyProjectTree.jpeg in the repository to represent familial relations and correctly assess them given the facts of child and age for each person in the database

# How to run
1. Compile the buffer using SWI-Prolog or, while in the swipl program in your powershell, use the query, consult('filename.pl').
    EX:) consult('GeneologyProject.pl').
2. Use queries to see the familial relations between everyone in the fact database. Here is a list of the queries you can use and their descriptions
    1. child(C,P). Returns all parents P of a given child C
    2. parent(P,C). Returns all children C of a given parent P
    3. grandparent(GP,GC). Returns the grandparents GP of a given grandchild GC
    4. age(P,A). Returns the age A of a given person P
    5. sibling(Sibling1,Sibling2). Returns the siblings of any given Sibling1 or Sibling2
    6. kthchild(C,P,K). Returns all kth children C of a given parent P in birth order
    7. nthcousin(Cousin1,Cousin2,N). Returns all nth cousins given a cousin, or prints all nth cousins from the fact database
    8. nthcousinkthremoved(Person1,Person2,N,K). Returns all nth cousins k removed given a person, or prints all nth cousins k removed from the fact database