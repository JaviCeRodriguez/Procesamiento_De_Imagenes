% 6) Realice operaciones aritméticas usando dos imágenes. Las imágenes 
% deben tener la misma dimensión para poder operar. 

dirs = {}; % Creo una Cell para almacenar las dirs de las imagenes

for i=1:2
    [file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tiff'});
    dir = strcat(path,file);
    info = imfinfo(dir);
    dirs{i} = im2double(imread(dir));
end

% Hay que utilizar imagenes del mismo tamaño
subplot(2,3,1);
imshow(dirs{1});
title('Imagen original 1');

subplot(2,3,2);
imshow(dirs{2});
title('Imagen original 2');

subplot(2,3,3);
imshow(dirs{1} + dirs{2});
title('Suma');

subplot(2,3,4);
imshow(dirs{1} - dirs{2});
title('Resta');

subplot(2,3,5);
imshow(dirs{1} .* dirs{2});
title('Producto');

subplot(2,3,6);
imshow(dirs{1} ./ dirs{2});
title('Division');