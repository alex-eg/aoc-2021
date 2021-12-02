:-module(task_1, [part_one/1, part_two/1]).

read_input(Filename, List) :-
    open(Filename, read, Stream),
    read_stream(Stream, List),
    close(Stream).

read_stream(Stream, List) :-
    read_string(Stream, _, String),
    string_lines(String, Lines),
    maplist(number_string, List, Lines).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

count_all([], 0).
count_all([_], 0).
count_all([H1, H2 | T], Count) :-
    H2 > H1,
    count_all([H2 | T], CountNext),
    Count is CountNext + 1.

count_all([_, H2 | T], Count) :-
    count_all([H2 | T], Count).

part_one(Answer) :-
    read_input("input.txt", Nums),
    count_all(Nums, Answer).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

count_three([], _, 0).
count_three([_], _, 0).
count_three([_, _], _, 0).

count_three([A, B, C | T], 0, Count) :-
    FirstSum is A + B + C,
    count_three([B, C | T], FirstSum, Count).

count_three([A, B, C | T], PrevSum, Count) :-
    Sum is A + B + C,
    Sum > PrevSum,
    count_three([B, C | T], Sum, NextCount),
    Count is NextCount + 1.

count_three([A, B, C | T], _, Count) :-
    Sum is A + B + C,
    count_three([B , C | T], Sum, Count).

part_two(Answer) :-
    read_input("input.txt", Nums),
    count_three(Nums, 0, Answer).
