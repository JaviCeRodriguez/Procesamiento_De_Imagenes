% 10) A una imagen en escala de grises aplíquele la operación umbralizado
% (simple y doble).

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
% Umbralizado simple
gthresh = graythresh(I);
Os = zeros(size(I));
for i=1:m
    for j=1:n
        if I(i, j) >= gthresh
            Os(i, j) = 255;
        end
    end
end    

% Umbralizado doble
mthresh = multithresh(I, 2); % Indico que quiero umbralizado doble
Od = zeros(size(I));
for i=1:m
    for j=1:n
        if I(i, j) >= mthresh(1) && I(i, j) <= mthresh(2)
            Od(i, j) = 255;
        end
    end
end 

% Plots
subplot(2, 2, [1 2]);
imshow(I);
title('Imagen original (grayscale)');

subplot(2, 2, 3);
imshow(Os);
title('Imagen con umbral simple');

subplot(2, 2, 4);
imshow(Od);
title('Imagen con umbral doble');