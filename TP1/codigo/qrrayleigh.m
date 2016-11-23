function ret = qrrayleigh(H)
	n = rows(H);
    itfactor = 1;
    for k = 1:ceil(n*n*itfactor)
        sigma = H(n, n);
        [Q, R] = ourqr(H - sigma * eye(n));
        H = R*Q + sigma * eye(n);
    endfor
	ret = H;
endfunction
