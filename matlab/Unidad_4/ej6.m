% Abra una imagen y calcule su DFT 2D (utilice la función fft2). 
% Visualice la imagen y suespectro de magnitud. 

[file, path] = uigetfile({'*.JPG';'*.bmp';'*.jpg';'*.tiff'});
dir = strcat(path,file);
info = imfinfo(dir);
I=imread(dir);

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

% Convierto la imagen a double
I = im2double(I);

% TF de la imagen, centrado y compresión del rango dinámico
IDFT = log(abs(fftshift(fft2(I)) + 1));

% Plots
subplot(1,2,1); imshow(I); title('Imagen original');
subplot(1,2,2); imshow(IDFT, []); title('TF de la imagen');