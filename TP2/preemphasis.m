%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* signal = señal a realizar el preénfasis
%
%Parametros de salida:
%* res = la señal filtrada con el incremento de las frecuencias
function res = preemphasis(signal, coef)
	res(1) = signal(1);
	for i = 2:length(signal)
		res(i) = signal(i) - coef * signal(i-1);
	endfor
endfunction