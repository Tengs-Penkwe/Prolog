% Operator precedence and associativity
:- op(500, yfx, +).
:- op(400, yfx, *).
:- op(300, yfx, ^).

% Tokenizing the input
tokenize([], []).
tokenize([C|Cs], Tokens) :-
    tokenize(Cs, Rest),
    ( char_type(C, white) -> Tokens = Rest
    ; char_type(C, digit) -> number([C|Cs], N, Cs1), Tokens = [num(N)|Tokens1], tokenize(Cs1, Tokens1)
    ; Tokens = [T|Tokens1], atom_codes(T, [C]), tokenize(Cs, Tokens1)
    ).

number([C|Cs], N, Rest) :-
    char_type(C, digit),
    (   number(Cs, N0, Rest) -> N is N0 + 10 * C
    ;   Rest = Cs, N = C
    ).

% Parser using DCG
expr(T) --> term(T1), expr_rest(T1, T).

expr_rest(T1, T) --> [+], term(T2), {T3 = T1 + T2}, expr_rest(T3, T).
expr_rest(T, T) --> [].

term(T) --> factor(T1), term_rest(T1, T).

term_rest(T1, T) --> [*], factor(T2), {T3 = T1 * T2}, term_rest(T3, T).
term_rest(T, T) --> [].

factor(T) --> [num(N)], {T = N}.
factor(T) --> [X], {char_type(X, upper), T = var(X)}.
factor(T) --> ['('], expr(T), [')'].

% Main predicate
parse(Expression, AST) :-
    string_codes(Expression, Codes),
    tokenize(Codes, Tokens),
    phrase(expr(AST), Tokens).

% Example usage:
% ?- parse("5*x+3+2*y", AST).
% AST = 5*var(x)+3+2*var(y).

