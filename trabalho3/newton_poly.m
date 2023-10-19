function ya = newton_poly(xp, c, x)

    n = length(c) - 1;
    for k = 1 : length(xp)
        power = 1;
        ya(k) = c(1);
        for i = 1 : n
            power *= (xp(k) - x(i));
            ya(k) += c(i+1) * power;
        end
    end

endfunction