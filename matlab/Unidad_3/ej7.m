% Abra una imagen y agréguele ruido sal y pimienta. Aplíquele dos filtros, 
% uno pasa bajos yotro no lineal (mediana). Observe como trabaja cada 
% filtro. Modifique la dimensión del filtromediana y la densidad de puntos 
% con ruido

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

% Aplico ruido de sal y pimienta
N = imnoise(I, 'salt & pepper', 0.02);

% Aplico filtro de mediana
O1 = medfilt2(N);

% Aplico filtro pasa bajos
H = [1 1 1;1 2 1;1 1 1]/10;
O2 = conv2(N, H);

% Plots
subplot(2,2,1); imshow(I); title('Original');
subplot(2,2,2); imshow(N); title('Ruido Salt & Pepper');
subplot(2,2,3); imshow(O1); title('Filtro de mediana');
subplot(2,2,4); imshow(O2); title('Filtro pasa bajos');