% Calcular los puntos extremos de una imagen binaria (previamente 
% esqueletonizada) usando la transformación hit-or-miss con LUT.

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
%         I=rgb2gray(I);       
    case 'indexed'      
        [I,map]=imread(filename); 
%         I=ind2gray(I,map);
end

Ie=bwmorph(I,'skel',inf);

figure
subplot(1,2,1);imshow(I);title('Imagen original');
subplot(1,2,2);imshow(Ie);title('Imagen esquelitizada');

lut = makelut(@endpoint_fcn,3);
O = applylut(Ie,lut);

figure
subplot(1,3,1); imshow(I);title('Imagen original');
subplot(1,3,2); imshow(Ie);title('Imagen esqueletizada');
subplot(1,3,3); imshow(O);title('Puntos extremos');