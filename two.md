Prolog program for the simplified plumbing example....


# One
```Prolog
:- dynamic on_t1/0, on_t2/0, on_t3/0, on_t4/0, on_t5/0, on_t6/0,
	   plugged_sink/0, plugged_bath/0, unplugged_sink/0, unplugged_bath/0.

pressurized_p1.
pressurized_p2 :- on_t1, pressurized_p1.
flow_shower :- on_t2, pressurized_p2.
flow_shower :- on_t5, pressurized_p5.

wet_bath :- flow_shower.

% Drains
flow_d2 :- wet_bath, unplugged_bath.
flow_d1 :- flow_d2.
flow_d1 :- flow_d3.

pressurized_p3 :- pressurized_p2.
flow_cold_spout :- on_t3, pressurized_p3.

wet_sink :- flow_cold_spout.
wet_sink :- flow_hot_spout.

flow_d3 :- wet_sink, unplugged_sink.
```

## Example 1
on(t1).
on(t2).
unplugged(bath).
```
[trace]  ?- flow(d1).
   Call: (10) flow(d1) ? creep
   Call: (11) flow(d2) ? creep
   Call: (12) wet(bath) ? creep
   Call: (13) flow(shower) ? creep
   Call: (14) on(t2) ? creep
   Exit: (14) on(t2) ? creep
   Call: (14) pressurized(p2) ? creep
   Call: (15) on(t1) ? creep
   Exit: (15) on(t1) ? creep
   Call: (15) pressurized(p1) ? creep
   Exit: (15) pressurized(p1) ? creep
   Exit: (14) pressurized(p2) ? creep
   Exit: (13) flow(shower) ? creep
   Exit: (12) wet(bath) ? creep
   Call: (12) unplugged(bath) ? creep
   Exit: (12) unplugged(bath) ? creep
   Exit: (11) flow(d2) ? creep
   Exit: (10) flow(d1) ? creep
true .
```

## Example 2
on(t1).
on(t4).
on(t6).
plugged(bath).
unplugged(sink).
```
[trace]  ?- flow(d1).
   Call: (10) flow(d1) ? creep
   Call: (11) flow(d2) ? creep
   Call: (12) wet(bath) ? creep
   Call: (13) flow(shower) ? creep
   Call: (14) on(t2) ? creep
   Fail: (14) on(t2) ? creep
   Redo: (13) flow(shower) ? creep
   Call: (14) on(t5) ? creep
   Fail: (14) on(t5) ? creep
   Fail: (13) flow(shower) ? creep
   Fail: (12) wet(bath) ? creep
   Fail: (11) flow(d2) ? creep
   Redo: (10) flow(d1) ? creep
   Call: (11) flow(d3) ? creep
   Call: (12) wet(sink) ? creep
   Call: (13) flow(cold_spout) ? creep
   Call: (14) on(t3) ? creep
   Fail: (14) on(t3) ? creep
   Fail: (13) flow(cold_spout) ? creep
   Redo: (12) wet(sink) ? creep
   Call: (13) flow(hot_spout) ? creep
   Call: (14) on(t6) ? creep
   Exit: (14) on(t6) ? creep
   Call: (14) pressurized(p4) ? creep
   Call: (15) pressurized(hws) ? creep
   Call: (16) on(t4) ? creep
   Exit: (16) on(t4) ? creep
   Call: (16) pressurized(p2) ? creep
   Call: (17) on(t1) ? creep
   Exit: (17) on(t1) ? creep
   Call: (17) pressurized(p1) ? creep
   Exit: (17) pressurized(p1) ? creep
   Exit: (16) pressurized(p2) ? creep
   Exit: (15) pressurized(hws) ? creep
   Exit: (14) pressurized(p4) ? creep
   Exit: (13) flow(hot_spout) ? creep
   Exit: (12) wet(sink) ? creep
   Call: (12) unplugged(sink) ? creep
   Exit: (12) unplugged(sink) ? creep
   Exit: (11) flow(d3) ? creep
   Exit: (10) flow(d1) ? creep
true.
```

# Two
```Prolog
before(am(_, _), pm(_, _)).
before(am(H1, M1),  am(H2, M2))  :- H1 < H2.
before(am(H, M1),   am(H, M2))   :- M1 < M2.
before(pm(H1, M1),  pm(H2, M2))  :- H1 < H2.
before(pm(H, M1),   pm(H, M2))   :- M1 < M2.
```

# Three

## (a) 
```Prolog
lookup(X, Env, V) :-
  member(val(X, V), Env).
```
This rule simply looks for a val(X, V) element in the environment Env.

## (b)
```Prolog
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
```

# Four
1. 10 minutes, 
2. 10 minutes, 
3. 15 minutes, pattern matching in Prolog
