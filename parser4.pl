:- use_module(library(dcg/basics)).
% The main predicate to parse a mathematical expression
parse_expression(Expression, AST) :-
    string_codes(Expression, Codes),
    phrase(expr(AST, 0), Codes, []).

% Grammar rule for expressions
expr(AST, Precedence) -->
    operand(Left),
    operator(Op, OpPrecedence),
    {
        OpPrecedence =< Precedence,
        expr(Right, OpPrecedence),
        AST =.. [Op, Left, Right]
    }.
expr(AST, _) --> operand(AST).

% Grammar rule for operands
operand(int(N)) --> integer(N).
operand(var(V)) --> [V], {is_alpha(V)}.
operand(E) --> ['('], expr(E, 0), [')'].
operand(E) --> diff_op(Op), ['('], expr(Exp, 0), [')'], {E =.. [Op, Exp]}.
operand(E) --> int_op(Op), ['('], expr(Exp, 0), [')'], {E =.. [Op, Exp]}.

% Grammar rule for operators
operator(Op, Precedence) --> add_op(Op), {Precedence is 1}.
operator(Op, Precedence) --> mul_op(Op), {Precedence is 2}.
operator(Op, Precedence) --> pow_op(Op), {Precedence is 3}.

% Lexical rules
integer(N) --> digits(D), {number_codes(N, D)}.
digits([D|T]) --> digit(D), digits(T).
digits([D]) --> digit(D).
digit(D) --> [D], {code_type(D, digit)}.
add_op(add) --> "+".
add_op(sub) --> "-".
mul_op(mul) --> "*".
mul_op(dvd) --> "/".
pow_op(pow) --> "^".
is_alpha(C) :- C >= 0'a, C =< 0'z; C >= 0'A, C =< 0'Z.

diff_op(diff) --> "d".
int_op(integ) --> "∫".
