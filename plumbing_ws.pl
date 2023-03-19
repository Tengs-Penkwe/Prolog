%%% Prolog program for the simplified plumbing example....
% Copyright Poole and Mackworth 2023. Do not distribute.

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


% Try some subset of:
on_t1.
on_t2.
%on_t3.
unplugged_bath.
%unplugged_sink.

% Add overflowing
wet_floor :- wet_sink, plugged_sink.
wet_floor :- wet_bath, plugged_bath.
%plugged_bath.
plugged_sink.


% hot-water system
% pressurized_hws means the how water system is pressurized
pressurized_hws :- pressurized_p2, on_t4.
% p4 is the pipe coming out of the HWS to the sink spout
pressurized_p4 :- pressurized_hws.
% flow_hot_spout  is true if there is hot water fowing into the sink
flow_hot_spout :- pressurized_p4, on_t6.
% p5 is the pipe coming out of the HWS to the shower
pressurized_p5 :- pressurized_hws.

% t4 is the tap that connects the HWS to p2
%on_t4.
% t5 is the tap from the hot water system to the shower
%on_t5.
% t6 is the hot tap at the sink
on_t6.

% Try:
%?- flow_d1.
%?- wet_floor.
% and then try to change the scenario so that wet_floor is true.

