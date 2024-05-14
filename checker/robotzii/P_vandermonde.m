function y_interp = P_vandermonde (coef, x_interp)
	n = length(coef) - 1;
	y_interp = zeros(length(x_interp), 1);
	for i = 1:length(x_interp)
		y_interp(i) = 0;
		for j = 0:n
			y_interp(i) = y_interp(i) + coef(j + 1) * x_interp(i) ^ j;
		end
	end
end
