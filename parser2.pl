% :- use_module(library(dcg/basics)).

parse_expression(Expression, AST) :-
    ato(Expression, Codes),
    phrase(expr(AST), Codes).

parse_string(String, Result) :-
    atom_codes(String, Codes),
    tokenize(Codes, Tokens),
    phrase(expr(Result), Tokens).

tokenize([], []).
tokenize([Code | RestCodes], [Token | RestTokens]) :-
    ( char_type(Code, digit) ->
        number_codes(Token, [Code])
    ; char_type(Code, alpha) ->
        Token = Code
    ; atom_codes(Token, [Code])
    ),
    tokenize(RestCodes, RestTokens).

expr(       T        ) --> term(T).
expr(       add(X,Y) ) --> term(X), [+], expr(Y).
expr(       sub(X,Y) ) --> term(X), [-], expr(Y).

term(       T        ) --> factor(T).
term(       mul(X,Y) ) --> factor(X), [*], term(Y).
term(       dvd(X,Y) ) --> factor(X), [/], term(Y).

factor(     F        ) --> base(F).
factor(     pow(X,Y) ) --> base(X), [^], factor(Y).

base(       ID       ) --> identifier(ID).
base(       num(N)   ) --> is_number(N).
% base(    variable(X) ) --> is_variable(X).
base(     diff(E, X)) --> "D", identifier(X), ['('], expr(E), [')'].
base(    integ(E, X) ) --> [∫], ['('], expr(E), [')'], identifier(X).

base(       T        ) --> ['('], expr(T), [')'].

identifier( ID       ) --> [X], { id(X), ID = X }.

is_number(  N        ) --> [N], { number(N)}.
% is_integer( N        ) --> [X], { number(N), integer(N) }.
is_variable( V       ) --> [X], { var(X), V = X }.


is_alpha(C) :-
  C >= 0'a, C =< 0'z;
  C >= 0'A, C =< 0'Z.

% id(X) :-
%   C >= 0'a, C =< 0'z.

 


id(a).
id(b).
id(c).
id(d).
id(e).
id(f).
id(g).
id(h).
id(i).
id(j).
id(k).
id(l).
id(m).
id(n).
id(o).
id(p).
id(q).
id(r).
id(s).
id(t).
id(u).
id(v).
id(w).
id(x).
id(y).
id(z).

% Base case: numbers and single variables are already simplified.
simplify(num(N), num(N)).

% Simplify addition, subtraction, multiplication, and division
simplify(add(E1, E2), R) :- simplify_operation(E1, E2, +, R).
simplify(sub(E1, E2), R) :- simplify_operation(E1, E2, -, R).
simplify(mul(E1, E2), R) :- simplify_operation(E1, E2, *, R).
simplify(dvd(E1, E2), R) :- simplify_operation(E1, E2, /, R).

% simplify(der(E1, X), R) :-

% Simplify arithmetic operations
simplify_operation(E1, E2, Op, R) :-
    simplify(E1, S1),
    simplify(E2, S2),
    (S1 = num(N1), S2 = num(N2) ->
       (  Op = + -> N3 is N1 + N2
        ; Op = - -> N3 is N1 - N2
        ; Op = * -> N3 is N1 * N2
        ; Op = / -> N3 is N1 / N2
        ),
        R = num(N3)
    ;
        R =.. [Op, S1, S2]
    ).

operation_expr(+, S1, S2, add(S1, S2)).
operation_expr(-, S1, S2, sub(S1, S2)).
operation_expr(*, S1, S2, mul(S1, S2)).
operation_expr(/, S1, S2, dvd(S1, S2)).
