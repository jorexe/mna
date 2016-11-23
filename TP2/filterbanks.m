%% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%Parámetros de entrada:
%* nfilt = Cantidad de filtros
%* nfft = Parámetro de la Transformada Rápida de Fourier (iteraciones)
%* samplerate = Frecuencia de muestreo
%* lowfreq = frecuencia mínima de filtro
%
%Parametros de salida:
%* fbank = el banco de filtros
function fbank = filterbanks(nfilt=26,nfft=512,samplerate=8000,lowfreq=300)
    %Primero es necesario pasar todas las frecuencias a unidades Mels, para ello se utilizan las funciones hztoml
    lowmel = hztoml(lowfreq);
    %La maxima frecuencia es la frecuencia de muestreo/2, en este caso es 4000
    highmel = hztoml(samplerate/2);

    %Cantidad de puntos necesarios para la generación del banco
    npoints = nfilt + 2;
    %Como octave no dispone de la funcion para generar un vector de una determinada
    % cantidad de puntos, entre dos numeros. Se debe calcular manualmente el paso
    %Además se debe notar que la
    step = (highmel-lowmel)/(npoints-1);
    melpoints = lowmel:step:highmel;
    
    %Pasa los elementos de cada vector a hz, luego los multiplica por nfft y los divide por la frecuencia de muestreo
    bin = floor((nfft+1)*arrayfun(@mltohz,melpoints)/samplerate);

    fbank = zeros(nfilt,nfft/2+1);

    %Realiza las iteraciones necesarias, aplicando la función partida descripta en el paper.
    for j = 1 : nfilt
        fstart = bin(j);
        fend = bin(j+1);
        for k = fstart:fend
            fbank(j,k) = (k - bin(j))/(bin(j+1)-bin(j));
        end
        fstart = bin(j+1);
        fend = bin(j+2);
        for k = fstart:fend
            fbank(j,k) = (bin(j+2)-k)/(bin(j+2)-bin(j+1));
        end
    end
endfunction

function m = hztoml(a)
	m = 1127 * log(1+a/700.0);
endfunction

function h = mltohz(a)
	h = 700*(10^(a/2595.0)-1);
endfunction
