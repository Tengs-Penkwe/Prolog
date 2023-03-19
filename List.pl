
append([], L2, L2).
append([H|R], L2, [H|L3]) :-
  append(R,L2,L3).
