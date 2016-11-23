%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Par�metros de entrada:
%* samples = un frame determinado de la se�al
%
%Parametros de salida:
%* E = el 13� coeficiente mfcc
function E = logenergy(samples)
	s = 0;
	for n = 1:160
		s = s + samples(n) ** 2;
	endfor
	E = log10(s);
endfunction