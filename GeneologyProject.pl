factorial(1, 1).
factorial(X, Y) :-
	x > 1,
	A is X - 1,
	factorial(A, B),
        Y is B * X.