% Genere una imagen binaria compuesta por líneas (de distinta orientación)
% y círculos de color blanco sobre un fondo negro. Aplique una operación 
% morfológica apropiada para separar los círculos de las líneas. 

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
SE1 = strel('line', 40, 0);
SE2 = strel('line', 40, 90);

% Imagen original a double, ploteo
I=im2double(I);
subplot(1,3,1); imshow(I); title('Imagen original');

% Separación de objetos de la imagen (buscar lineasVH)
O1 = imopen(I, SE1);
subplot(1,3,2); imshow(O1); title('Lineas horizontales');

% Separación de objetos de la imagen (buscar lineasVH)
O2 = imopen(I, SE2);
subplot(1,3,3); imshow(O2); title('Lineas verticales');