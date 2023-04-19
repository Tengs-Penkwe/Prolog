:- module(tokenizer, [tokenize/2]).

%:- use_module(library(dcg/basics)).

% Entry point for the tokenizer
tokenize(Expression, Tokens) :-
    string_chars(Expression, Codes),
    phrase(tokens(Tokens), Codes).

% Rules for tokenizing the input string
tokens([]) --> [].
tokens([T|Ts]) -->
    white,
    ( number_token(T)
    ; operator_token(T)
    ; identifier_token(T)
    ; bracket_token(T)
    ),
    white,
    tokens(Ts).

% Numbers
number_token(num(N)) -->
	[N], { number(N)}.

% Operators
operator_token(Op) --> 
    [C],  {operator_char(C), operator_token(C, Op)}.

operator_char('+').
operator_char('-').
operator_char('*').
operator_char('/').
operator_char('^').

operator_token('+', add).
operator_token('-', sub).
operator_token('*', mul).
operator_token('/', dvd).
operator_token('^', pow).

% Identifiers (variables and functions)
identifier_token(vrb(V)) --> var_name(V).
%identifier_token(fn(F)) --> func_name(F).

var_name(V) -->
    [C], {is_alpha(C)},
    var_name_chars(Cs),
    {atom_codes(V, [C|Cs])}.

var_name_chars([C|Cs]) --> [C], {char_type(C, lower)}, var_name_chars(Cs).
var_name_chars([]) --> [].

func_name(F) --> [C], {is_alpha(C)}, func_name_chars(Cs), {atom_codes(F, [C|Cs])}.

func_name_chars([C|Cs]) --> [C], {is_alnum(C)}, func_name_chars(Cs).
func_name_chars([]) --> [].

is_alpha(C) :-
    char_type(C, lower).
    %(C >= 'a', C =< 'z') ; (C >= 'A', C =< 'Z').

is_alnum(C) :-
    char_type(C, digit); char_type(C, lower).
    %is_alpha(C) ; (C >= '0', C =< '9').

% Brackets
bracket_token(lbracket) --> ['('].
bracket_token(rbracket) --> [')'].

% Whitespace
white --> white_char, white.
white --> [].

white_char --> [C], {code_type(C, space)}.
