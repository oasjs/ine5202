function [X, op_count] = fgauss(A, B)
    op_count = 0;
    A = [A B];
    n = size(A, 1);
    for k = 1 : n
        % Melhor linha k é aquela cujo elemento auxiliar tem o maior valor
        % absoluto.
        % A funcao max retorna um vetor contendo o maior valor absoluto e sua
        % posicao no vetor retornado.
        [best_element, pos] = max(abs(A(k:n, k)));

        % A posicao precisa ser corrigida de acordo com a matriz A.
        pos = pos + k - 1;
        current_line = A(k, :);

        % Ocorre uma troca entre a linha atual e a que possui o melhor elemento
        % aux.
        A(k, :) = A(pos, :);
        A(pos, :) = current_line;

        for i = (k + 1) : n
            aux = A(i, k) / A(k, k);
            op_count += 1;
            for j = 1 : n + 1
                A(i, j) = A(i, j) - aux * A(k, j);
                op_count += 2;
            end
        end
    end

    % A matriz A agora está na forma triangular superior.
    % A ultima linha é resolvida separadamente.
    % Se A(n,n1) for residuo pequeno: abs(A(n,n1)) < 1e-15
    if A(n, n) != 0
        X(n) = A(n, n+1) / A(n, n);
        op_count += 1;
    else
        % Se o ultimo elemento da ultima linha for zero e o elemento da ultima
        % coluna for zero, o sistema é indeterminado.
        if A(n, n + 1) == 0
            X(n) = 0;
        % Se o ultimo elemento da ultima linha for zero e o elemento da ultima
        % coluna for diferente de zero, o sistema é impossivel.
        else
            X(n) = NaN;
            exit;
        end
    end

    for i = n - 1 :  -1 : 1
        sum_ = 0;
        for j = i + 1 : n
            sum_ = sum_ + (A(i, j) * X(j));
            op_count += 2;
        end
        X(i) = (A(i, n + 1) - sum_) / A(i, i);
        op_count += 2;
    end
    X = transpose(X);
endfunction