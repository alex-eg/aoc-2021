:-module(task_1, [main/1]).

read_input(Filename, List) :-
    open(Filename, read, Stream),
    read_stream(Stream, List),
    close(Stream).

read_stream(Stream, List) :-
    read_string(Stream, _, String),
    string_lines(String, Lines),
    maplist(number_string, List, Lines).

count_all([], 0).
count_all([_], 0).
count_all([H1, H2 | T], Count) :-
    H2 > H1,
    count_all([H2 | T], CountNext),
    Count is CountNext + 1.

count_all([_, H2 | T], Count) :-
    count_all([H2 | T], Count).

main(Answer) :-
    read_input("input.txt", Nums),
    count_all(Nums, Answer).
