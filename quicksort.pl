/*
* Quick Sort
*/

/*
* partition(L, P, LP, RP) est vrai lorsque tout les élements de L inférieurs à P (pivot) sont dans LP et les autres dans RP
*
* partition(L, P, LP, RP) is true when all the elements in L are smaller than P and all the others are in RP
*
*/

partition([E|L], P, [E|LP], RP) :-
    E =< P, partition(L, P, LP, RP).

partition([E|L], P, LP, [E|RP]) :-
    E >  P, partition(L, P, LP, RP).

partition([], _, [], []).

/*
* quicksort(L1, L2) est vrai lorsque L2 représente la liste L1 trié dans l'ordre croissant.
*
* quicksort(L1, L2) is true when L2 is L1 sorted. 
*/
quicksort([], [])
quicksort([E|L], S) :-
    partitionner(L, E, LP, RP),
    quicksort(LP, LPS),
    quicksort(RP, RPS),
    append(LPS, [E|RPS], S).

