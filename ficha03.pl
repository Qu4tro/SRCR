maior(X, Y, X) :- X > Y.
maior(X, Y, Y) :- Y > X.

not(Goal) :- call(Goal),!,fail.
not(_).

pertence(X, [X | _]).
pertence(X, [_ | Xs]) :- pertence(X, Xs).

comprimento([], 0).
comprimento([_ | Xs], 1 + Len) :- comprimento(Xs, Len).

quantos([], 0).
quantos([X | Xs], Unique)     :- pertence(X, Xs), quantos(Xs, Unique).
quantos([_ | Xs], Unique + 1) :- quantos(Xs, Unique).

apagar(_, [], []).
apagar(Elem, [Elem | Xs], Xs).
apagar(Elem, [X | Xs], [X | Ys]) :- apagar(Elem, Xs, Ys).

apagarTudo(_, [], []).
apagarTudo(Elem, [Elem | Xs],      Ys ) :- apagarTudo(Elem, Xs, Ys).
apagarTudo(Elem, [X    | Xs], [X | Ys]) :- apagarTudo(Elem, Xs, Ys).

add(New, [], [New]).
add(New, [New | Xs], [Xs]).
add(New, [X   | Xs], [X | Ys]) :- add(New, Xs, Ys).

concatenar([],       L2, L2).
concatenar(L1,       [], L1).
concatenar([X | L1], L2, [X | R]) :- concatenar(L1, L2, R).

inverter([], []).
inverter([X | Xs], Zs) :- inverter(Xs, Ys), concatenar(Ys, [X], Zs).

ePrefixo([], _).
ePrefixo([X | Xs], [X | Ys]) :- ePrefixo(Xs, Ys).

sublista([], _).
sublista([X | S], [X | L]) :- ePrefixo(S, L).
sublista(S, [_ | L]) :- sublista(S, L).

% TODO
% all(Goal, R) :- call(Goal),!,fail.
% all(_).

ficha03(xiii,  Maior) :- maior(1, 3, Maior).
ficha03(xiv,   Maior) :- maior(3, 1, Maior).

ficha03(xv)           :- maior(3, 1, Maior), Maior < 2.
ficha03(xvi)          :- not(filho(joao, manuel)).
ficha03(xvii)         :- not(filho(joao, jose)).
ficha03(xviii)        :- not(descendente(joao, jose)).
ficha03(xix)          :- not(descendente(joao, jose), 1).
ficha03(xx)           :- pertence(b, [a, b, c]).
ficha03(xxi)          :- pertence(1, [a, b, c]).
ficha03(xxii)         :- pertence(X, [a, b, c]), X == b, !.

ficha03(xxiii,  Len)  :- comprimento([], Len).
ficha03(xxiv,  R)     :- apagar(2, [a, b, c], R).
ficha03(xxv,  R)      :- apagarTudo(2, [a, b, c], R).

ficha03(xxvi)         :- concatenar([1, 2], [a, b, c], [1, 2, a, b, c]).
ficha03(xxvii)        :- sublista([2, 3], [1, 2, 3, 4, 5]).
ficha03(xxviii)       :- sublista([3, 2], [1, 2, 3, 4, 5]).
ficha03(xxix)         :- sublista([2, 4], [1, 2, 3, 4, 5]).
ficha03(xxx)          :- fail.
ficha03(xxxi)         :- fail.
ficha03(xxxii)        :- fail.
ficha03(xxxiii)       :- fail.
ficha03(xxxiv)        :- fail.
ficha03(xxxv)         :- fail.
  



