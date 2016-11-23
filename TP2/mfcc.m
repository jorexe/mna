%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* sig = señal a calcular los mfcc
%* fs = frecuencia de muestreo de sig (en hz)
%
%Parametros de salida:
%* r = coeficientes mfcc de la señal s
function r = mfcc(sig, fs)
	% Se realiza el preénfasis
	coef = 0.97;
	sig = preemphasis(sig, coef);
	
	% Se fragmenta la señal
	frames = frame(sig, fs, 0.02, 0.01);
	
	% Se aplica la funcion ventana de Hamming
	samples = size(frames)(1);
	framesNum = size(frames)(2);
	h = hamming(samples);
	
	hframes = frames.*h;
	
	% Se calcula la transformada rápida de Fourier a cada muestra
	% N = 2^nextpow2(samples);
	for i = 1:framesNum
		fftframes(:,i) = fft(hframes(:, i));
	endfor
	
	% Se multiplica por los filterbanks
	
	for i = 1:framesNum
		pframes(:,i) = (abs(fftframes(:,i)).^2);
	endfor
	
	fbanks = filterbanks(26, samples, fs, 300);

	half = samples/2 + 1;
	pr = fbanks * pframes(1:half, :);
	
	% Se obtienen los primeros 12 coeficientes cepstrum
	for i = 1:framesNum
		cn(:,i) = melcep(pr(:,i));
	endfor

	cn;
	
	% Se obtiene el 13º coeficiente
	for i = 1:framesNum
		cn(13,i) = logenergy(frames(:,i));
	endfor
	
	% Se calculan los coeficientes delta
	for i = 1:framesNum
		d = deltas(cn(:,i));
		for j = 1:13
			cn(j+13,i) = d(j);
		endfor
	endfor
	
	r = cn;
endfunction