function ret = mainQR(n)
	t0 = time();
	if n <= 0
		error("La dimensión de la matriz debe ser un número positivo.");
	elseif n == 1
		ret = 1;
	else
		ret = eigen(qrrayleigh(grcar(n)));
	endif
	printf("Calculado en %f segundos.\n", time() - t0);
endfunction
