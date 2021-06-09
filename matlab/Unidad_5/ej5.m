% Implemente el filtrado inverso de la misma imagen del punto anterior,
% pero utilizando el filtroWiener (variando iterativamente el valor de K,
% buscando el que genere mejores resultados).

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

% Le agrego ruido gaussiano
noise_mean = 0;
noise_var = 0.0001;
In_n = imnoise(In,'gaussian',noise_mean,noise_var);
%In_n = imnoise(In,'gaussian',0.0002);
% Restauro ahora sabiendo que hay ruido y CONOCIENDO varianza del ruido
NSR = noise_var / var(I(:)); %NSR como cociente de la varianza del ruido y de la img

O = deconvwnr(In_n, PSF,NSR);

figure
subplot(3,3,2), imshow(I), title('Img original')
subplot(3,2,3), imshow(In), title('Img degradada con H (motion)')
subplot(3,2,4), imshow(In_n), title('Img degradada y con ruido')
subplot(3,3,8), imshow(O,[]), title('Img luego del filtrado inverso')

%itero buscando el mejor parametro K
K = 0.001:0.001:0.01;
figure
for i=1:10
    wnr = deconvwnr (In_n, PSF, K(i));
    subplot(2,5,i);imshow(wnr,[]);
    title(['K= ',num2str(K(i))]);
end