function C = fnewton_calcula_C(Ci, D, n, a, b, x, y1, y2, y3, fy1, fy2, fy3)

    % Aqui nós temos que verificar qual é o valor calculado para a condição de contorno conhecida
    % Conhecemos: y''(x = 1) = exp(-1) => D, sabendo que y'' = y3
    % O último valor, (n + 1), de y3 corresponde ao ponto x = 1
    % erro_cc = y3(n + 1) - D % Erro = VA - VE

    % f(x) = 0 --> equivale à erro_cc(C) = y3(n + 1) - D
    % A nossa incógnita x agora é o C
    delta_C = 1e-5; i = 0;
    while(abs(delta_C) > 1e-14)
        i = i + 1;
        y2(1) = Ci;
        [x, y1, y2, y3] = f_runge_kutta4_sis3(n, a, b, x, y1, y2, y3, fy1, fy2, fy3);
        erro_c_ci = y1(n + 1) - D;
        y2(1) = Ci + delta_C;
        [x, y1, y2, y3] = f_runge_kutta4_sis3(n, a, b, x, y1, y2, y3, fy1, fy2, fy3);
        erro_cc2  = y1(n + 1) - D;
        derivada_errcc = (erro_cc2 - erro_c_ci)/delta_C;
        delta_C = -erro_c_ci/derivada_errcc;
        C = Ci + delta_C;
        Ci = C;
    end
    iteracoes_newton = i;
end