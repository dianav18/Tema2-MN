function coef = vandermonde(x, y)
    n = length(x) - 1;

    V = zeros(n + 1, n + 1);
    for i = 0:n
        V(:, i+1) = x.^i;
    end

    coef = V \ y;
end
