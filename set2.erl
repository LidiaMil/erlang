-module(set2).
-export([new/0, add/2, remove/2, contains/2, size/1, test_set/1, is_subset/2]).

%% Создание нового пустого множества
new() -> sets:new().

%% Добавление элемента в множество
add(Set, Value) -> sets:add_element(Value, Set).

%% Удаление элемента из множества
remove(Set, Value) -> sets:del_element(Value, Set).

%% Проверка наличия элемента в множестве
contains(Set, Value) -> sets:is_element(Value, Set).

%% Получение размера множества
size(Set) -> sets:size(Set).

is_subset(Set1, Set2) -> sets:is_subset(Set1, Set2).

%% Проверка соответствия аксиомам
test_set(Module) ->
    S0 = Module:new(),
    S1 = Module:add(S0, a),
    S2 = Module:add(S1, a),
    S3 = Module:add(S2, b),
    Set4 = Module:remove(S3, b), % сохраняем значение в переменной Set4
    true = Module:contains(Set4, a),
    false = Module:contains(Set4, b),
    true = Module:is_subset(Set4, Module:add(Module:new(),a)),
    true = Module:is_subset(S0, Set4),
    0 = Module:size(Module:new()),
    1 = Module:size(Module:add(S0, a)),
    1 = Module:size(Module:add(S1, a)),
    2 = Module:size(Module:add(S2, b)),
    1 = Module:size(Module:remove(S3, b)).
