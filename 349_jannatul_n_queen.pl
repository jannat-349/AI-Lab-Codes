:- use_module(library(clpfd)).


n_queens(N, Qs) :-
        length(Qs, N),
        Qs ins 1..N,
        safe_queens(Qs).

safe_queens([]).
safe_queens([Q|Qs]) :-
        safe_queens(Qs, Q, 1),
        safe_queens(Qs).

safe_queens([], _, _).
safe_queens([Q|Qs], Q0, D0) :-
        Q0 #\= Q,
        abs(Q0 - Q) #\= D0,
        D1 #= D0 + 1,
        safe_queens(Qs, Q0, D1).

% Example 1: N = 0 (empty board)
% ?- N = 0, n_queens(N, Qs), labeling([ff], Qs).
% N = 0,
% Qs = [].

% Example 2: N = 1 (trivial case with one queen)
% ?- N = 1, n_queens(N, Qs), labeling([ff], Qs).
% N = 1,
% Qs = [1].

% Example 3: N = 2 (no solution as two queens can't coexist)
% ?- N = 2, n_queens(N, Qs), labeling([ff], Qs).
% false.

% Example 4: N = 3 (no solution, as it's not possible to place 3 queens safely)
% ?- N = 3, n_queens(N, Qs), labeling([ff], Qs).
% false.

% Example 5: N = 4 (two possible solutions)
% ?- N = 4, n_queens(N, Qs), labeling([ff], Qs).
% N = 4,
% Qs = [2, 4, 1, 3] ;
% N = 4,
% Qs = [3, 1, 4, 2] ;
% false.
