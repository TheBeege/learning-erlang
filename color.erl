-module(color).

-export([new/4, blend/2]).

-define(is_channel(Value), (is_float(Value) andalso Value >= 0.0 andalso Value =< 1.0)).

new(Red,Green,Blue,Alpha) when ?is_channel(Red), ?is_channel(Green),
                  ?is_channel(Blue), ?is_channel(Alpha) ->
    #{red => Red, green => Green, blue => Blue, alpha => Alpha}.

blend(Source,Destination) ->
    blend(Source,Destination,alpha(Source,Destination)).

blend(Source,Destination,Alpha) when Alpha > 0.0 ->
    Destination#{
        red   := red(Source,Destination) / Alpha,
        green := green(Source,Destination) / Alpha,
        blue  := blue(Source,Destination) / Alpha,
        alpha := Alpha
    };
blend(_,Destination,_) ->
    Destination#{
        red   := 0.0,
        green := 0.0,
        blue  := 0.0,
        alpha := 0.0
    }.

alpha(#{alpha := SourceAlpha}, #{alpha := DestinationAlpha}) ->
    SourceAlpha + DestinationAlpha*(1.0 - SourceAlpha).

red(#{red := SourceValue, alpha := SourceAlpha}, #{red := DestinationValue, alpha := DestinationAlpha}) ->
    SourceValue*SourceAlpha + DestinationValue*DestinationAlpha*(1.0 - SourceAlpha).
green(#{green := SourceValue, alpha := SourceAlpha}, #{green := DestinationValue, alpha := DestinationAlpha}) ->
    SourceValue*SourceAlpha + DestinationValue*DestinationAlpha*(1.0 - SourceAlpha).
blue(#{blue := SourceValue, alpha := SourceAlpha}, #{blue := DestinationValue, alpha := DestinationAlpha}) ->
    SourceValue*SourceAlpha + DestinationValue*DestinationAlpha*(1.0 - SourceAlpha).