-module(main).
-import(math,[pi/0]).
-export([start/0]).

ball_volume(X) -> 4/3*pi()*X*X*X.

from_to(M,N) when N >= M -> 
   from_to(M,N-1)++[N];
from_to(_,_) -> 
   []. 

delta_help(First,[Second | []]) ->
  [Second - First];
delta_help(First,[Second | List]) ->
  [Second - First| delta_help(Second,List)].



delta(List) -> 
  delta_help(0, List).

int_to_binary_help(0, Result) when Result=="" ->
  "0";
int_to_binary_help(0, Result) ->
  Result;
int_to_binary_help(A, Result) when  A rem 2 == 0 ->
  int_to_binary_help(A div 2, "0"++Result);
int_to_binary_help(A, Result) when  A rem 2 == 1 ->
  int_to_binary_help(A div 2, "1"++Result).

  

int_to_binary(A)  when A<0  -> 
  "-"++int_to_binary_help(-A,"");
int_to_binary(A)    -> 
  int_to_binary_help(A,"").

rle_encode_helper(Prev, 1,[],Result ) ->
  Result++[Prev];
rle_encode_helper(Prev, Count,[],Result ) ->
  Result++[{Prev, Count}];
rle_encode_helper(Prev, Count,[Curr|List],Result ) when Curr == Prev ->
  rle_encode_helper(Prev, Count +1, List, Result);
rle_encode_helper(Prev, 1,[Curr|List],Result ) when Curr /= Prev ->
  rle_encode_helper(Curr, 1, List, Result++[Prev]);
rle_encode_helper(Prev, Count,[Curr|List],Result ) when Curr /= Prev ->
  rle_encode_helper(Curr, 1, List, Result++[{Prev,Count}]).


rle_encode([First|List]) ->
  rle_encode_helper(First, 1,List ,[]).

intersect(A,B)-> A--(A--B).



is_date(1, 1, 2000) ->
  6;
is_date(D, M, Y)  when D /= 1  ->
  Today = (is_date(D-1, M, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 2, Y) ->
  Today = (is_date(31, 1, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 4, Y) ->
  Today = (is_date(31, 3, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 5, Y) ->
    Today = (is_date(30, 4, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 6, Y) ->
    Today = (is_date(31, 5, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 7, Y) ->
    Today = (is_date(30, 6, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 8, Y) ->
    Today = (is_date(31, 7, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 9, Y) ->
    Today = (is_date(31, 8, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 10, Y) ->
    Today = (is_date(30, 9, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 11, Y) ->
    Today = (is_date(31, 10, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 12, Y) ->
    Today = (is_date(30, 11, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 3, Y) when  Y rem 4 == 0 andalso (Y rem 100 /= 0 orelse Y rem 400 == 0) ->
    Today = (is_date(29, 2, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 3, Y) ->
    Today = (is_date(28, 2, Y)+1),
  Today rem 8 + Today div 8;
is_date(1, 1, Y) ->
    Today = (is_date(31, 12, Y-1)+1),
  Today rem 8 + Today div 8.



start() ->
   A = ball_volume(1.0),
   io:fwrite("ex1\n"),
   io:fwrite("~f\n",[A]),
   io:fwrite("ex2\n"),
   B = from_to(4,5),
   io:fwrite("~w\n",[B]),
   io:fwrite("ex3\n"),
   C = delta([1,2,4,-3]),
   io:fwrite("~w\n",[C]),
   io:fwrite("ex4\n"),
   D = int_to_binary(10000),
   io:fwrite("~s\n",[D]),
   io:fwrite("ex5\n"),
   E = rle_encode([a,a,a,b,c,c,a,a]),
   io:fwrite("~w\n",[E]),
   io:fwrite("ex6\n"),
   F = intersect([1, 3, 2, 5], [2, 3, 4]),
   io:fwrite("~w\n",[F]),
   io:fwrite("ex7\n"),
   G = is_date(1, 3, 2020),
   io:fwrite("~w\n",[G]).


