% 7) Obtenga el negativo de una imagen (grayscale y truecolor) y observe
% como se modifica su histograma. Hágalo aplicando la fórmula y con el 
% comando imcomplement.

dirs = {}; % Creo una Cell para almacenar las dirs de las imagenes

for i=1:2
    [file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tiff'});
    dir = strcat(path,file);
    info = imfinfo(dir);
    dirs{i} = imread(dir);
end

n = 8; % bits
subplot(2,3,1);
imshow(dirs{1});
title('Imagen True Color');

subplot(2,3,2);
imshow(imcomplement(dirs{1}));
title('Usando imcomplement');

subplot(2,3,3);
imshow((2^n - 1) - dirs{1});
title('Usando Bmax = (2^n - 1)');

subplot(2,3,4);
imshow(dirs{2});
title('Imagen Grayscale');

subplot(2,3,5);
imshow(imcomplement(dirs{2}));
title('Usando imcomplement');

subplot(2,3,6);
imshow((2^n - 1) - dirs{2});
title('Usando Bmax = (2^n - 1)');