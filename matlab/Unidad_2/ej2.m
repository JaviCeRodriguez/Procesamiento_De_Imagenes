% 2) Utilice el comando imresize para modificar la resolución espacial
% de una imagen (submuestreo y sobremuestreo).

[file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tif'});
dir = strcat(path,file);
image = imread(dir);

subplot(1, 3, 1);
imshow(image);
title('Original');
axis on;

subplot(1, 3, 2);
image_zi = imresize(image, 1.5);
imshow(image_zi);
title('Sobremuestreo');
axis on;

subplot(1, 3, 3);
image_zo = imresize(image, 0.5);
imshow(image_zo);
title('Submuestreo');
axis on;