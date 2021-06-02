% Aplicar transformaciones geométricas y observar los resultados (emplear 
% los comandosfliplr, flipud, imrotate, imcrop)

[file, path] = uigetfile({'*.tiff';'*.JPG';'*.bmp';'*.jpg'});
dir = strcat(path,file);
% info = imfinfo(dir);
I=imread(dir);

% switch info.ColorType
%     case 'grayscale'
%         I=imread(dir);
%     case 'truecolor'
%         rgb=imread(dir);
%         I=rgb2gray(rgb);
%     case 'indexed'
%         [X,map]=imread(dir);
%         I=ind2gray(X,map);
% end

subplot(2,2,1)
imshow(I)

subplot(2,2,2)
imshow(fliplr(I))

subplot(2,2,3)
imshow(imrotate(fliplr(I), 45))

subplot(2,2,4)
imshow(flipud(I))