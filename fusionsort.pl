/*
 * Fusion sort
 */

/* 
* fusion(L1, L2, L) est vrai lorsque L représente la concaténation de L1 et L2 dans l'ordre croissant 
*
* fusion(L1, L2, L) is true when L is the concat of L1 and L2 and sorted.
 */
fusion(L, [], L).
fusion([], L, L).
fusion([E1|L1], [E2|L2], [E1|L3]) :- E1=<E2, fusion(L1, [E2|L2], L3).
fusion([E1|L1], [E2|L2], [E2|L3]) :- E1 >E2, fusion([E1|L1], L2, L3).

/*
* split(L, L2, L3) est vrai lorsque L2 et L3 représentent la première et la deuxième moitié de L. La longueur de L2 <= la longueur de L3.
*
* split(L, L2, L3) is true when L2 and L3 are both a half of L. Lenght of L3 is always >= than L2.
*/

split(L, L2, L3) :- append(L2, L3, L), length(L2, N), length(L3, N).
split(L, L2, L3) :- append(L2, L3, L), length(L2, N), length(L3, M), N is M-1.

/*
* fusionsort(L, T) vaut vrai lorsque T représente la liste L triée dans l'ordre croissant. Le tri utilise la méthode par fusion.
*
* fusionsort(L, T) is true when T is the L list sorted using fusion sort.
*/
fusionsort([], []).
fusionsort([E], [E]).
fusionsort(L, T) :-
    split(L, L1, L2),
    fusionsort(L1, T1),
    fusionsort(L2, T2), 
    fusion(T1, T2, T).
