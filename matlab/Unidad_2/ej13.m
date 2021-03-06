% Realice procesamientos que involucren 
% operaciones aritméticas y booleanas.

[file, path] = uigetfile({'*.tiff';'*.JPG';'*.bmp';'*.jpg'});
dir = strcat(path,file);
info = imfinfo(dir);

switch info.ColorType
    case 'grayscale'
        I1=imread(dir);
    case 'truecolor'
        rgb=imread(dir);
        I1=rgb2gray(rgb);
    case 'indexed'
        [X,map]=imread(dir);
        I1=ind2gray(X,map);
end

[file, path] = uigetfile({'*.tiff';'*.JPG';'*.bmp';'*.jpg'});
dir = strcat(path,file);
info = imfinfo(dir);

switch info.ColorType
    case 'grayscale'
        I2=imread(dir);
    case 'truecolor'
        rgb=imread(dir);
        I2=rgb2gray(rgb);
    case 'indexed'
        [X,map]=imread(dir);
        I2=ind2gray(X,map);
end


% Binarize I1
th1 = graythresh(I1);
BW1 = imbinarize(I1, th1);

% Binarize I2
th2 = graythresh(I2);
BW2 = imbinarize(I2, th2);

% Logic Operations
R1 = not(BW2) ;
R2 = and(R1, I1); % Este no funca

% Plots
subplot(2,3,1); imshow(I1);
title('Imagen original 1');

subplot(2,3,2); imshow(I2);
title('Imagen original 2');

subplot(2,3,3); imshow(BW1);
title('Imagen 1 binarizada');

subplot(2,3,4); imshow(BW2);
title('Imagen 2 binarizada');

subplot(2,3,5); imshow(R1);
title('not Imagen 2');

subplot(2,3,6); imshow(R2);
title('(not Imagen 2) or Imagen 1');