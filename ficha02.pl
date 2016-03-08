add(X, Y, R) :- R is X + Y.

apply(X, Y, '+', R) :- R is X + Y.
apply(X, Y, '-', R) :- R is X - Y.
apply(X, Y, '*', R) :- R is X * Y.
apply(X, Y, '/', R) :- Y \= 0, R is X / Y.

add3(X, Y, Z, R) :- R is X + Y + Z.

sum([X], X).
sum([X, Y | Tail], Total) :- sum([X + Y| Tail], Total).

foldArithm([X], _, X).
foldArithm([X|Xs], '+', Total) :- foldArithm(Xs, '+', N), Total is N + X.
foldArithm([X|Xs], '*', Total) :- foldArithm(Xs, '*', N), Total is N * X.
foldArithm([X|Xs], '/', Total) :- foldArithm(Xs, '/', N), Total is N / X.

maior(X, Y, X) :- X > Y.
maior(X, Y, Y) :- Y > X.

menor(X, Y, X) :- X < Y.
menor(X, Y, Y) :- Y > X.

max([X], X).
max([X|Xs], X) :- max(Xs, N), N < X.
max([X|Xs], N) :- max(Xs, N), N >= X.

min([X], X).
min([X|Xs], X) :- min(Xs, N), N > X.
min([X|Xs], N) :- min(Xs, N), N =< X.

length2([], 0).
length2([_|Xs], N) :- length2(Xs, M), N is 1 + M.

media([X], X).
media(Xs, Avg) :- sum(Xs, Soma), length2(Xs, Comp), Avg is Soma / Comp.


add(X, L, [X|L]).

isort([X], [X]).
isort([X|Xs], L) :- isort(Xs, L2), insert(X, L2, L).

insert(Y, [], [Y]).
insert(Y, [X|Xs], [X| L]) :- X < Y, insert(Y, Xs, L).
insert(Y, [X|Xs], [Y, X| Xs]) :- X >= Y.

% Construir a extensão de um predicado que contabilize a quantidade de conjuntos vazios que
% existem num determinado conjunto de ocorrências; ???? TODO

% esta mal; why??? TODO
dif2(X, Y) :- X == Y, !, fail.
dif2(X, Y) :- X \= Y, !.


ficha02(xiv,   Sum)   :- add(1, 3, Sum).
ficha02(xv,    Sum)   :- add3(1,3, 5, Sum).
ficha02(xvi,   Mult)  :- apply(2, 4, *, Mult).
ficha02(xvii,  Total) :- foldArithm([5, 3, 1], '+', Total).
ficha02(xviii, Maior) :- maior(1, 3, Maior).
ficha02(xix,   Maior) :- maior(3, 1, Maior).
ficha02(xx)           :- maior(3, 1, Maior), Maior < 2.
ficha02(xxi,   Max)   :- max([5, 3, 7], Max).
ficha02(xxii,  Min)   :- min([2, 4, 6], Min).
  

