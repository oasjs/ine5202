format long

% CASO 1

A = [
    15  2   3;
     1 -1   4;
     7  2  -3;
    ];
B = [
    10;
    -1;
     8;
    ];
% x = inv(A) * B
% x = [1.85; -5.71; -2.14]
% x = A\B

X = fgauss(A, B)
res = max(abs(A*X-B))

% CASO 2 (Possivel, mas indeterminado)

A = [0 2 3; 0 -1 4; 0 -2 8];
B = [10; -1; 8];

X = fgauss(A, B)
res = max(abs(A*X-B))

% CASO 3 (Impossivel)

A = [0 2 3; 0 -1 4; 0 -2 8];
B = [10; -1; 8];

X = fgauss(A, B)
res = max(abs(A*X-B))

