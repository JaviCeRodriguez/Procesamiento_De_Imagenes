% Genere ruido Gaussiano, Rayleigh, exponencial, uniforme, sal, 
% pimienta, sal y pimienta y agréguelo a una imagen. 
% Observar cómo se degrada la imagen.
clear all; close all;

[file,dir] = uigetfile('*.bmp;*.jpg;*.png;*.tiff;*.tif');
filename = [dir,file];
info = imfinfo(filename);

switch info.ColorType
    case 'grayscale'
        I = imread(filename);
        
    case 'truecolor'
        I = imread(filename);
        I = rgb2gray(I);
       
    case 'indexed'
        [l,map] = imread(filename); 
        I = ind2gray(l,map);
end

% Imagen a double / Filas y Columnas
I = im2double(I);
[M, N] = size(I);

% Media y desvio
med = 0.5; desv = 0.3;

% Ruido Gaussiano
RGa = med + desv * randn(M,N);
O1 = I + RGa;
O1 = max(min(O1, 1), 0); % Clampeo el rango entre 0 y 1

% Ruido de Rayleigh
RRa = med + sqrt(-desv * log(1-rand(M,N)));
O2 = I + RRa;
O2 = max(min(O2, 1), 0); % Clampeo el rango entre 0 y 1

% Ruido Exponencial
REx = (-1/med)*log(1-rand(M,N));
O3 = I + REx;
O3 = max(min(O3, 1), 0); % Clampeo el rango entre 0 y 1

% Ruido Uniforme
RUn = med +(desv - med)*rand(M,N);
O4 = I + RUn;
O4 = max(min(O4, 1), 0); % Clampeo el rango entre 0 y 1

% Ruido sal(no hay pimienta)
RS = ruido_sal_pimienta(M,N,0,0.02);
O5 = I;
ixs = find(RS == 1);
O5(ixs) = 1;

% Ruido pimienta(no hay sal)
RP = ruido_sal_pimienta(M,N,0.02,0);
O6 = I;
ixp = find(RP == 0);
O6(ixp) = 0;

% Ruido sal y pimienta
RSP = ruido_sal_pimienta(M,N,0.02,0.01);
O7 = I;
ixsp1 = find(RSP == 0);
ixsp2 = find(RSP == 1);
O7(ixsp1) = 0;
O7(ixsp2) = 1;

% Plots
subplot(2,4,1); imshow(I); title('Imagen original');
subplot(2,4,2); imshow(O1); title('Ruido Gaussiano');
subplot(2,4,3); imshow(O2); title('Ruido de Rayleigh');
subplot(2,4,4); imshow(O3); title('Ruido Exponencial');
subplot(2,4,5); imshow(O4); title('Ruido Uniforme');
subplot(2,4,6); imshow(O5); title('Ruido Sal');
subplot(2,4,7); imshow(O6); title('Ruido Pimienta');
subplot(2,4,8); imshow(O7); title('Ruido Sal y Pimienta');