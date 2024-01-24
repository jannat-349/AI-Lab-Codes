road(main_gate,cse, 10).
road(cafe,cse, 4).
road(sheikh_hasina_hall,cafe, 5).
road(arts_faculty,biology_faculty, 8).
road(bottola,pritilata_hall, 10).
road(cse,math, 9).
road(math,bottola, 8).
road(biology_faculty,bottola, 7).
road(cse,cafe, 4).
road(cafe,bottola, 6).
road(math,arts_faculty, 2).


get_road(Start, End, Visited, Result) :-
    get_road(Start, End, [Start], 0, Visited, Result).

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
    road(Start, End, Distance),
    reverse([End|Waypoints], Visited),
    TotalDistance is DistanceAcc + Distance.

get_road(Start, End, Waypoints, DistanceAcc, Visited, TotalDistance) :-
    road(Start, Waypoint, Distance),
    \+ member(Waypoint, Waypoints),
    NewDistanceAcc is DistanceAcc + Distance,
    get_road(Waypoint, End, [Waypoint|Waypoints], NewDistanceAcc, Visited, TotalDistance).

% query example and output
% ?- get_road(sheikh_hasina_hall, cse, Visited, Distance).
% Visited = [sheikh_hasina_hall, cafe, cse],
% Distance = 9 ;
% false.

% ?- get_road(main_gate, arts_faculty, Visited, Distance).
% Visited = [main_gate, cse, math, arts_faculty],
% Distance = 21 ;
% false.
