% 3). Use a Interpolação Spline Cúbica (quadrática nos extremos) para
% representar graficamente uma função 1/x² entre [1; 2] com 2 Splines, ou mais;

function q3_routine()

    a = 1; b = 2;           % Extremos do intervalo
    h = (b - a) / 4;        % Tamanho do intervalo (numero de splines)
    x = [a : h : b];        % Valores de x
    y = 1 ./ (x .^ 2);      % Valores de y
    n = length(x) - 1;      % Numero de splines

    % Calcula os coeficientes das splines
    [a, b, c, d] = fSplineb(n, x, y);

    % 4 sub-divisões para cada sub-intervalo entre x(i) e x(i+1) para plotagem
    np = 4*n;
    xpp = []; ypp = [];

    for i = 1 : n
        xp = x(i) : (x(i+1)-x(i))/np : x(i+1);
        for k=1:np+1
            yp(k) = a(i)*(xp(k)-x(i))*(xp(k)-x(i))*(xp(k)-x(i));
            yp(k) = yp(k) + b(i)*(xp(k)-x(i))*(xp(k)-x(i));
            yp(k) = yp(k) + c(i)*(xp(k)-x(i))+d(i);
        end
        xpp = [xpp xp]; ypp = [ypp yp];
    end

    figure(3);
    plot(x,y,'*k','markersize',20,xpp,ypp,'-m','LineWidth',5);
    grid on;

endfunction