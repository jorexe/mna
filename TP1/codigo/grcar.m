function ret = grcar(n)
	m = zeros(n, n);
	for i = 1:n
		for j = i:min(i + 3, n)
			m(i,j) = 1;
		endfor
		if i > 1
			m(i, i-1) = -1;
		endif
	endfor
	ret = m;
endfunction