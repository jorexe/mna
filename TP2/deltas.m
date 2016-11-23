%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* c = coeficientes
%
%Parametros de salida:
%* d = deltas
function d = deltas(c)
	d = c;
	d(1) = (2*(c(3)-c(1)) + (c(2)-c(1))) / 10;
	d(2) = (2*(c(4)-c(1)) + (c(3)-c(1))) / 10;
	for t = 3:11
		d(t) = (2*(c(t+2)-c(t-2)) + (c(t+1)-c(t-1))) / 10;
	endfor
	d(12) = (2*(c(13)-c(10)) + (c(13)-c(11))) / 10;
	d(13) = (2*(c(13)-c(11)) + (c(13)-c(12))) / 10;
endfunction