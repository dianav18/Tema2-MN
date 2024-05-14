function y_interp = P_spline(coef, x, x_interp)
    y_interp = zeros(length(x_interp), 1);
    
    n = length(x) - 1;
    
    for j = 1:length(x_interp)
        low = 1;
        high = n;
        while low <= high
            mid = floor((low + high) / 2);
            if x_interp(j) < x(mid)
                high = mid - 1;
            elseif x_interp(j) > x(mid + 1)
                low = mid + 1;
            else
                i = mid;
                break;
            end
        end
        
        dx = x_interp(j) - x(i);
        
        a = coef(4*i-3);
        b = coef(4*i-2);
        c = coef(4*i-1);
        d = coef(4*i);
        
        y_interp(j) = a + b*dx + c*dx^2 + d*dx^3;
    end
end
