% Abra una imagen y aplíquele diferentes tipos de filtros pasa altos. 
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

%Armo los kernels -> suma de coef=1, px central + y px vecinos -
Hp1=[-1 -1 -1;-1 9 -1; -1 -1 -1];
Hp2=[0 -1 0;-1 5 -1;0 -1 0];
Hp3=[1 -2 1;-2 5 -2;1 -2 1];

%Convoluciono tipo full
Opa1=conv2(I,Hp1);
Opa2=conv2(I,Hp2);
Opa3=conv2(I,Hp3);

%Veo imagenes
subplot(2,3,2),imshow(I),title('Imagen original antes de PASA ALTO')
subplot(2,3,6),imshow(Opa1),title('K 3x3 el px centro aporta mucho mas')
subplot(2,3,4),imshow(Opa2),title('K 3x3 en cruz (N4)')
subplot(2,3,5),imshow(Opa3),title('K 3x3 el px centro aporta mas')