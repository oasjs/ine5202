function x = newtonsis(xi, f, d, err, rep)

    k = 0;
    delta_x = d * ones(length(xi), 1);

    % Forma genérica para matrizes jacobianas de tamanho n x n
    while max(abs(delta_x)) > err && k < rep
        k = k + 1;
        for i = 1 : length(f)
            for j = 1 : length(xi)
                partial     = xi;
                partial(j)  = partial(j) + delta_x(j);
                A(i, j)     = (f{i}(partial) - f{i}(xi)) / delta_x(j);
            end
        end

        for i = 1 : length(f)
            B(i, 1) = -f{i}(xi);
        end

        delta_x = A \ B;
        x = xi + delta_x * 0.1;
        xi = x;
    end

endfunction