% These are all facts.
% Def: X's properties.
%
beautiful(nisse).
beautiful(peter).
beautiful(ulrika).
kind(bosse).
rich(bettan).
rich(nisse).
strong(bettan).
strong(bosse).
strong(peter).
man(bosse).
man(peter).
man(nisse).
woman(ulrika).
woman(bettan).

% like is mostly independent,
% except for the facts above.
% Definition:  X does like Y.
%
like(X,Y) :-
    man(X),
    woman(Y),
    beautiful(Y).
like(ulrika,X) :-
    man(X),
    rich(X),
    kind(X),
    like(X,ulrika).
like(ulrika,X) :-
    man(X),
    beautiful(X),
    strong(X),
    like(X,ulrika).
like(nisse,X) :-
    woman(X),
    like(X,nisse).

% happy depends on like, so
% it needs to be put below.
% Definition: X is happy!!!
%
happy(X) :-
    man(X),
    like(X,Y),
    woman(Y),
    like(Y,X).
happy(X) :-
    woman(X),
    like(X,Y),
    man(Y),
    like(Y,X).
happy(X) :-
    rich(X),
    man(X).
happy(X) :-
    rich(X),
    woman(X).
% -------------------------
% ------EXAMPLE QUERY------
% -------------------------
%
% Who is happy?
% -------------
%
% ?- happy(X).
% X = peter ? ;
% X = ulrika ? ;
% X = nisse ;
% X = bettan 
% no
%
% Who likes who?
% --------------
%
% ?- like(X, Y).
% X = bosse,
% Y = ulrika ;
% X = peter,
% Y = ulrika ;
% X = nisse,
% Y = ulrika ;
% X = ulrika,
% Y = peter ;
% no
%
% Who likes Ulrika and how many of them are there?
% ------------------------------------------------
%
% ?- findall(X, like(X, ulrika), S), length(S, L).
% S = [bosse,peter,nisse],
% L = 3 ? ;
% no
