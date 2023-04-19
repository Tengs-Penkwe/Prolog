% Utility predicate to parse a given string into an AST
parse_math_expr(Input, AST) :-
    string_codes(Input, Codes),
    phrase(expr(AST), Codes).

% Example usage:
% ?- parse_math_expr("(1+2)*(3-4)/5", AST).
% AST = div(mul(add(num(1), num(2)), sub(num(3), num(4))), num(5)).

% Define operators precedence
:- op(700, xfx, '^').
:- op(500, yfx, '*').
:- op(500, yfx, '/').
:- op(400, yfx, '+').
:- op(400, yfx, '-').

% % Define the parser
expr(Tree) --> term(Left), addop(Op), expr(Right), {Tree =.. [Op, Left, Right]}.
expr(Tree) --> term(Tree).
term(Tree) --> factor(Left), mulop(Op), term(Right), {Tree =.. [Op, Left, Right]}.
expr(T) --> term(X), "+", expr(Y), { T = +(X,Y) }.
expr(T) --> term(X), "-", expr(Y), { T = -(X,Y) }.

term(T) --> factor(T).
term(T) --> factor(X), "*", term(Y), { T = *(X,Y) }.
term(T) --> factor(X), "/", term(Y), { T = /(X,Y) }.

factor(T) --> number(T).
factor(T) --> "(", expr(T), ")".

number(T) --> integer(T).
number(T) --> float(T).

