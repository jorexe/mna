function ret = mainQR(n)
	if n <= 0
		error("La dimensión de la matriz debe ser un número positivo.");
	elseif n == 1
		ret = 1;
	else
		ret = eigen(hessQRray(grcar(n)));
	endif
endfunction