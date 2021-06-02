% 11) A una imagen grayscale aplíquele la operación de binarización basada 
% en el método de Otsu (use la función graythresh e im2bw).

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

th = graythresh(I);
BW = imbinarize(I, th);

subplot(1, 2, 1);
imshow(I);

subplot(1, 2, 2);
imshow(BW);