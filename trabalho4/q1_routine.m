% 1a. (Opcional) Monte as 6 equações que determinam os m=3 coeficientes pesos C
% e os m=3 pontos/nós t necessários no Método de Gauss-Legendre;

% 1b. Determine os m=3 coeficientes c e m=3 pontos/nós t necessários no Método
% de Gauss-Legendre através das 2*3 equações não lineares obtidas no item (1a),
% use o código do Método de Newton genérico para n equações não lineares
% (sugestões: xi = C's devem estar entre 0 e 1, pois a soma é 2; e t's devem
% estar entre -1 e +1. Usar sub-relaxação.);

% 1c. Alternativamente, determine os m=3 pontos/nós t necessários no Método de
% Gauss-Legendre através das raízes do polinômio de Legendre de grau m=3;

% 1d. Obtidos os m=3 pontos/nós t acima, determine os m=3 coeficientes pesos C
% do Método de Gauss-Legendre através das 3 primeiras equações, linearizadas
% com os 3 t´s obtidas no item 1c;


function q1_routine()

    printf("Questão 1:\n\n");

    m = 3;
    % 1a)
    f1 = @(x) x(1) + x(2) + x(3) - 2;
    f2 = @(x) x(1)*x(4) + x(2)*x(5) + x(3)*x(6);
    f3 = @(x) x(1)*x(4)^2 + x(2)*x(5)^2 + x(3)*x(6)^2 - 2/3;
    f4 = @(x) x(1)*x(4)^3 + x(2)*x(5)^3 + x(3)*x(6)^3;
    f5 = @(x) x(1)*x(4)^4 + x(2)*x(5)^4 + x(3)*x(6)^4 - 2/5;
    f6 = @(x) x(1)*x(4)^5 + x(2)*x(5)^5 + x(3)*x(6)^5;

    % 1b)
    f = {f1, f2, f3, f4, f5, f6};
    xi = [0.5; 1; 0.5; -1; 0; 1];
    x = newtonsis(xi, f, 1, 1e-8, 1000);
    printf("1b) Pelo método de Newton:\n");
    printf("    c = %f, %f, %f\n", x(1), x(2), x(3));
    printf("    t = %f, %f, %f\n", x(4), x(5), x(6));
    printf("\n");

    % 1c)
    L3 = @(x) 5*x^3/2 - 3*x/2;
    t = sort(roots([5/2 0 -3/2 0]));
    printf("1c) Pelas raízes do polinômio de Legendre:\n");
    printf("    t = %f, %f, %f\n", t(1), t(2), t(3));
    printf("\n");

    % 1d)
    for i = 1 : m
        for j = 1 : m
            A(i, j) = t(j)^(i-1);
        end
    end
    B = [2; 0; 2/3];
    C = A\B;
    printf("1d) Pelo método de Gauss-Legendre:\n");
    printf("    c = %f, %f, %f\n", C(1), C(2), C(3));

    printf("\n");

endfunction

q1_routine()
