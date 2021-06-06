% Modifique el tamaño del kernel, aplique cada filtro a una imagen y vea 
% que sucede almodificar la dimensión del filtro. Pruebe con kernels impares.

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

I=im2double(I);

% Kernels para pasa bajos (horizonal y vertical)
A = [0 1 0; 3 7 3; 0 1 0];
H1 = A/sum(A);
A = [0 0 0 7 0 0 0;
     0 0 0 7 0 0 0;
     3 3 7 13 7 3 3;
     0 0 0 7 0 0 0;
     0 0 0 7 0 0 0];
H2 = A/sum(A);
A = [0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0;
    3 3 7 7 13 25 13 7 7 3 3;
    0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0;
    0 0 0 0 0 13 0 0 0 0 0];
H3 = A/sum(A);

O1 = conv2(I, H1);
O2 = conv2(I, H2);
O3 = conv2(I, H3);

figure
subplot(2, 2, 1); imshow(I);
title('Imagen original');

subplot(2, 2, 2); imshow(O1);
title('LP con Kernel 3x3');

subplot(2, 2, 3); imshow(O2);
title('LP con Kernel 7x7');

subplot(2, 2, 4); imshow(O3);
title('LP con Kernel 11x11');



% Kernels para pasa bajos (horizonal y vertical)
A = [0 -1 0;
    -1 5 -1; 
    0 -1 0];
H1 = A/sum(A);
A = [0 0 0 -1 0 0 0;
     0 0 0 -1 0 0 0;
     0 0 0 -1 0 0 0;
  -1 -1 -1 13 -1 -1 -1;
     0 0 0 -1 0 0 0;
     0 0 0 -1 0 0 0;
     0 0 0 -1 0 0 0];
H2 = A/sum(A);
A = [0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0;
    -1 -1 -1 -1 -1 21 -1 -1 -1 -1 -1;
    0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0;
    0 0 0 0 0 -1 0 0 0 0 0];
H3 = A/sum(A);

O1 = conv2(I, H1);
O2 = conv2(I, H2);
O3 = conv2(I, H3);

figure
subplot(2, 2, 1); imshow(I);
title('Imagen original');

subplot(2, 2, 2); imshow(O1);
title('LP con Kernel 3x3');

subplot(2, 2, 3); imshow(O2);
title('LP con Kernel 7x7');

subplot(2, 2, 4); imshow(O3);
title('LP con Kernel 11x11');