-module(main).
-export([start/0]).


start() ->

    %% Создаем бинарное дерево
    Tree = 
        bin_tree:node(8,
            bin_tree:node(3,
                bin_tree:node(1, bin_tree:empty(), bin_tree:empty()),
                bin_tree:node(6,
                    bin_tree:node(4, bin_tree:empty(), bin_tree:empty()),
                    bin_tree:node(7, bin_tree:empty(), bin_tree:empty())
                )
            ),
            bin_tree:node(10,
                bin_tree:empty(),
                bin_tree:node(14,
                    bin_tree:node(13, bin_tree:empty(), bin_tree:empty()),
                    bin_tree:empty()
                )
            )
        ),
    
    %% Разделяем дерево по значению 6
    {TreeLT, TreeGT} = bin_tree:split(Tree, 6),
        
    %% Выводим результат
    io:format("TreeLT: ~p~n", [bin_tree:view(TreeLT)]),
    io:format("TreeGT: ~p~n", [bin_tree:view(TreeGT)]),
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Set = set:new(),
    Set1 = set:add(Set, "value1"),
    Set2 = set:add(Set1, "value2"),
    Set3= set:add(Set2, "value2"),
    Size = set:size(Set3),
    Contained = set:contains(Set3, "value1"),
    io:format("Contained: ~p~n", [Contained]),
    io:format("Size: ~p~n", [Size]),
    
    Set5 = set:new(),
    
    Set6 = set:add(set:add(set:add(Set5, 1), 2), 3),
    
    Set7 = set:add(Set5, 1),
    
    Set8 = set:add(set:add(set:add(Set3, 2), 3), 4),
    io:format("Set5: ~w~n", [Set5]),
    io:format("Set6: ~w~n", [Set6]),
    io:format("Set7: ~w~n", [Set7]),
    io:format("Set8: ~w~n", [Set8]),
    io:format("Is Set1 a subset of Set2? ~w~n", [set:is_subset(Set5, Set6)]),
    io:format("Is Set2 a subset of Set1? ~w~n", [set:is_subset(Set6, Set5)]),
    io:format("Is Set7 a subset of Set4? ~w~n", [set:is_subset(Set7, Set8)]),
    io:format("Is Set4 a subset of Set2? ~w~n", [set:is_subset(Set8, Set6)]).

