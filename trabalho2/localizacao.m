function xi = localizacao(f, dominio)

    % (deve ser uma valor grande p gerar uma busca com h pequeno o suficiente)
    numero_de_intervalos = 1000; 

    %   Final do domínio - início do domínio / 1000
    h = (dominio(2) - dominio(1)) / numero_de_intervalos;
    x = dominio(1) : h : dominio(2);
    y = f(x);

    % 2). Como podemos eliminar falsos valores iniciais de raízes 
    % que estejam em pontos de descontinuidades?

    % verifica onde em x ocorrem trocas de sinal em y (curva corta o eixo x)
    indice_raiz = 0;
    limite= 0.1 / h;

    for i = 1:length(x) - 1
%       if (y(i) * y(i + 1)) <= 0 && abs(y(i)) + abs(y(i+1)) < 1      % Se a soma      dos dois módulos for pequena
%       if (y(i) * y(i + 1)) <= 0 && abs(y(i)  -     y(i+1)) < 1      % Se o modulo da subtração (soma interna) for pequena
        if (y(i) * y(i + 1)) <= 0 && abs(y(i)  -     y(i+1)) < limite % Se o modulo da subtração (soma interna) for pequena ()
            indice_raiz=indice_raiz + 1;
            xi(indice_raiz) = (x(i) + x(i + 1)) * 0.5;
        end
    end
    end