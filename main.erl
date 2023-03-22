-module(main).
-import(io,[fwrite/2,fwrite/1]).
-export([start/0]).

sum_neg_squares(List) ->
  %% reduce
    lists:foldl(fun(X, Acc) ->
                    if
                        X < 0 ->
                            Acc + X*X;
                        true ->
                            Acc
                    end
                end, 0, List).

dropwhile(Pred, List) ->
    case List of
        [H | T] ->
            case Pred(H) of
                true ->
                    dropwhile(Pred, T);
                false ->
                    [H | T]
            end;
        [] ->
            []
    end.

antimap(ListF, X) ->
    lists:map(fun(F) -> F(X) end, ListF).


solve(Fun, A, B, Eps) when abs(B - A) < Eps ->
    (A + B) / 2; 
solve(Fun, A, B, Eps) ->
    Mid = (A + B) / 2,
    case abs(B - A) < Eps of
        true -> Mid;
        false ->
            case Fun(A) * Fun(Mid) < 0 of
                true -> solve(Fun, A, Mid, Eps);
                false -> solve(Fun, Mid, B, Eps)
            end
    end.

for(I, Cond, Step, Body) ->
    ResCond = Cond(I),
    if
        ResCond -> 
            Body(I),
            for(Step(I), Cond, Step, Body);
        true ->
            ok
    end.


min(Comp, [H | Tail]) ->
  min(Comp, H, Tail).

min(Comp, Min, []) -> Min;
min(Comp, Min, [H | Tail]) ->
    Cond = Comp(H, Min),
  if 
        Cond == less -> min(Comp, H, Tail);
        true -> min(Comp, Min, Tail)
    end.


sort(Comp, [], Res) -> Res;
sort(Comp, List, Res) ->
    Min = min(Comp, List),
    SubList = List -- [Min],
    NewRes = Res ++ [Min],
    sort(Comp, SubList, NewRes).

% sort(Comporator, List) -> 
%     sort(fun(A, B) -> Comporator(A, B) end,List, []).

start() ->
    List = [-3, a, false, -3, 1],
    fwrite("~p~n", [sum_neg_squares(List)]),
    List1 = [1,3,9,10,6],
    Result = dropwhile(fun(X) -> X < 10 end, List1),
    fwrite("~w~n", [Result]),
    A = antimap([fun(X) -> X + 2 end, fun(X) -> X + 25 end, fun(X) -> X*3 end], 4),
    fwrite("~w~n", [A]),
    B = solve(fun(X) -> X*X - 2 end, 0, 2, 0.001),
    fwrite("~w~n", [B]),
    MyComparator = fun(X, Y) -> if X < Y -> less; X == Y -> equal; true -> greater end end,
    MyList = [5, 1,-40,-40, 9,-4,2349934,-345845],
    SortedList = sort(MyComparator, MyList,[]),
    fwrite("~w~n", [SortedList]),
    Body = fun(I) ->  fwrite("~w~n", [I+100]) end, 
    Step = fun(I) -> I+1 end, 
    Cond =  fun(I) -> I<10 end,
    I=-1,
    for(I, Cond, Step, Body).