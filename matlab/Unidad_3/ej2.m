% Abra una imagen y aplíquele diferentes tipos de filtros pasa bajos. 
% Visualice el resultadoy observe qué ocurre cuando se modifican los 
% coeficientes (kernel 3x3)

% Codigo de Camila Fernandez (graciass)

[file, path] = uigetfile({'*.tiff';'*.JPG';'*.bmp';'*.jpg'});
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

I=im2double(I);

%Armo los kernels -> suma de coef=1
%Si la suma no da 1 cambia el brillo!!!
Hp1 = [0 0.5 0;0.5 0.5 0.5;0 0.5 0]/2.5; %exagero para ver bien el difuminado
Hp2 = ones(10)/100;
Hp3 = [1 1 1;1 2 1;1 1 1]/10;

%Convoluciono tipo full
Opb1 = conv2(I,Hp1);
Opb2 = conv2(I,Hp2);
Opb3 = conv2(I,Hp3);


%AHORA CON FSPECIAL
H1 = fspecial('average',[7 7]); %por default 3x3
H2 = fspecial('disk',10); %por default r=5
H3 = fspecial('gaussian',[5 5],5); %por default 3x3 y sigma=0.5

%Convoluciono tipo full
Opb4 = conv2(I,H1);
Opb5 = conv2(I,H2);
Opb6 = conv2(I,H3);

%Veo imagenes
figure
subplot(2,2,1),imshow(I),title('Imagen original')
subplot(2,2,2),imshow(Opb1),title('K 3x3 en cruz (N4)')
subplot(2,2,3),imshow(Opb2),title('K 3x3 todos aportan lo mismo')
subplot(2,2,4),imshow(Opb3),title('K 3x3 el px centro aporta mas')

figure
subplot(2,2,1),imshow(I),title('Imagen original')
subplot(2,2,2),imshow(Opb4),title('Filtro promediador (average)7x7')
subplot(2,2,3),imshow(Opb5),title('Filtro promediador circular (disk)r=10')
subplot(2,2,4),imshow(Opb6),title('Filtro gaussiano (gaussian) 5x5 sigma 5')
