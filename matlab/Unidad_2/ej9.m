% 9) Aplique a una imagen grayscale la transformación apropiada para que su
% histograma se comprima a un cierto rango definido por el usuario (shrinking).

[file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tif'});
dir = strcat(path,file);
info = imfinfo(dir);

switch info.ColorType
    case 'grayscale'
        I=imread(dir);
    case 'truecolor'
        rgb=imread(dir);
        I=rgb2gray(rgb);
    case 'indexed'
        [X,map]=imread(dir);
        I=ind2gray(X,map);
end

I_min = min(I(:)); % Valor minimo de la imagen
I_max = max(I(:)); % Valor maxomo de la imagen
O_min = I_min/2; % Valor minimo final deseado
O_max = I_max/2; % Valor maximo final deseado

LH_in = [double(I_min)/255, double(I_max)/255]; % Low & High Input
LH_out = [double(O_min)/255, double(O_max)/255]; % Low & High Output
O = imadjust(I, LH_in, LH_out);

subplot(2, 2, 1);
imshow(I);
title('Imagen original');

subplot(2, 2, 2);
imshow(O);
title('Imagen con Shrinking');

subplot(2, 2, 3);
imhist(I);
title('Histograma original');

subplot(2, 2, 4);
imhist(O);
title('Histograma con Shrinking');