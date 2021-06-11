% Aplique diferentes procesamientos morfológicos a una imagen binaria,
% utilizando elcomando bwmorph.

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

I = imbinarize(I);

O = bwmorph(I, 'skel', 10);

subplot(1,2,1); imshow(I); title('Imagen binarizada');
subplot(1,2,2); imshow(O); title('Aplico operación "skel"');