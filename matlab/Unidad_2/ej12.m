% 12) Aplíquele a una imagen grayscale la operación binarización de Sauvola.
% Compare los resultados con los obtenidos usando el método de Otsu.

% U(x,y): matriz umbral de binarización
% M(x,y): matriz de valores medios
% S(x,y): matriz de desvíos estándares de px pertenencientes a una...
% ... ventana Wxy centrada alrededor del pixel de coord x,y
% U(x,y) = M(x,y) * [1 + k * (S(x,y)/R - 1)]
% R es el valor máximo del desvío estándar (S)
% k (positivo) controla el valor del umbral en la ventana

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

[m, n] = size(I);

% %% A manopla Sauvola
% Id = im2double(I);
% % Elimino el borde para poder utilizar la vantana de 3x3
% for i=2:(m-1)
%     for j=2:(n-1)
%         W = Id(i-1:i+1, j-1:j+1); % Ventana de 3x3
%         media(i,j) = mean(W(:)); % Media de ventana
%         desvio(i,j) = std(W(:)); % Desvio de ventana
%     end
% end
% 
% M = media(2:end, 2:end);
% S = desvio(2:end, 2:end);
% k = 0.34; % Defino un k
% R = max(desvio(:));
% U = M .* (1 + k * ((S/R) - 1));
% O1 = (Id(2:end-1, 2:end-1) > U);

%% Comando de Sauvola
O2 = sauvola(I, [3 3]);

%% Con el amigo Otsu
th = graythresh(I);
O3 = imbinarize(I, th);

%% Plots
subplot(2,2,1);
imshow(I);
title('Imagen original (grayscale)');

% subplot(2,2,2);
% imshow(O1);
% title('Sauvola a mano');

subplot(2,2,3);
imshow(O2);
title('Sauvola comando');

subplot(2,2,4);
imshow(O3);
title('Con Otsu');