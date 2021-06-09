% A una imagen agréguele ruido periódico y aplíquele diferentes filtros 
% rechaza-banda. Visualice los espectros de magnitud del filtro, 
% de la imagen con ruido y de la imagen filtrada.

clear, clc, close all

% Abro imagen, paso a gray y convierto a double
[file,dir] = uigetfile('*.bmp;*.jpg;*.png;*.tiff;*.tif');
filename = [dir,file];
info = imfinfo(filename);

switch info.ColorType
    case 'grayscale'
        I = imread(filename);
        
    case 'truecolor'
        I = imread(filename);
        I = rgb2gray(I);
       
    case 'indexed'
        [l,map] = imread(filename); 
        I = ind2gray(l,map);
end

I = im2double(I);


% Defino parametros para imnoise3 y defino ruido
C=[0 10;10 2];                  % VARIAR COORD DE IMPULSOS C PARA VER VARIACION DEL FILTRO
[m,n]=size(I);
A=[10 5];
[r,R,S]=imnoise3(m,n,C,A);
%r: patron de ruido espacial sinusoidal (MxN)
%R: DFT2D centrada y cruda
%S: espectro de magnitud, abs(R)

%imagen con ruido: sumo dft2 cruda imagen y dft2 cruda ruido
T = fft2(I); %cruda
TT = T + ifftshift(R); %sumo transf cruda de la img con trnas cruda y descentrada del ruido
In = real(ifft2(TT));

%veo img con ruido y espectro con ruido
%figure
%subplot(1,2,1), imshow(In,[]);title({'Img con ruido','sumado frecuencialmente'}),subplot(1,2,2), imshow(S,[]); title('Espectro del ruido')

% Genero rectangulo de frecuencia (matrices U y V)
[U,V] = dftuv(m,n);

% Obtengo la distancia euclidea de los diferentes px respecto al centro
D = hypot(U,V); %descentrado
D = fftshift(D); %centrado

%MENU
s = menu('Filtros RECHAZA BANDA','1) Rechaza-Banda ideal','2) Rechaza-Banda BTW','3) Rechaza-Banda gaussiano' );

    %Calculo distancia euclidea D0 y ancho w IDEAL, calculado segun el ruido dado por imnoise3
    Dmin = min(hypot(C(1),C(2)), hypot(C(3),C(4))); %minimo radio (interior)
    Dmax = max(hypot(C(1),C(2)), hypot(C(3),C(4))); %maximo radio
    D0 =(Dmax + Dmin)/2;
    w = (Dmax-Dmin) +1; %diferencia entre radios de los impulsos (+1 para asegurar de 'atrapar' el impulso)
        
switch s
    %// FILTROS FRECUENCIALES //
    case 1
        % FILTRO RECHAZA BANDA IDEAL       
        H = idealPass(D,D0,w); %centrado
        filtro='Rechaza-Banda ideal';

    case 2
        % FILTRO RECHAZA BANDA BTW
        n = input('Ingrese el orden del filtro BTW: ');
        w = w+2; %como este atenua le agrego más ancho para asegurar el rechazo
        H = btwPass(D,D0,w,n);
        filtro='Rechaza-Banda BTW';
    
   case 3
        % FILTRO RECHAZA BANDA GAUSS
        w = w+2; %como este atenua le agrego más ancho para asegurar el rechazo
        H = gaussPass(D,D0,w);
        filtro='Rechaza-Banda gaussiano';

end
% Todos los filtros H estan centrados


E = fftshift (log (abs(TT) +1)); %espectro de magnitud de la img con ruido
% a la transformada cruda TT de img_c/_ruido con log +1, abs y fftshift

V = H .*E; %efecto del filtro sobre el espectro (convolucion)

% Ahora quiero antitransformar
P = ifftshift(H) .* TT; %primero hago la convolucion (mult en frec) del filtro
%decentrado y crudo y la transf de la img c/ ruido tamb descentrada y cruda

O = real(ifft2(P)); %teniendo P le calculo la antitransformada y me quedo con lo real

figure
subplot(2,3,1), imshow(I,[]),title('Img original','FontSize', 10)
subplot(2,3,2),imshow(In,[]),title('Img con ruido periodico','FontSize', 10)
subplot(2,3,3), imshow(E,[]),title('Espectro magnitud img ruidosa','FontSize', 10)

subplot(2,3,4), surf(double(H)),title(['Filtro 3D ', filtro], 'Fontsize',10)
subplot(2,3,6),imshow(O),title(['Img filtrada con ',filtro],'FontSize', 10)
subplot(2,3,5) , imshow(V,[]),title('Espectro magnitud img filtrada','Fontsize',10)

function H = idealPass(D,D0,w)
H= (D >= D0-w/2) & (D<=D0+w/2);
end

function H = btwPass(D, DO, w, n)
H = 1./(1+(((D.^2-DO^2)./(D*w)).^2*n));
end

function H = gaussPass(D, DO, w) 
H = exp((-(D .^ 2-DO^2)./(D .* w + eps)).^2);
end