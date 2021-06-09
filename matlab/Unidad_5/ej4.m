% Degrade una imagen aplicándole el filtro ‘motion’ con la función 
% fspecial. Implemente un filtrado inverso. Visualice los resultados
% del filtrado comparando con la imagen original.

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
I=im2double(I);

% Degrado la imagen con motion
PSF = fspecial('motion',40,45); %para imagen niños.jpg u otra mas grande cambiar a 40,45
% In = conv2(I,double(PSF),'same'); %otra manera de degradar
In = imfilter(I,PSF,'conv', 'circular'); 

% Restauro asumiendo que no hay ruido -> NSR =0
O = deconvwnr(In, PSF, 0);

figure
subplot(1,3,1), imshow(I), title('Img original')
subplot(1,3,2), imshow(In), title('Img degradada con H (motion)')
subplot(1,3,3), imshow(O), title('Img luego del filtrado inverso')