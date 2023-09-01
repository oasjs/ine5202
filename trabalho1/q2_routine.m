% 2.1). Dado o sistema de equações lineares abaixo para n3 equações:
% n1=15; n2=25; n3=50;

% i=1               #   3*x(i) + 2*x(i+5) = 2
% for i=2:n1-1      #   x(i-1) + 3*x(i) + 2*x(i+5) = -2
% for i=n1:n2-1     #   2*x(i-4) + 4*x(i)+ x(i+1) = 3
% i=n2              #   x(i-1) + 6*x(i) - x(i+4) = -2
% for i=n2+1:n3-1   #   x(i-3) + x(i-1) + 7*x(i) + 2*x(+1) = 5
% i=n3              #   2*x(i-10) + 5*x(i)= -5

% 1a). Armazene o sistema acima em forma de matriz completa (não imprima); X
% 1b). Resolva o sistema acima por um método direto construído em aula. Imprima 
% a solução e o resíduo máximo das equações; X
% 1c). Imprima o número total de operações com números reais (em PONTO
% FLUTUANTE) utilizadas; X

% 2.2). O sistema acima possui muitos coeficientes nulos, pois cada incógnita
% se relaciona apenas com uma vizinhança próxima, gerando uma matriz esparsa de
% coeficientes. Nesses casos devemos tentar armazenar e operar apenas os
% coeficientes não nulos, usando por exemplo, métodos iterativos.

% 2a). Demostre/Imprima que o sistema acima tem convergência garantida por 
% métodos iterativos; X

% 2b). Resolva o sistema acima por um método iterativo construído em aula, a
% partir da matriz completa (operar somente os coeficientes não nulos), com o
% menor número de iterações (escolha um fator de relaxação adequado) e
% operações possível, COM PRECISÃO DE 6 DÍGITOS EXATOS DEPOIS DA VIRGULA. X

% Imprima a solução e o resíduo máximo das equações;

% 2c). Imprima o número total de operações com números reais (em PONTO 
% FLUTUANTE) utilizadas.

function q2_routine()

    n1 = 15; n2 = 25; n3 = 50;
    [A, B] = build_system(n1, n2, n3);

    printf("2.1\n\n");

    % Soluciona o sistema pelo método direto de Gauss.
    printf("b) Solução pelo método direto de Gauss:\n\n");
    [X_gauss, op_count_gauss] = fgauss(A, B);
    X_gauss

    % Calcula o resíduo máximo.
    res = max(abs(A*X_gauss - B));
    printf("Residuo máximo: %d\n\n", res);

    % Calcula o total de operações.
    printf("c) Total de operaçoes: %d\n\n", op_count_gauss);

    % Testa se o sistema é convergente.
    printf("2.2\n\n");
    if is_convergent(A)
        convergence_ans = "tem convergência garantida";
    else
        convergence_ans = "não tem convergência garantida";
    endif
    printf("a) Pelo método do cálculo da dominância da diagonal principal, podemos constatar que o sistema %s.\n\n", convergence_ans);

    % Soluciona o sistema pelo método iterativo de Gauss-Seidel.
    printf("b) Solução pelo método iterativo de Gauss-Seidel (6 digitos de precisão):\n\n");
    [X_gauss_seidel, op_count_seidel] = fgauss_seidel(A, B);
    % Imprime a solução com 6 dígitos de precisão.
    printf("    %.6f\n", X_gauss_seidel);
    printf("\n");

    % Calcula o resíduo máximo.
    res = max(abs(A*X_gauss_seidel - B));
    printf("Residuo máximo: %d\n\n", res);

    % Calcula o total de operações.
    printf("c) Total de operaçoes: %d\n\n", op_count_seidel);

endfunction

function [A, B] = build_system(n1, n2, n3)
    % i=1               #   3*x(i) + 2*x(i+5) = 2
    i = 1; A(i, i) = 3; A(i, i+5) = 2; B(i) = 2;

    % for i=2:n1-1      #   x(i-1) + 3*x(i) + 2*x(i+5) = -2
    for i = 2 : n1 - 1
        A(i, i-1) = 1; A(i, i) = 3; A(i, i+5) = 2; B(i) = -2;
    endfor

    % for i=n1:n2-1     #   2*x(i-4) + 4*x(i)+ x(i+1) = 3
    for i = n1 : n2-1
        A(i, i-4) = 2; A(i, i) = 4; A(i, i+1) = 1; B(i) = 3;
    endfor

    % i=n2              #   x(i-1) + 6*x(i) - x(i+4) = -2
    i = n2; A(i, i-1) = 1; A(i, i) = 6; A(i, i+4) = -1; B(i) = -2;

    % for i=n2+1:n3-1   #   x(i-3) + x(i-1) + 7*x(i) + 2*x(+1) = 5
    for i = n2 + 1 : n3 - 1
        A(i, i-3) = 1; A(i, i-1) = 1; A(i, i) = 7; A(i, i+1) = 2; B(i) = 5;
    endfor

    % i=n3              #   2*x(i-10) + 5*x(i)= -5
    i = n3; A(i, i-10) = 2; A(i, i) = 5; B(i) = -5;

    B = transpose(B);

endfunction

function is_convergent = is_convergent(A)
    % Verifica se o sistema é convergente
    is_convergent = false;
    satisfied_second_condition = false;
    n = size(A, 1);
    for i = 1 : n
        prev_neighboors = sum(A(i, 1 : i - 1));
        next_neighboors = sum(A(i, i + 1 : n));

        if A(i, i) < prev_neighboors + next_neighboors
            is_convergent = false;
            break
        endif

        if ~satisfied_second_condition
            if A(i, i) > prev_neighboors + next_neighboors
                is_convergent = true;
                satisfied_second_condition = true;
            endif
        endif
    endfor
endfunction