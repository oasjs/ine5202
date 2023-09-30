% 2). Determine DUAS soluções do sistema de 3 equações não lineares abaixo (tem 
% mais de uma solução), com máxima precisão possível. Teste diferentes valores 
% iniciais, incluindo xi complexos.

% f1(x(1),x(2),x(3))=sin(x(1))*cos(x(2))+x(3)-1.5=0 
% f2(x(1),x(2),x(3))= x(1)^2+x(2)^2+x(3)^2-3.0=0
% f3(x(1),x(2),x(3))= x(1)+x(2)+x(3)-3.1=0

% Determine o resíduo máximo no final.

% Método de Newton matricial
% Usar a matriz jacobiana

function q2_routine()

    % Funcoes nao lineares fornecidas pelo problema
    f{1} = @(x) sin(x(1))   * cos(x(2)) + x(3)      - 1.5;
    f{2} = @(x) x(1)^2      + x(2)^2    + x(3)^2    - 3.0;
    f{3} = @(x) x(1)        + x(2)      + x(3)      - 3.1;

    % Vetor de valores iniciais completamente arbitrario
    printf("Para os seguintes valores iniciais:\n");
    xi = [complex(-1,1); complex(1,1); complex(1,1)]
    printf("\n");

    % Raizes encontradas para xi:
    printf("Raizes encontradas:\n")
    x = newtonsis(xi, f)
    printf("\n");

    % Residuo maximo encontrado para xi:
    printf("Residuo maximo:\n");
    res_x = max(abs([f{1}(x), f{2}(x), f{3}(x)]))
    printf("\n");

    % Testando com valores iniciais diferentes
    printf("Testando com valores iniciais diferentes:\n");
    wi = [complex(-1,1); complex(0.5,1); complex(0.5,1)]
    printf("\n");

    % Raizes encontradas para wi:
    printf("Raizes encontradas:\n")
    w = newtonsis(wi, f)
    printf("\n");

    % Residuo maximo encontrado para wi:
    printf("Residuo maximo:\n");
    res_w = max(abs([f{1}(w); f{2}(w); f{3}(w)]))
    printf("\n");

endfunction