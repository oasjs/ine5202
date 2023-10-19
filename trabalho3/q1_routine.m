% 1). Aproxime f(x)=x*cos(x) com erro EXATO inferior a 1e-2 (teste o erro máximo
% no intervalo  [ 0; +pi/2 ]), através das técnicas abaixo:

% 1a). aproxime por Série de Taylor, expandida a partir do ponto médio do
% intervalo, xi=pi/4. Imprima o grau n, os coeficientes e o erro máximo;

% 1b). aproxime por Interpolação polinomial de Gregory-Newton. Imprima o grau
% n, os coeficientes e o erro máximo;

% 1c). Escreva qual foi a melhor aproximação conseguida, a mais eficiente (de
% menor grau n para o mesmo erro máximo).

% Obs.: Teste o erro máximo em todo o intervalo [ 0; +pi/2 ].


function q1_routine()

    a = 0 ; b = pi/2;       % Extremidades do intervalo
    xi = pi/4;              % Ponto medio do intervalo

    h = (b - a) / 100;      % Tamanho do intervalo
    xp = [a : h : b];       % Pontos do intervalo
    y_exato = xp.*cos(xp);  % Valores exatos

    % 1a)
    taylor_routine(xp, xi, y_exato);

    % 1b)
    newton_routine(a, b, xp, y_exato);


endfunction

function taylor_routine(xp, xi, y_exato)

    f   = @(x) x*cos(x);
    f1  = @(x) cos(x)       - x*sin(x);
    f2  = @(x) -2*sin(x)    - x*cos(x);
    f3  = @(x) x*sin(x)     - 3*cos(x);
    f4  = @(x) 4*sin(x)     + x*cos(x);
    f5  = @(x) 5*cos(x)     - x*sin(x);
    f6  = @(x) -6*sin(x)    - x*cos(x);
    f7  = @(x) -7*cos(x)    + x*sin(x);

    c = [f(xi) / factorial(0),
        f1(xi) / factorial(1),
        f2(xi) / factorial(2),
        f3(xi) / factorial(3),
        f4(xi) / factorial(4)];

    disp("Serie de Taylor")
    disp("Grau do polinomio:")
    grau = length(c) - 1

    disp("Coeficientes:")
    disp(c)

    y_taylor = taylor_poly(xp, c, xi);

    disp("Erro maximo:")
    max_err = max(abs(y_exato - y_taylor))

endfunction

function newton_routine(a, b, xp, y_exato)

    h = (b - a) / 4;        % Tamanho do intervalo

    % x contendo 4 pontos equidistantes no intervalo [0, pi/2]
    x = [a : h : b];

    % y contendo os valores de f(x) nos pontos de x
    y = x.*cos(x);

    disp("Interpolacao de Gregory-Newton")
    disp("Grau do polinomio:")
    c = newton_coef(x, y);
    grau = length(c) - 1

    disp("Coeficientes:")
    disp(c)

    y_newton = newton_poly(xp, c, x);

    disp("Erro maximo:")
    max_err = max(abs(y_exato - y_newton))

    % plot(xp, y_newton, 'b');
    % while true
    % endwhile

endfunction