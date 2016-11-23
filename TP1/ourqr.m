function [q,r] = ourqr(A)
	n = rows(A);
	v = zeros(n,n);
	r = eye(n,n);
	q = eye(n,n);

	for k = 1:n
		v(:,k) = A(:,k);
	endfor

	for k = 1:n
		r(k,k) = norm(v(:,k),2);
		q(:,k) = v(:,k)/r(k,k);
		
		
		for j = (k+1):n
			r(k,j) = q(:,k)'*v(:,j);
			v(:,j) = v(:,j) - r(k,j)*q(:,k);
		endfor
	endfor
endfunction