%%% Prolog program for the simplified plumbing example....

% Copyright David L Poole 2023.
% This work is licensed under a Creative Commons
% Attribution-NonCommercial-ShareAlike 4.0 International License.
% See: http://creativecommons.org/licenses/by-nc-sa/4.0/deed.en_US.

% The dynamic declaration prevents undefined predicate errors.
:- dynamic on_t1/0, on_t2/0,  off_t1/0, off_t2/0,  plugged_bath/0,
	   unplugged_bath/0.

% See assignment description for the intended interpretation of the symbols
pressurized_p1.
pressurized_p2 :- on_t1, pressurized_p1.
flow_shower :- on_t2, pressurized_p2.
wet_bath :- flow_shower.
flow_d2 :- wet_bath, unplugged_bath.
flow_d1 :- flow_d2.

% You can change the status of taps and plugs by adding or removing (commenting out) statements:
on_t1.
on_t2.
unplugged_bath.


% (a)
:- dynamic on_t3/0, off_t3/0.
pressurized_p3 :- on_t1, pressurized_p1.
wet_sink :- on_t3, pressurized_p3.
%% this simulats if the sink is wet or not

% (b)
:- dynamic plugged_sink/0, unplugged_sink/0.
%% This simulats if the sink is plugged or not
wet_floor :- (wet_sink, unplugged_sink;); (wet_bath, unplugged_bath).

% (c)


