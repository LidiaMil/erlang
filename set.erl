-module(set).
-export([new/0, add/2, remove/2, contains/2, size/1, is_subset/2, test_set/1]).

new() ->
    [].

add(Set, Value) ->
    case contains(Set, Value) of
        true -> Set;
        false -> [Value | Set]
    end.

remove(Set, Value) ->
    lists:delete(Value, Set).

contains(Set, Value) ->
    lists:member(Value, Set).

is_subset(Set1, Set2) ->
    lists:all(fun(Element) -> contains(Set2, Element) end, Set1).

size(Set) ->
    length(Set).

%% Проверка соответствия аксиомам
test_set(Module) ->
    S0 = Module:new(),
    S1 = Module:add(S0, a),
    S2 = Module:add(S1, a),
    S3 = Module:add(S2, b),
    Set4 = Module:remove(S3, b), % сохраняем значение в переменной Set4
    true = Module:contains(Set4, a),
    false = Module:contains(Set4, b),
    true = Module:is_subset(Set4, [a]),
    true = Module:is_subset(S0, Set4),
    0 = Module:size(Module:new()),
    1 = Module:size(Module:add(S0, a)),
    1 = Module:size(Module:add(S1, a)),
    2 = Module:size(Module:add(S2, b)),
    1 = Module:size(Module:remove(S3, b)).
