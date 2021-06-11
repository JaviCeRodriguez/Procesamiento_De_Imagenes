% Aplique el operador dilatación (imdilate) y el operador erosión (imerode)
% a una imagenbinaria. Observar los efectos de aplicar cada operador.

clear, clc, close all
% Abro la imagen
[file,dir]=uigetfile('*.bmp;*.jpg;*.png;*.tiff');
filename=[dir,file];
I=imread(filename);
info=imfinfo(filename);

switch info.ColorType
    case 'grayscale'    
        I=imread(filename);        
    case 'truecolor'    
        I=imread(filename);
        I=rgb2gray(I);       
    case 'indexed'      
        [I,map]=imread(filename); 
        I=ind2gray(I,map);
end

% Defino un strel
SE = strel('diamond', 10);

% Imagen original a double, ploteo
I=im2double(I);
subplot(1,3,1); imshow(I); title('Imagen original');

% Dilatación de la imagen
O1 = imdilate(I, SE);
subplot(1,3,2); imshow(O1); title('Imagen dilatada');

% Erosión de la imagen
O2 = imerode(I, SE);
subplot(1,3,3); imshow(O2); title('Imagen erosionada');