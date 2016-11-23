%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* elem = un frame determinado de la señal
%
%Parametros de salida:
%* cn = coeficientes cepstrum para elem
function cn = melcep(elem)
	K = rows(elem);
	for n = 1:12
		aux = 0;
		for k = 1:K
			aux = aux + log(elem(k,1)) * cos(n * (k - 0.5) * pi / K);
		endfor
		cn(n) = aux;
	endfor
	cn = cn';
endfunction