% 1). Determine todas as raízes das equações, os respectivos resíduos e escreva
% a forma fatorada (arredonde as raízes no final):

% 1.a). sin(x)^3 * cos(x)^3+0.1=0, subdomínio=[-6, +6]
% 1.b). x^4 - 2*i x^3 - 1.5 x^2 + (0.5*i) x + 0.0625 = 0
% 1.c). x^8 - 11.3 x^7 + 50.83 x^6 - 114.581 x^5 + 132.9985 x^4 -
%                   72.57875 x^3 + 14.865625 x^2 - 1.2734375 x + 0.0390625 = 0
% 1.d). x^8 - 1.3 x^7 + 0.83 x^6 - 0.681 x^5 + 0.2285 x^4 - 0.09675 x^3 +
%                                   0.021125 x^2 - 0.0019375 x + 0.0000625 = 0

function q1_routine()

    printf("1. a)\n\n");
    f_a = @(x) (sin(x).^3 .* cos(x).^3 + 0.1);
    a_domain = [-6, 6];
    raizes_a = metodo_newton(f_a, a_domain)
    printf("\n");

    printf("1. b)\n\n");
    b = [1, -2, -1.5, 0.5i, 0.0625];
    [raizes_b, multiplicidade_b] = roots_aula(b)
    printf("Forma fatorada de b: ");
    for i = 1:length(raizes_b)
        printf("(x - %f + %fi)^%d ", real(raizes_b(i)), imag(raizes_b(i)), multiplicidade_b(i));
    endfor
    printf("\n\n\n");

    printf("1. c)\n\n");
    c = [1, -11.3, 50.83, -114.581, 132.9985, -72.57875, 14.865625, -1.2734375, 0.0390625];
    [raizes_c, multiplicidade_c] = roots_aula(c)
    printf("Forma fatorada de c: ");
    for i = 1:length(raizes_c)
        printf("(x - %f)^%d ", raizes_c(i), multiplicidade_c(i));
    endfor
    printf("\n\n\n");

    printf("1. d)\n\n");
    d = [1, -1.3, 0.83, -0.681, 0.2285, -0.09675, 0.021125, -0.0019375, 0.0000625];
    [raizes_d, multiplicidade_d] = roots_aula(d)
    printf("Forma fatorada de d: ");
    for i = 1:length(raizes_d)
        printf("(x - %f + %fi)^%d ",    real(raizes_d(i)),
                                        imag(raizes_d(i)),
                                        multiplicidade_d(i));
    endfor
    printf("\n\n\n");

endfunction