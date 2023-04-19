:- use_module(library(tokenize)).

parse_expression(Expression, AST) :-
    string_chars(Expression, Codes),
    phrase(parser(AST), Codes).

parser([]) --> [].
parser(Tree) --> expr(Tree).

assign([assignment, ident(X), '=', Exp]) --> id(X), [=], expr(Exp), [;].

id(X) --> [X], { atom(X) }.

expr([expression, Term]) --> term(Term).
expr([expression, Term, Op, Exp]) --> term(Term), add_sub(Op), expr(Exp).

term([term, F]) --> factor(F).
term([term, F, Op, Term]) --> factor(F), mul_div(Op), term(Term).

factor([factor, int(N)]) --> num(N).
factor([factor, Exp]) --> ['('], expr(Exp), [')'].

add_sub(Op) --> [Op], { memberchk(Op, ['+', '-']) }.
mul_div(Op) --> [Op], { memberchk(Op, ['*', '/']) }.

num(N) --> [N], { number(N) }.

% Base case: numbers and single variables are already simplified.
simplify(num(N), num(N)).

% Simplify addition
simplify(add(E1, E2), R) :-
    simplify(E1, S1),
    simplify(E2, S2),
    (S1 = num(N1), S2 = num(N2) ->
        R = num(N3),
        N3 is N1 + N2
    ;
        R = add(S1, S2)
    ).

% Simplify subtraction
simplify(sub(E1, E2), R) :-
    simplify(E1, S1),
    simplify(E2, S2),
    (S1 = num(N1), S2 = num(N2) ->
        R = num(N3),
        N3 is N1 - N2
    ;
        R = sub(S1, S2)
    ).

% Simplify multiplication
simplify(mul(E1, E2), R) :-
    simplify(E1, S1),
    simplify(E2, S2),
    (S1 = num(N1), S2 = num(N2) ->
        R = num(N3),
        N3 is N1 * N2
    ;
        R = mul(S1, S2)
    ).

% Simplify division
simplify(dvd(E1, E2), R) :-
    simplify(E1, S1),
    simplify(E2, S2),
    (S1 = num(N1), S2 = num(N2) ->
        R = num(N3),
        N3 is N1 / N2
    ;
        R = dvd(S1, S2)
    ).

