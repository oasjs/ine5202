function c = newton_coef(x, y)

    n = length(x);

    % Prepara a primeira coluna com as diferenças divididas dos pares (x,y)
    for i = 1 : n - 1
        aux(i, 1) = (y(i + 1) - y(i)) / (x(i + 1) - x(i));
    end

    % Para cada coluna seguinte, calcula as diferenças divididas baseadas na
    % coluna anterior
    for i = 2 : n - 1
        for j = 1 : n - i
            aux(j, i) = (aux(j + 1, i - 1) - aux(j, i - 1)) / (x(j + i) - x(j));
        end
    end

    c = [y(1), aux(1, :)];

endfunction