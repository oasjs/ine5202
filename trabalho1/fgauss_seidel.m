function [x, op_count] = fgauss_seidel(A, B)
    op_count = 0;
    n = size(A, 1);

    % Mapeamento dos coeficientes NÃO NULOS:
    % NN(i,j) = Indice j original do respectivo coefiente Naõ Nulo, exceto a
    % diagonal Principal
    for i = 1 : n
        NT(i) = 0; % Numero Total de coeficientes vizinhos nao nulos
        for j = 1 : i - 1
            if abs(A(i,j)) > 1e-14
                NT(i) = NT(i) + 1;
                NN(i,NT(i)) = j;
            end
        end
        for j = i + 1 : n
            if abs(A(i,j)) > 1e-14
                NT(i) = NT(i) + 1; 
                NN(i, NT(i)) = j; 
            end
        end
    end

    x = zeros(n, 1);
    difference = 1;
    k = 0;
    % Esse é o fator de relaxamento mais adequado para esse sistema, testado
    % empiricamente
    lambda = 1;
    while difference > 1e-10 && k < 100
        k++;
        prev_x = x;
        for i = 1 : n
            c = 1 : NT(i);   %indice de ordem novo das Colunas 
            % _NN=NN(i,c) %indice de ordem original das Colunas 
            % _A =A(i, NN(i,c))
            % _x =x(NN(i,c),1)
            current_x(i) = (B(i,1) - sum(A(i, NN(i,c)) * x(NN(i,c),1))) / A(i,i);
            x(i) = lambda * current_x(i) + (1 - lambda) * prev_x(i);
            op_count += 2 * NT(i) + 4;
        end
        difference = max(abs(x - prev_x));
    end

endfunction