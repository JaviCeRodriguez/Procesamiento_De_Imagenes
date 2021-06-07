% Abra una imagen y aplíquele los diferentes filtros generados.
% Presente la imagen original ylas imágenes procesadas, 
% con sus respectivos espectros de magnitud.

% Hecho por Camila Fernandez

% Abro imagen, paso a gray y convierto a double
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
I=im2double(I); %entre 0 y 1

% Calculo transformada de Fourier de la imagen
tf=fft2(I); fti=fftshift(fft2(I)); tfim=(log(abs(fti)+1));

% Defino la malla de coordenadas que forman el dominio frecuencial bidim
[M N]=size(tfim);      %Ahora quiero M y N del tamaño de la imagen
[U,V]=freqspace([M,N],'meshgrid');     %este comando es como meshgrid pero para frecuencial
D=sqrt(U.^2+V.^2); %distancia euclidea
D0=0.3;

% Defino filtro IDEAL
HPB_ideal=D<=D0; HPA_ideal=D>=D0;

% Defino filtro PB GAUSS
HPB_gauss=exp(-(D.^2)/(2*D0^2)); HPA_gauss=1-HPB_gauss;

% Defino filtro PB BUTTERWORTH
n=3; HPB_btw=(1./ (1+(D/D0).^(2*n))); HPA_btw=1-HPB_btw;

% Imagen filtrada es TF_I .* TF_H

% Para graficar ESPECTRO: producto en el dominio frecuencial del 
% espectro del filtro y de la imagen. Ambas centradas
A1=HPB_ideal .* tfim;
A2=HPB_gauss .* tfim;
A3=HPB_btw .* tfim;

A4=HPA_ideal .* tfim;
A5=HPA_gauss .* tfim;
A6=HPA_btw .* tfim;
% Para graficar IMAGEN: Producto en el dominio frecuencial del espectro 
% DESCENTRADO del filtro y DESCENTRADO de la imagen "crudo"
% Imagen filtrada es I= TF_I .* TF_H (ambas en crudo) y luego 
% antitransformo para obtener i en dominio espacial.

B1=ifftshift(HPB_ideal) .* tf;
B2=ifftshift(HPB_gauss) .* tf;
B3=ifftshift(HPB_btw) .* tf;

B4=ifftshift(HPA_ideal) .* tf;
B5=ifftshift(HPA_gauss) .* tf;
B6=ifftshift(HPA_btw) .* tf;
% cuando antitransformo me quedo solo con lo real
O1=real(ifft2(B1));O2=real(ifft2(B2));O3=real(ifft2(B3));
O4=real(ifft2(B4));O5=real(ifft2(B5));O6=real(ifft2(B6));

%GRAFICOS PASA BAJO
figure(1)
%IM ORIGINAL
subplot(3,4,1);imshow(I);title('Imagen original','FontSize', 10)
subplot(3,4,5);imshow(tfim,[]);title('Espectro de magnitud original','FontSize', 10)
%IM CON PB IDEAL
subplot(3,4,2);imshow(O1,[]);title(['Imagen filtrada con ideal D=',num2str(D0)],'FontSize', 10)
subplot(3,4,6);imshow(A1,[]);title({'Espectro de magnitud','para filtro PB ideal'},'FontSize', 10)
subplot(3,4,10);mesh(double(HPB_ideal));title('Filtro PB ideal'); axis tight
%IM CON PB GAUSS
subplot(3,4,3);imshow(O2,[]);title(['Imagen filtrada con PB gauss D=',num2str(D0)],'FontSize', 10)
subplot(3,4,7);imshow(A2,[]);title({'Espectro de magnitud','para filtro PB gauss'},'FontSize', 10)
subplot(3,4,11);mesh(double(HPB_gauss));title('Filtro PB gaussiano'); axis tight
%IM CON PB BTW
subplot(3,4,4);imshow(O3,[]);title({['Imagen filtrada con BTW orden ',num2str(n),' y D0=',num2str(D0)]},'FontSize', 10)
subplot(3,4,8);imshow(A3,[]);title({'Espectro de magnitud','para filtro PB btw'},'FontSize', 10)
subplot(3,4,12);mesh(double(HPB_btw));title('Filtro PB btw'); axis tight

%GRAFICO PASA ALTO
figure(2)
%IM ORIGINAL
subplot(3,4,1);imshow(I);title('Imagen original','FontSize', 10)
subplot(3,4,5);imshow(tfim,[]);title('Espectro de magnitud original','FontSize', 10)
%IM CON PB IDEAL
subplot(3,4,2);imshow(O4,[]);title(['Imagen filtrada con ideal D=',num2str(D0)],'FontSize', 10)
subplot(3,4,6);imshow(A4,[]);title({'Espectro de magnitud','para filtro PA ideal'},'FontSize', 10)
subplot(3,4,10);mesh(double(HPA_ideal));title('Filtro PA ideal'); axis tight
%IM CON PB GAUSS
subplot(3,4,3);imshow(O5,[]);title(['Imagen filtrada con PA gauss D=',num2str(D0)],'FontSize', 10)
subplot(3,4,7);imshow(A5,[]);title({'Espectro de magnitud','para filtro PA gauss'},'FontSize', 10)
subplot(3,4,11);mesh(double(HPA_gauss));title('Filtro PA gaussiano'); axis tight
%IM CON PB BTW
subplot(3,4,4);imshow(O6,[]);title({['Imagen filtrada con BTW orden ',num2str(n),' y D0=',num2str(D0)]},'FontSize', 10)
subplot(3,4,8);imshow(A6,[]);title({'Espectro de magnitud','para filtro PA btw'},'FontSize', 10)
subplot(3,4,12);mesh(double(HPA_btw));title('Filtro PA btw'); axis tight