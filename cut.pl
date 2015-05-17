/*
 *  Prédicats avec cut
 */

/* dernier(E, L) retourne vrai si E est les dernier élément de L */
dernier(E,[E]) :- !.
dernier(E, [_|L]) :- dernier(E, L).

/* inveser(L1, L2) est vrai lorsque L2 représente la liste inverse de L1 */
inverser([], []) :- !. 
inverser([E|L], L2) :- inverser(L, L1), append(L1, [E], L2), !.
inverser(L1, L2) :- var(L1), nonvar(L2), ! , inverser(L2, L1).

/* aplat(L1, L2) est vrai si L2 représente la liste L1 sans aplat (sans sous
* ligne) */

aplat([], []) :- !.
aplat([E|L1], [E|L]) :- atomic(E), !, aplat(L1, L).
aplat([E|L1], L) :-  aplat(E, L4), aplat(L1, L2), append(L4, L2, L).

/* Recherche de chemin acyclique */
arc(a, b).
arc(b, c).
arc(c, a).
arc(c, d).
arc(d, b).
arc(d, e).
arc(e, c).

cheminacyclique(D, A, L) :- cheminacyclique(D, A, [], L).

cheminacyclique(A, A,_,[]) :- !.
cheminacyclique(D, A, _, [D, A]) :- arc(D, A), !.
cheminacyclique(D, A, N, [D|L]) :- arc(D, D2), not(member(D2, N)), cheminacyclique(D2, A, [D|N], L).
