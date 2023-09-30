function x = newtonsis(xi, f)

    k = 0;
    delta_x = [1e-10; 1e-10; 1e-10];

    % Forma genérica para matrizes jacobianas de tamanho n x n
    while max(abs(delta_x)) > 1e-14 && k < 100
        k = k + 1;
        for i = 1 : length(f)
            for j = 1 : length(xi)
                partial     = [xi(1); xi(2); xi(3)];
                partial(j)  = partial(j) + delta_x(j);
                A(i, j)     = (f{i}(partial) - f{i}(xi)) / delta_x(j);
            end
        end

        B = -[f{1}(xi); f{2}(xi); f{3}(xi)];

        delta_x = A \ B;
        x = xi + delta_x;
        xi = x;
    end

endfunction