function Sn = simpson_integral(n, f, a, b)

    n = abs(n);
    if mod(n,2) == 1
        n += 1;
    end

    h = (b - a) / n;
    x = [a : h : b];
    y = f(x);
    Sn = (h/3)*(y(1) + 4*(sum(y(2 :2: n))) + 2*(sum(y(3 :2: n-1))) + y(n+1));

endfunction