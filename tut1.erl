-module(tut1).
-export([fac/1]).
-export([multi/2]).

fac(1) ->
    1;
fac(N) ->
    N * fac(N - 1).

multi(X, Y) ->
    X * Y.
