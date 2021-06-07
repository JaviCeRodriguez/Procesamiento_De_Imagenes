% Idem punto anterior, pero con filtros pasa altos

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

% Muestro la imagen y su transformada
figure(1);
subplot(1,2,1); imshow(I); title('Imagen original');
subplot(1,2,2); imshow(IDFT, []); title('TF de la imagen');

% Malla de coordenadas que forman el dominio frecuencial bidimensional
[M, N] = size(I);
[u, v] = freqspace([M, N], 'meshgrid'); 
D = sqrt(u.^2 + v.^2);

% Frecuencia de corte y Filtro pasa alto ideal
Do = 0.3;
O1 = D >= Do;

% Plots de Filtro PA ideal
figure(2);
colormap(hsv(2));
subplot(1,2,1); imagesc(O1); title('Filtro PA con D >= 0.3');
xlabel('u'); ylabel('v'); axis tight
subplot(1,2,2); mesh(double(O1));
xlabel('u'); ylabel('v'); zlabel('H(u,v)');axis tight

% Filtro pasa alto gaussiano
O2 = 1- exp(-(D.^2)/(2*Do^2));

% Plots de Filtro PB gaussiano
figure(3);
colormap('hsv');
subplot(1,2,1); imagesc(O2); title('Filtro PB con D <= 0.3');
xlabel('u'); ylabel('v'); axis tight
subplot(1,2,2); mesh(double(O2));
xlabel('u'); ylabel('v'); zlabel('H(u,v)');axis tight

% Filtro pasa bajo de Butterworth
n = 4;
O3 = 1 - 1./(1 + (D/Do).^(2*n));

% Plots de Filtro PB de Butterworth
figure(4);
colormap('hsv');
subplot(1,2,1); imagesc(O3); title('Filtro PB con D <= 0.3');
xlabel('u'); ylabel('v'); axis tight
subplot(1,2,2); mesh(double(O3));
xlabel('u'); ylabel('v'); zlabel('H(u,v)');axis tight