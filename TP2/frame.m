%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* s = señal
%* fs = frecuencia de muestreo de la señal (en hz)
%* fd = duracion de un frame (en s)
%* fi = step entre cada frame (en s)
%
%Parametros de salida:
%* r = muestras de la señal
function r = frame(s, fs, fd, fi)
	N = fd * fs;									% cantidad de muestras
	fstep = fi * fs;								% step entre cada una
	M = floor((length(s) - N) / fstep + 1);
	
	indf = fstep * [ 0:(M-1) ];						% indices por frames      
    inds = [ 1:N ].';								% indices por muestra
    ind = indf(ones(N,1),:) + inds(:,ones(1,M));
	
	r = s(ind);
endfunction