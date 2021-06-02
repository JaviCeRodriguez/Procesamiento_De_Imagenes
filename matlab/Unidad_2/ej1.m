% 1) Calcule un perfil vertical y otro horizontal usando imágenes 
% grayscale y truecolor. Utilice los comandos line e improfile. 

[file, path] = uigetfile({'*.jpg';'*.JPG';'*.bmp';'*.tif'});
dir = strcat(path,file);
image = imread(dir);

figure(1);
imshow(image)
x = [50 800];
y = [30 300];
L = line(x, y);

figure(2);
improfile(image, x, y)