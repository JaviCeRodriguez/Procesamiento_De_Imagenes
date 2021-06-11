% Aplique la transformación hit-or-miss a una imagen binaria, definiendo
% un par deelementos estructurales (o la matriz intervalo) de tal forma
% que permita detectar un patrónespecifico.

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

I = im2double(I);

% Defino elementos estructurales
SE1 = strel('arbitrary', [0,0,0;0,1,1;0,1,0]);
SE2 = strel('arbitrary', [1,1,1;1,0,0;1,0,0]);
% O, tambien de esta forma:
% SE = strel('arbitrary', [-1 1 -1, 1 1 1, -1 1 -1]);

% Aplico Hit-or-Miss
O = bwhitmiss(imbinarize(I), SE1, SE2);
% Forma simplificada
% O = bwhitmiss(I, SE);

% Muestro resultados
subplot(1, 2, 1); imshow(I);
subplot(1, 2, 2); imshow(O);