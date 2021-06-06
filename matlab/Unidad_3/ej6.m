% Aplíquele a una imagen los diferentes filtros vistos previamente 
% (siempre que sea posible,use fspecial).

[file, path] = uigetfile({'*.JPG';'*.bmp';'*.jpg';'*.tiff'});
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

% Convierto la imagen a double
I = im2double(I);

% Filtros
O1 = imfilter(I, fspecial('motion', 100, 15));
O2 = imfilter(I, fspecial('disk', 10));
O3 = imfilter(I, fspecial('gaussian', [50 50], 10));

subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(O1); title('Filtro de movimiento');
subplot(2,2,3); imshow(O2); title('Filtro de disco');
subplot(2,2,4); imshow(O3); title('Filtro Gaussiano');