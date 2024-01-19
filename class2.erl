- module(class2).

- export(
[sum/1, prod/1, max/1, fold_v2/3, max2/1, longest_run/2, accum_max/2, neighbors/1, fib/1, fib2/1
    ]).

sum([]) -> 0;
sum([Hd|Tl]) -> Hd + sum(Tl).

prod([]) -> 1;
prod([Hd|Tl]) -> Hd * prod(Tl).

max([Hd]) -> Hd;
max([Hd|Tl]) -> max(Hd, max(Tl)).

fold_v2(_Op, Acc0, []) -> Acc0;
fold_v2(Op, Acc0, [Hd|Tl]) -> 
    Op(Hd, fold_v2(Op, Acc0, Tl)).

max2(List) -> fold_v2(fun(X, Y) -> max(X, Y) end, 0, List).

accum_max(Ele, {Ele_to_match, MaxSoFar, MaxOverall}) -> 
    case Ele of 
        Ele_to_match -> 
            {Ele_to_match, MaxSoFar + 1, MaxOverall}; % It matches, max loop + 1
        _ -> 
            case MaxSoFar > MaxOverall of
                true -> {Ele_to_match, 0, MaxSoFar};
                false -> {Ele_to_match, 0, MaxOverall}
            end
    end.

longest_run(Ele, List) -> fold_v2(fun class2:accum_max/2, {Ele, 0, 0}, List).

neighbors([]) -> [];
neighbors([_]) -> [];
neighbors([E1, E2 | Tl]) -> [{E1, E2} | neighbors([E2 | Tl])].

% Naive Fibonacci
fib(0) -> 1;
fib(1) -> 1;
fib(N) when is_integer(N), N >= 2 ->
    fib(N-1) + fib(N-2).

% Tail recursive Fibonacci
fib2(0) -> {1, 0};
fib2(1) -> {1, 1};
fib2(N) -> {FibN, FibN_1} = fib2(N-1),
    {FibN + FibN_1, FibN}.


