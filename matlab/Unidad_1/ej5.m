[file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tif'});
dir = strcat(path,file);
image = imread(dir);
imshow(image)