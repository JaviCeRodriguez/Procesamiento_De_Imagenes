% 8) Aplique a una imagen grayscale la transformación necesaria para que su 
% histograma cubra todo el rango dinámico (stretching). Intente hacer lo 
% mismo utilizando el comando imadjust. ¿Cómo haría si la imagen es truecolor?

% Hecho por Camila Fernandez

%MANUALMENTE
% S= (L-1) * (R-rmin) * Rmax-Rmin
%Abro y leo la imagen y la convierto a gray
[file,dir]=uigetfile('*.bmp;*.jpg;*.png;*.tiff;*.tif');
filename=[dir,file];
info=imfinfo(filename);

switch info.ColorType
    case 'grayscale'    %probar con bustos.tif
        I=imread(filename);
        
    case 'truecolor'    %probar niños.jpg que es truecolor
        I=imread(filename);
        I=rgb2gray(I);
       
    case 'indexed'      %probar molinobm.bmp que es indexed
        [l,map]=imread(filename); 
        I=ind2gray(l,map);
end


R=30+I./2;        %modifico un poco la imagen original para trabajar sobre imagen en rango pequeño

rmin=min(R(:));  %fundamental el (:) asi es el minimo de tooooda la matriz,
                %si hago solo min(R) me pueda dar un vector fila o columna
                %minimo
rmax=max(R(:));
Rn=R-rmin;    %anclaje en 0
Ci=rmax-rmin; %contraste inicial

%Sabiendo que S = (R-rmin)*k con k=(L-1)/(rmax-rmin)
%             S =  Rn /Ci
S=im2uint8(double(double(Rn)/double(Ci)));

figure
subplot(2,2,1)
imshow(R),colorbar,title('Imagen con rango pequeño')
subplot(2,2,2)
imshow(S),colorbar,title('Imagen con stretching')

subplot(2,2,3)
imhist(R),colormap,title('Histograma rango pequeño')
subplot(2,2,4)
imhist(S),colormap,title('Histograma con stretching')

%%
%CON IMADJUST
S=imadjust(R,[double(rmin)/255;double(rmax)/255],[0;1]);
figure
subplot(1,2,1);imshow(S);title('Stretching con imadjust')
subplot(1,2,2);imhist(S)

%Ahora con truecolor

if info.ColorType == 'truecolor'
    rgb=imread(filename);
end

C=im2uint8(rgb(:,:,:)./3 +40);        %modifico un poco la imagen ahora rgb

rmin=min(C(:));  %fundamental el (:) asi es el minimo de tooooda la matriz,
                %si hago solo min(R) me pueda dar un vector fila o columna
                %minimo
rmax=max(C(:));
Rn=C-rmin;    %anclaje en 0
Ci=rmax-rmin; %contraste inicial

%Sabiendo que S = (R-rmin)*k con k=(L-1)/(rmax-rmin)
%             S =  Rn /Ci
S=im2uint8(double(double(Rn)/double(Ci)));


figure
subplot(4,2,1)
imshow(C),colorbar,title('Imagen con rango pequeño')
subplot(4,2,2)
imshow(S),colorbar,title('Imagen con stretching')

subplot(4,2,3)
imhist(C(:,:,3)),colormap,title('Hist. canal azul')
subplot(4,2,4)
imhist(S(:,:,3)),colormap,title('Hist. STRETCHING canal azul')

subplot(4,2,5)
imhist(C(:,:,1)),colormap,title('Hist. canal rojo')
subplot(4,2,6)
imhist(S(:,:,1)),colormap,title('Hist. STRETCHING canal rojo')

subplot(4,2,7)
imhist(C(:,:,2)),colormap,title('Hist. canal verde')
subplot(4,2,8)
imhist(S(:,:,2)),colormap,title('Hist. STRETCHING canal verde')