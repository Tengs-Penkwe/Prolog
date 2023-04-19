:- use_module(library(dcg/basics)).
% The main predicate to parse a mathematical expression
parse_expression(Expression, AST) :-
    string_codes(Expression, Codes),
    phrase(expression(0, AST), Codes).

% Grammar rules for expressions
expression(P, E) --> base(B), expression_tail(P, B, E).
expression_tail(P, Ein, Eout) --> operator(Op, P), expression(P, T), {Etmp =.. [Op, Ein, T]}, expression_tail(P, Etmp, Eout).
expression_tail(_, E, E) --> [].

base(int(N)) --> integer(N).
base(var(V)) --> [V], {is_alpha(V)}.

base(E) --> ['('], expression(0, E), [')'].
base(E) --> diff_op(Op), ['('], expression(0, Exp), [')'], {E =.. [Op, Exp]}.
base(E) --> int_op(Op), ['('], expression(0, Exp), [')'], {E =.. [Op, Exp]}.

diff_op(diff) --> "d".
int_op(integ) --> "∫".

operator(add, 0) --> "+".
operator(sub, 0) --> "-".
operator(mul, 1) --> "*".
operator(dvd, 1) --> "/".
operator(pow, 2) --> "^".

is_alpha(C) :-
    C >= 0'a, C =< 0'z;
    C >= 0'A, C =< 0'Z.

