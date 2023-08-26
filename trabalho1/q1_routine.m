% 1). Faça o armazenamento dos números decimais abaixo em variável float
% (single) e double, nesse link VPL.

% Imprima o respectivo s, e, f, em binário, do armazenamento em float (single) 
% e em double;

% Imprima-os com 20 dígitos decimais significativos, em float e double.

% Imprima o erro estimado de arredondamento percentual gerado:
% 1a). -20.125;
% 1b). -60.06.

function q1_routine(num)

    num_s = single(num);
    num_bin_s = fill_binary(dec2bin(typecast(num_s, 'uint32')), "single");
    num_bin_d = fill_binary(dec2bin(typecast(num, 'uint64')), "double");

    printf("single: %.20f\n", num_s);
    printf("double: %.20f\n", num);
    printf("\n");
    printf("binario (single): %s %s %s\n",  num_bin_s(1),
                                            num_bin_s(2:9),
                                            num_bin_s(10:32));
    printf("%s s %se%s %sf%s\n",
                                        repmat(' ', 1, 17),
                                        repmat(' ', 1, 3),
                                        repmat(' ', 1, 4),
                                        repmat(' ', 1, 11),
                                        repmat(' ', 1, 11));
    printf("\n")
    printf("binario (single): %s %s %s\n",  num_bin_d(1),
                                            num_bin_d(2:12),
                                            num_bin_d(12:64));
    printf("%s s %se%s %sf%s\n",
                                        repmat(' ', 1, 17),
                                        repmat(' ', 1, 5),
                                        repmat(' ', 1, 5),
                                        repmat(' ', 1, 26),
                                        repmat(' ', 1, 25));
    printf("\n");
    printf("Erro percentual de arredondamento: %.2f%%\n", rounding_error(num));

endfunction

function b = fill_binary(bin, f)
    b = bin;
    if f == "single"
        max_len = 32;
    else
        max_len = 64;
    endif

    while length(b) < max_len
        b = ['0', b];
    end
endfunction

function err = rounding_error(num)
    num_f_d = sprintf("%.20f", num);
    num_f_s = sprintf("%.20f", single(num));
    % num_f_d = num;
    % num_f_s = double(single(num));
    err = abs((num_f_s - num_f_d) / num_f_d)*100;
endfunction