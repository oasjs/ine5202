function y = canon_poly(x, c)
    for i = 1 : length(x)
        y(i) = c(1);
        power = 1;
        for j = 1 : length(c) - 1
            power *= x(i);
            y(i) += c(j + 1) * power;
        end
    end
endfunction