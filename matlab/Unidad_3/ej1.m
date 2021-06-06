% Abra una imagen y agréguele ruido con el comando imnoise.

[file, path] = uigetfile({'*.tiff';'*.JPG';'*.bmp';'*.jpg'});
dir = strcat(path,file);
info = imfinfo(dir);
I=imread(dir);

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

% Ruidos
IN1 = imnoise(I, 'salt & pepper', 0.05);
IN2 = imnoise(I, 'gaussian', 0, 0.01); 
IN3 = imnoise(I, 'speckle', 0.04);

% Plots
subplot(2,2,1); imshow(I);
title('Imagen original');

subplot(2,2,2); imshow(IN1)
title('Salt & Pepper');

subplot(2,2,3); imshow(IN2)
title('Gaussian');

subplot(2,2,4); imshow(IN3)
title('Speckle');