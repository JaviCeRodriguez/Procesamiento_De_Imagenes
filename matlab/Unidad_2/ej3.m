% 3) Utilice el comando grayslice para modificar la resolución en 
% intensidad de una imagen. Observe los resultados al re-cuantizar desde 
% 8 bits a 1 bit.

[file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tif'});
dir = strcat(path,file);
info = imfinfo(dir);
% info.ColorType

switch info.ColorType
    case 'grayscale'
        I=imread(dir);
    case 'truecolor'
        rgb=imread(dir);
        I=rgb2gray(rgb);
    case 'indexed'
        [X,map]=imread(dir);
        I=ind2gray(X,map);
end

figure
subplot(1,2,1)
imshow(I);
colormap(hsv);
title('Colormap HSV ')

subplot(1,2,2)
O=grayslice(I,2);
imshow(O,[]);
colormap(hsv(2));
title('Colormap HSV 2 colores');

figure
for n=1:8
    subplot(2,4,n)
    b=2^n;
    O=grayslice(I,b);
    imshow(O,[]);colormap(gray);
    title(['Img con ' num2str(b) ' colores'])
end