% A las imágenes con ruido generadas en el punto anterior, 
% aplíquele los diferentes filtros de media, de orden y
% adaptativos que se vieron en teoría.
clear all; close all;

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

% Imagen a double / Filas y Columnas
I = im2double(I);

%Elijo ruido segun funcion
[In,R,ruido]=funcion_ruido(I);

%MENU
opcion=menu('Filtros','1) Filtro media aritmetica','2) Filtro media geometrica','3) Filtro media armonica','4) Filtro contra-armonica','5) Filtro de mediana','6) Filtro de maxima','7) Filtro de minima','8) Filtro de punto medio','9) Filtro de alfa media recortado','10) Filtro de moda','11) Filtro adap reducc local de ruido','12) Filtro adaptativo de mediana');
m=3;
n=3;

switch opcion
    %// FILTROS DE MEDIAS //
    case 1
    % FILTRO DE MEDIA ARITMETICA
    H=fspecial('average',[m n]);
    O=conv2(In,H,'same');
    filtro='media aritmetica';

    case 2
    % FILTRO DE MEDIA GEOMETRICA
    O=colfilt(In,[m n],'sliding',@media_geometrica);
    filtro='media geometrica';
    
    case 3
    % FILTRO MEDIA ARMONICA
    O=colfilt(In,[m n],'sliding',@media_armonica);
    filtro='media armonica';
    
    case 4
    % FILTRO MEDIA CONTRA-ARMONICA
    % Q=0 media aritmetica; Q=-1 media armonica
    % Q>0 elimina pimienta; Q<0 elimina sal
    Q=2;
    O=colfilt(In,[m n],'sliding',@media_contra_arm, Q);
    filtro={'media contra-armonica','Q=2 elimina pimienta'};
   
    %// FILTROS DE ORDEN //
    case 5
    % FILTRO DE MEDIANA
    O=medfilt2(I,[m n]);
    filtro='mediana';
    
    case 6
    % FILTRO DE MAXIMA
    O=colfilt(In,[3 3],'sliding',@filtro_max);
    filtro='de maxima';
    
    case 7
    % FILTRO DE MINIMA
    O=colfilt(In,[3 3],'sliding',@filtro_min);
    filtro='de minima';
    
    case 8
    % FILTRO DE PUNTO MEDIO
    O=colfilt(In,[3 3],'sliding',@pto_medio);
    filtro='de punto medio';
    
    case 9
    % FILTRO DE LA MEDIA ALFA-RECORTADO
    d=4;     %si la ventana es 3x3, dmax es 6
    O=colfilt(In,[3 3],'sliding',@media_alfa_recortado,d);
    filtro='de alfa media recortado';
    
    case 10
    % FILTRO MODA
    O=colfilt(In,[3 3],'sliding',@filtro_moda);
    filtro='moda';
    
    %// FILTROS ADAPTATIVOS //
    case 11
    % FILTRO ADAP DE REDUCCION LOCAL DE RUIDO
    var_R=var(R(:));
    var_R=0;
    O = colfilt(In,[m n],'sliding',@adap_reducc_local,var_R);
    filtro='adaptativo de reduccion local de ruido';
    
    case 12
    % FILTRO ADAP DE MEDIANA
    Smax=21;
    O = filtro_mediana_adaptativo(In, Smax);
    filtro='adaptativo de mediana var=21';
    
end

figure
subplot(2,3,1), imshow(I),title('Img original','FontSize', 10)
subplot(2,3,2),imshow(In),title(['Img con ruido ',ruido],'FontSize', 10)
subplot(2,3,3),imshow(O),title(['Img luego de filtro ',filtro],'FontSize', 10)
subplot(2,3,4),imhist(I),title('Histograma original','FontSize', 10)
subplot(2,3,5),imhist(In), title(['Histograma de la img con ruido ',ruido],'FontSize', 10)
subplot(2,3,6),imhist(O),title(['Histograma img luego de filtro ',filtro],'FontSize', 10)