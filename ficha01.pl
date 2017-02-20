filho(joao, jose).
filho(jose, manuel).
filho(carlos, jose).

pai(paulo, filipe).
pai(paulo, maria).

avo(antonio, nadia).

homem(joao).
homem(jose).

mulher(maria).
mulher(joana).

pai(X, Y) :- filho(Y, X).

avo(A, N) :- filho(A, X), filho(X, N).

neto(N, A) :- avo(A, N).

descendente(X, Y) :- filho(X, Y).
descendente(X, Y) :- filho(X, A), descendente(A, Y).

descendente(D, A, 1)  :- filho(D, A).
descendente(D, A, G1) :- filho(D, X), descendente(X, A, G), G1 is G + 1.

bisavo(A, N) :- descendente(A, N, 3).
trisavo(A, N) :- descendente(A, N, 4).
tetravo(A, N) :- descendente(A, N, 5).


ficha01(xx)       :- filho(joao, jose).
ficha01(xxi)      :- pai(jose, joao).
ficha01(xxii)     :- homem(joao).
ficha01(xxiii)    :- mulher(jose).
ficha01(xxiv)     :- filho(jose, _).
ficha01(xxv)      :- filho(jose, joao).
ficha01(xxvi)     :- avo(manuel, jose).
ficha01(xxvii)    :- avo(manuel, joao).
ficha01(xxviii)   :- neto(carlos, _).
ficha01(xxix)     :- descendente(joao, manuel).
ficha01(xxx)      :- filho(X, jose), descendente(X, manuel).
ficha01(xxxi)     :- descendente(manuel, X), filho(X, jose).
ficha01(xxxii, G) :- descendente(joao, jose, G).
ficha01(xxxiii)   :- descendente(joao, jose, G), G = 1.
ficha01(xxxiv, G) :- descendente(joao, manuel, G).
ficha01(xxxv)     :- descendente(joao, manuel, G), G > 2 .
  

