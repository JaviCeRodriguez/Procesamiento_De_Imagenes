% Realce los bordes de una imagen usando la segunda derivada 
% mediante el comando fspecial

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

% Defino filtros
H4 = [0 1 0; 1 -4 1; 0 1 0];
H8 = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Aplico filtro
G1 = conv2(I, H4, 'same');
G2 = conv2(I, H8, 'same');

% Sumo la imagen origina y la filtrada para realzar
O1 = I - G1;
O2 = I + G2;

% Plots
subplot(131); imshow(I); title('Imagen original');
subplot(132); imshow(O1); title('Realce con H4');
subplot(133); imshow(O2); title('Realce con H8');