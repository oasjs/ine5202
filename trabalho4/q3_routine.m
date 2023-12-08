% 3. Resolva a equação diferencial Ordinária do tipo PVI e determine y(x) no
% domínio [0, pi/2]:
% y'''+y''+y'+(x+1)*y=x*cos(x)
% y(x=0)=1
% y'(x=0)=0
% y''(x=0)=-1
% Escolhendo n intervalos de modo que o erro truncamento máximo seja menor que
% 1e-4.
% Faça um gráfico com a solução obtida e confira se ye(x) = cos(x).

function q3_routine()

    a = 0;
    b = pi/2;
    n = 6;

    x(1) = 0;
    y1(1) = 1;
    y2(1) = 0;
    y3(1) = -1;

    fy1 = @(x, y1, y2, y3) y2;
    fy2 = @(x, y1, y2, y3) y3;
    fy3 = @(x, y1, y2, y3) x*cos(x) - (x+1)*y1 - y2 - y3; 

    [x, y1, y2, y3] = f_runge_kutta4_sis3(n, a, b, x, y1, y2, y3, fy1, fy2, fy3);

    printf("Questão 3:\n");
    num_intervalos = n
    erro = max(abs(y1 - cos(x)))
    printf("y(x=pi/2) = %.20f\n", y1(n+1));
    printf("\n");

    figure("name", "Questão 3");
    plot(x, cos(x), '-k', 'LineWidth', 2, x, y1, '--r', 'LineWidth', 2);
    legend('Runge-Kutta', 'Exato');
    xlabel('x');
    ylabel('y');
    title('PVI: Runge-Kutta 4 Ordem - Questão 3');
    grid on;

endfunction