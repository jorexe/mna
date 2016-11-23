function ret = eigen(M)
	n = rows(M);
	ret = zeros(n, 1);
	k = 0;
	i = 1;
	while i < n
		if M(i + 1, i) == 0 && k < i
			ret(k + 1, 1) = M(i, i);
			k = k + 1;
			i = i + 1;
		elseif
			E = roots([1, (-M(i,i)-M(i+1,i+1)), (M(i+1,i+1)*M(i,i)-M(i+1,i)*M(i,i+1))]);
			ret(k+1, 1) = E(1);
			ret(k+2, 1) = E(2);
			k = k + 2;
			i = i + 2;
		endif
	endwhile
	if i == n
		ret(k+1, 1) = M(i,i);
	endif
endfunction
