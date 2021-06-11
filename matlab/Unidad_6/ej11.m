% Genere una imagen con fondo negro y círculos blancos de diferentes 
% tamaños. Aplique elcomando bwlabel para identificar los diferentes 
% objetos. Calcule el área y las coordenadasdel centroide de cada figura 
% geométrica empleando el comando regionprops. Genere unhistograma con la
% información de cuantos círculos de cada tamaño hay en la imagen.

clear, clc, close all
% Abro la imagen
[file,dir]=uigetfile('*.bmp;*.jpg;*.png;*.tiff;*.tif');
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

% Cuento
[L,n] = bwlabel(I,4);

D = regionprops(L,'Area','Centroid');
Area = [D.Area];
NR = numel(Area);
H = histogram(Area,n);
xlabel('Area'); ylabel('Cantidad de objetos');
title('Histograma'); ylim([0,10]);

A = label2rgb(L);

figure
subplot(1,2,1);imshow(I);title('Imagen original');
subplot(1,2,2);imshow(A);title('Labels');