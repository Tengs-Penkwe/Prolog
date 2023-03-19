%%% Prolog program for the revised plumbing example....

:- dynamic on/1, plugged/1, unplugged/1, flow/1.

%% pressurized
pressurized(p1).
pressurized(p2) :- on(t1), pressurized(p1).
pressurized(p3) :- on(t1), pressurized(p1).
pressurized(hws):- on(t4), pressurized(p2).
pressurized(p4) :- pressurized(hws).
pressurized(p5) :- pressurized(hws).

%% wet
wet(bath) :- flow(shower).
wet(sink) :- flow(cold_spout); flow(hot_spout).
wet(floor):- wet(bath), plugged(bath); wet(sink), plugged(sink).

%% flow
flow(d1) :- flow(d2); flow(d3).
flow(d2) :- wet(bath), unplugged(bath).
flow(d3) :- wet(sink), unplugged(sink).
flow(shower) :- on(t2), pressurized(p2); on(t5), pressurized(p5).
flow(cold_spout)  :- on(t3), pressurized(p3).
flow(hot_spout)   :- on(t6), pressurized(p4).

