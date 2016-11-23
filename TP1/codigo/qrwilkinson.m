function ret = qrwilkinson(H)
	n = rows(H);
    m = n;
    precision = 1e-4;
    while m > 1            
        do
            sigma = max(eig([H(n-1,n-1),H(n-1,n);H(n,n-1),H(n,n)]));
            [Q, R] = ourqr(H - sigma * eye(n));
            H = R*Q + sigma * eye(n);
        until(abs(H(m, m-1)) < precision)
        m = m - 1;
    endwhile
	ret = H;
endfunction
