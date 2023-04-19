:- use_module(library(clpz)).
% :- use_module(library(clpfd)).

append([], L2, L2).
append([H|R], L2, [H|L3]) :-
  append(R,L2,L3).

list1_element_list2([], _, []).
list1_element_list2([E|Ls1], E, Ls2) :-
  list1_element_list2(Ls1, E, Ls2).
list1_element_list2([L|Ls1], E, [L|Ls2]) :-
  L \= E,
  list1_element_list2(Ls1, E, Ls2).

remove(_, [], []).
remove(X, [X|T], R) :-
    remove(X, T, R).
remove(X, [H|T], [H|R]) :-
    X \= H,
    remove(X, T, R).

list_length([], 0).
list_length([_|Ls], L) :-
  L #= L0+1,
  L #> 0,
  list_length(Ls, L0).

merge_list([], Bs, Bs).
merge_list([A|As], Bs, [A|Cs]) :-
  merge_list(As, Bs, Cs).
