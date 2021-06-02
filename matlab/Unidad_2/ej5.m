% Modifique el contraste de una imagen.
% Observe cómo se cambia su histograma.

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

addContraste = [1 0.5 2];
for i=1:3
   subplot(2,3,i);
   imshow(I * addContraste(i));
   title(['Adjuste de contraste: ', num2str(addContraste(i))]);
   
   subplot(2,3,i+3);
   imhist(I * addContraste(i));
   title(['Histograma con contraste de ', num2str(addContraste(i))]);
end