function coef = spline_c2(x, y)
    n = length(x) - 1;
    A = zeros(4*n, 4*n);
    b = zeros(4*n, 1);

    for i = 1:n
        xi = x(i);
        xi1 = x(i+1);
        A(2*i-1, 4*i-3:4*i) = [1, (xi-xi), (xi-xi)^2, (xi-xi)^3];
        b(2*i-1) = y(i);
        A(2*i, 4*i-3:4*i) = [1, (xi1-xi), (xi1-xi)^2, (xi1-xi)^3];
        b(2*i) = y(i+1);
    end

    A(2*n+1, 1:4) = [0, 0, 2, 0]; % s0''(x0) = 0
    A(2*n+2, end-3:end) = [0, 0, 2, 6*(x(end)-x(end-1))]; % s_n-1''(x_n) = 0

    for i = 1:n-1
        xi1 = x(i+1);
        A(2*n+2+i, 4*i-3:4*(i+1)) = [0, 1, 2*(xi1-x(i)), 3*(xi1-x(i))^2, 0, -1, 0, 0];
        A(3*n+1+i, 4*i-3:4*(i+1)) = [0, 0, 2, 6*(xi1-x(i)), 0, 0, -2, 0];
    end

    coef = A \ b;
end
