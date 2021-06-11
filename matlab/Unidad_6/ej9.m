% Determine la frontera de los objetos en una imagen 
% usando la formula y el comandobwperim.

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

%% Con dilatacion y erosion
% Defino un strel
SE = strel('diamond', 1);

% Erosiono y luego dilato
erode = imerode(I,SE);
O1 = I - erode;

figure
subplot(1,2,1); imshow(I); title('Original');
subplot(1,2,2); imshow(O1); title('Resultado con imerode');

%% Con bwperim
BW = imbinarize(I);
O2 = bwperim(BW);

figure
subplot(1,2,1); imshow(I); title('Original');
subplot(1,2,2); imshow(O2); title('Resultado con bwperim');