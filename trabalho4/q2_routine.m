% 2. Calcule a integral de f(x)=x*ln(x)/(1+cos(x)) entre 0.1 e 1.0, com
% precisão de 4 dígitos significativos (pode-se estimar o erro), pelo método
% mais eficiente (testar Simpson, Gauss-Legendre,...).

function q2_routine()

    printf("Questão 2:\n");

    a = 0.1;
    b = 1.0;
    f = @(x) x.*log(x)./(1+cos(x));

    % Simpson
    Sn = simpson_integral(9, f, a, b)

    % Gauss-Legendre
    Gm = gauss_legendre_integral(4, a, b, f)

endfunction