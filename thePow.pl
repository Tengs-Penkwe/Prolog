:- use_module(library(clpz)).
:- use_module(library(reif)).

list_length([], 0).
list_length([_|Ls], N) :- 
  N #> 0,
  N #= N0 + 1,
  list_length(Ls, N0).

list_maxium([L|Ls], M) :-
  list_maxium_(Ls, L, M).

list_maxium_([], M, M).
list_maxium_([L|Ls], M0, M) :- 
  M1 #= max(L, M0),
  list_maxium_(Ls, M1, M).

hailstone(N, N).
hailstone(N0, N) :-
  R #= N0 mod 2,
  if_(R = 0,
      N0 #= 2*N1,
      N1 #= 3*N0 + 1),
  hailstone(N1, N)

