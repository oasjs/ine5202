

function raiz = metodo_newton(f, dominio)

    % Localização das raízes iniciais:
    xi = localizacao(f, dominio);

    % Refinamento do valor da raíz inicial xi:
    % Podemos escrever f(x) por série de Taylor, a partir de xi:
    % Qualquer função pode ser escrita como:
    %       f(x) = f(xi) + f'(xi)(x-xi)¹/1! + f''(xi)(x-xi)²/2! + f'''(xi)(x-xi)³/3! + ... = 0
    %       Se xi e x estão próximos, podemos usar uma série aproximada com menos termos
    %       faprox(x) = f(xi) + f'(xi)(x-xi)/1!
    %       faprox(x) != f(x)     |  0 da faprox(x) não é o 0 de f(x)
    %
    %       Δ(x) = - f(xi)/f'(xi)
    %       x    =    xi + Δ(x)     =     xi - f(xi)/f'(xi)

    for indice = 1 : length(xi)
        delta_x = 1e-5;
        repeticoes = 0;
        while abs(delta_x) > 1e-10 && repeticoes < 100

            repeticoes = repeticoes + 1;

            % Derivada numérica baseada na definição do limite, com delta_x
            % tendendo a zero numerico
            derivada_f = (f(xi(indice) + delta_x) - f(xi(indice)))/delta_x;

            delta_x = - f(xi(indice))/derivada_f;

            raiz(indice) = xi(indice) + delta_x;

            xi(indice) = raiz(indice);

        end

        repeticoes;

    end