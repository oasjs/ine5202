% 4. Resolva a equação diferencial Ordinária do tipo PVC e determine y(x) no
% domínio [0, pi/2]:
% y'''+y''+y'+(x+1)*y=x*cos(x)
% y(x=0)=1
% y''(x=0)=-1
% y(x=pi/2)=0
% Escolhendo n intervalos de modo que o erro truncamento máximo seja menor que
% 1e-4.
% Faça um gráfico com a solução obtida e confira se y(x=pi/2)=0 foi atingido.

function q4_routine()

    a = 0;
    b = pi/2;
    n = 5;
    h = (b-a)/n;

    x(1) = a;
    y1(1) = 1;
    y2(1) = 1;  # Chutado
    y3(1) = -1;
    y1(n+1) = 0;

    fy1 = @(x, y1, y2, y3) y2;
    fy2 = @(x, y1, y2, y3) y3;
    fy3 = @(x, y1, y2, y3) -y3 - y2 - (x+1)*y1 + x*cos(x);

    y2(1) = fnewton_calcula_C(
        y2(1), y1(n), n, a, b, x, y1, y2, y3, fy1, fy2, fy3);

    [x, y1, y2, y3] = f_runge_kutta4_sis3(
        n, a, b, x, y1, y2, y3, fy1, fy2, fy3);

    printf("Questão 4:\n");
    num_intervalos = n
    erro = max(abs(y1 - cos(x)))
    printf("y(x=pi/2) = %.20f\n", y1(n+1));

    figure("name", "Questão 4")
    plot(x, cos(x), '-k', 'LineWidth', 2, x, y1, '--r', 'LineWidth', 2);
    legend('Runge-Kutta', 'Exato');
    xlabel('x');
    ylabel('y');
    title('PVC: Runge-Kutta de 4ª ordem - Questão 4');
    grid on;

endfunction