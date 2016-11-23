function ret = hessQRray(H)
	n = rows(H);
	oldH = 0;
	do
		prevH = oldH;
		oldH = H(n,n-1);
		sigma = H(n,n);
		[Q, R] = ourqr(H - sigma * eye(n));
		H = R*Q + sigma * eye(n);
	until(abs(H(n,n-1)) < 0.4 || abs(H(n,n-1) - prevH) < 0.001)
	ret = H;
endfunction