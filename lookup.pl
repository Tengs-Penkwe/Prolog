lookup(X, Env, V) :-
  member(val(X, V), Env).

% Exp is a number, then `value` is just Exp
eval(Exp, _, Exp) :- number(Exp). 

% Exp is an algebraic variable
eval(Exp, Env, V) :- atom(Exp), lookup(Exp, Env, V).

% Exp is an expression
eval((E1 + E2), Env, V) :- 
  eval(E1, Env, V1),
  eval(E2, Env, V2),
  V is V1 + V2.

eval((E1 * E2), Env, V) :- 
  eval(E1, Env, V1),
  eval(E2, Env, V2),
  V is V1 * V2.
