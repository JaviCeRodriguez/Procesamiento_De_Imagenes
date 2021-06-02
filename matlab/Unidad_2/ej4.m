% 4) Modifique el brillo de una imagen y observe cómo cambia su histograma
% (imhist). Utilice imágenes en escala de grises

[file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tif'});
dir = strcat(path,file);
info = imfinfo(dir);

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

addBrillo = [0 50 -50];
for i=1:3
   subplot(2,3,i);
   imshow(I + addBrillo(i));
   title(['Adjuste de brillo: ', num2str(addBrillo(i))]);
   
   subplot(2,3,i+3);
   imhist(I + addBrillo(i));
   title(['Histograma con brillo de ', num2str(addBrillo(i))]);
end