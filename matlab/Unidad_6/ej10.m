% Seleccione una imagen binaria que tenga objetos con agujeros y 
% aplíquele el comandoimfill para rellenarlos. Pruebe también el comando 
% imclearborder para eliminar objetostocando los bordes de la imagen.

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

% Relleno agujeros
O1 = imfill(I, 'holes');

% Limpio bordes
O2 = imclearborder(O1);

% Plots
subplot(1,3,1); imshow(I); title('Imagen original');
subplot(1,3,2); imshow(O1); title('Relleno agujeros');
subplot(1,3,3); imshow(O2); title('Elimino objetos que toquen bordes');