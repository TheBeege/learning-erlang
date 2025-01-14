-module(tut6).
-export([list_max/1]).

list_max([Head|Rest]) ->
   list_max(Rest, Head).

list_max([], Result) ->
    Result;
list_max([Head|Rest], Result_so_far) when Head > Result_so_far ->
    list_max(Rest, Head);
list_max([_Head|Rest], Result_so_far)  ->
    list_max(Rest, Result_so_far).
