% 2. Calcule a integral de f(x)=x*ln(x)/(1+cos(x)) entre 0.1 e 1.0, com
% precisão de 4 dígitos significativos (pode-se estimar o erro), pelo método
% mais eficiente (testar Simpson, Gauss-Legendre,...).

function q2_routine()

    printf("Questão 2:\n\n");

    a = 0.1;
    b = 1.0;
    f = @(x) x.*log(x)./(1+cos(x));

    printf("Número de intervalos do Simpson: 9\n");
    printf("Número de intervalos do Gauss-Legendre: 4\n");
    printf("\n");

    % Simpson
    Sn = simpson_integral(9, f, a, b)

    % Gauss-Legendre
    Gm = gauss_legendre_integral(4, a, b, f)

    Ie = -0.126427
    printf("\n");

endfunction