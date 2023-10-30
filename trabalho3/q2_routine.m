% 2). Ajuste os m=7 pontos experimentais abaixo, através de:

% - funções polinomiais de grau n entre 1 a 6, escolha o grau n que melhor
% represente os m pontos, e

% - função racional: g(x)=a(1)/(a(2)+a(3)*x²):

% x = [ 1.2   1.5   2.     4.     6.     10.   15. ]
% y = [ 0.45 0.40 0.33 0.20 0.14 0.10 0.06 ]
% O valor inicial, Ci, pode ser determinado por interpolação da função
% exponencial aplicada de forma exata sobre 3 dos pontos dados, ou, testando
% diferentes valores com uso de fator de sub-relaxação no Método de Newton;

% Faça uma análise completa, pelos desvios totais e pelos gráficos, e defina
% qual foi o melhor ajuste conseguido.


function q2_routine()

    x = [1.2    1.5     2       4       6       10      15];
    y = [0.45   0.40    0.33    0.20    0.14    0.10    0.06];

    xp = x(1):0.1:x(end);

    yr = rational(x, y, xp);

    yp = polynomial(x, y, xp);

    figure(2);
    plot(x, y, 'o', xp, yr, xp, yp);
    legend('Dados', 'Racional', 'Polinomial');
    xlabel('x');
    ylabel('y');
    title('Ajuste de curvas');
    grid on;

endfunction


function yr = rational(x, y, xp)

    % Funcao racional
    g = @(a) a(1) ./ (a(2) + a(3) .* x.^2);

    % Funcoes de minimizacao direta do desvio quadratico total
    f{1} = @(a) sum((g(a) - y) .* (1 ./ a(2) + a(3) .* x.^2)                );
    f{2} = @(a) sum((g(a) - y) .* (1 ./ (a(2) + a(3) .* x.^2).^2)           );
    f{3} = @(a) sum((g(a) - y) .* (1 ./ (a(2) + a(3) .* x.^2).^2)           );

    % Valor inicial chutado para os parametros
    ai = [1; 1; 1];
    delta = 1e-10;
    answer = newtonsis(ai, f, delta, 1e-12, 1000);

    yr = answer(1) ./ (answer(2) + answer(3) .* xp.^2);

endfunction

function yp = polynomial(x, y, xp)

    n = 3;                      % Grau do polinomio
    c = poly_ajust(x, y, n);    % Coeficientes do polinomio
    yp = canon_poly(xp, c);     % Polinomio avaliado em xp

endfunction