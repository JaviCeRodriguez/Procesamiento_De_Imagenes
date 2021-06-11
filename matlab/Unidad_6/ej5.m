% Abra una imagen compuesta por un texto (caracteres en blanco o en tonos
% de gris y fondoen negro). Seleccione un carácter dentro de la imagen.
% Determine el SE y la operaciónmorfológica a aplicar para identificar ese
% carácter y contar su ocurrencia en el texto

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

% Muestro imagen en un figure
figure; imshow(I);

% Zoom, pausa y obtengo ROI
zoom; pause;
[x,y] = ginput(2);
x = round(x); y = round(y);

% Calculo ancho y largo
ancho = abs(x(2)-x(1));
alto = abs(y(2)-y(1));
hold on;
rectangle('Position',[min(x), min(y), ancho, alto]);

% Hago el complemento de la imagen y genero imagen del ROI
I = imcomplement(I);
A = imcrop(I,[min(x), min(y), ancho, alto]);

% Hago una matriz binaria X teniendo de referencia a A
X = ones(size(A));
ix = find(A == 0);
X(ix)= 0;

% Armo y muestro SE arbitario con X y A
SE = strel('arbitrary', X, A);
SE.Neighborhood

% Realizo apertura
O = imopen(I, SE);
% O = imbinarize(O);

% Muestro resultados
figure
subplot(1,2,1); imshow(I);
subplot(1,2,2); imshow(O);


[L,n]=bwlabel(O);
A=label2rgb(L);
figure
subplot(2,2,[1 2]);imshow(I);title('Imagen original');
subplot(2,2,3);imshow(L); title('Caracter identificado');
subplot(2,2,4);imshow(A);title('Matriz de labels A');