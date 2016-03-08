:- op(900, xfy, '::').
:- dynamic filho/2.
% :- dynamic pai/2.

% pai(P, F) :- filho(F, P).
% pai(paulo, filipe).
% avo(antonio, nadia).

filho(joao, jose).
filho(jose, manuel).
filho(carlos, jose).

+filho(F, P) :: (findall((F, P), (filho(F, P)), S),
                length(S, N), 
                N == 1).

+filho(F, _) :: (findall(Ps, (filho(F, Ps)), S),
                length(S, N), 
                N =< 2).

evolucao(Termo) :-
    findall(Invariante, +Termo::Invariante, Lista),
    insere(Termo),
    testar(Lista).

insere(Termo) :- assert(Termo).
insere(Termo) :- retract(Termo), !, fail.

testar([]).
testar([R | LR]) :- R, testar(LR).

