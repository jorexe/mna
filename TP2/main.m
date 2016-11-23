function main
	% Se leen las voces de entrenamiento y se guardan 16 vectores por voz
	f = readdir(strcat(pwd,'/Voces/Entrenamiento'));
	talkersNum = numel(f);
	for i = 3:talkersNum
		file = char(f(i));
		[s,fs] = wavread(strcat('./Voces/Entrenamiento/', file));
		coef = mfcc(s,fs);
		vecCode(:,:,i-2) = vq(coef, 16);
		names{i-2} = substr(file, 1, -6);
	endfor
	
	talkersNum = talkersNum - 2;
	corrects = 0;
	
	% Se leen las voces de prueba y se las compara con las de entrenamiento
	f = readdir(strcat(pwd,'/Voces/Prueba'));
	recordings = numel(f);
	for i = 3:recordings;
		file = char(f(i));
		[s,fs] = wavread(strcat('./Voces/Prueba/', file));
		coef = mfcc(s,fs);

		talker = substr(file, 1, -6);
		
		for j = 1:talkersNum
			mean = meandist(coef, vecCode(:,:,j));
			if(j == 1)
				min = [1, mean];
			endif
			
			if(mean < min(2))
				min = [j, mean];
			endif
		endfor
		
		printf("La grabacion es de %s y se identifico a %s\n", talker, names{min(1)})
		corrects = corrects + strcmp(names{min(1)}, talker);
	endfor
	
	recordings = recordings - 2;
	eff = (corrects / recordings) * 100
	printf("La eficiencia del sistema es del %f por ciento\n", eff);
endfunction