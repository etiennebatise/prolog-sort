/*
 *  Prédicats sans cut
 */

/* premier(X, L) retourne vrai sur X est le premier élément de L */
premier(X, [X|_]).

/* dernier(E, L) retourne vrai si E est les dernier élément de L */
dernier(E,[E]).
dernier(E, [_|L]) :- dernier(E, L).

/* inveser(L1, L2) est vrai lorsque L2 représente la liste inverse de L1 */
inverser([], []).
inverser([E|L], L2) :- inverser(L, L1), append(L1, [E], L2).

/* Coloriage */
case(c1).
case(c2).
case(c3).
case(c4).

couleur(rouge).
couleur(vert).
couleur(bleu).

colorier(C1, C2, C3, C4) :- 
        couleur(C1),
        couleur(C2),
        C1 \= C2,
        couleur(C3),
        C1 \= C3,
        C2 \= C3,
        couleur(C4),
        C1 \= C4,
        C3 \= C4.
