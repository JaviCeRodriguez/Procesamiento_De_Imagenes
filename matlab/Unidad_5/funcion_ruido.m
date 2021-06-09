function [V,R,tipo_de_ruido] = funcion_ruido(I)
[M,N]=size(I);

%Me armo un menú
opcion=menu('Generador de ruido','1) Gaussiano','2) Rayleigh','3) Exponencial','4) Uniforme','5) Impulsivo','6) Pimienta','7) Sal');
switch opcion
    case 1 %Ruido gaussiano
        %Le pido al usuario media y desvio
        a=input('Ingrese media entre 0 y 1: '); 
        b=input('Ingrese desvio estandar: '); 
        R=a + b*randn(M,N);
        In=I+R; %Le agrego ruido a la imagen
        In=max(min(In,1),0);%clampeo el rango entre 0 y 1
        ruido='Gaussiano';%Para plotear despues
    
    case 2 %Ruido rayleigh
        %Le pido al usuario media y desvio
        a=input('Ingrese media: ');                %por ej 0.5
        b=input('Ingrese desvio estandar >0: ');    %por ej 0.01
        R=a + sqrt(-b*log(1-rand(M,N)));   
        In=I+R; %agrego ruido a la imagen
        In=max(min(In,1),0);    %clampeo el rango entre 0 y 1
        ruido='Rayleigh';
       
    case 3 %Ruido exponencial
        %Le pido al usuario 'modulador' a
        a=input('Ingrese modulador a>0: '); %probar 5
        if a<=0
        error('El parametro "a" debe ser positivo: '); 
        end
        R=(-1/a)*log(1-rand(M,N));
        In=I+R; %agrego ruido a la imagen
        In=max(min(In,1),0);
        ruido='Exponencial';
        
    case 4 %Ruido uniforme
        %Le pido al usuario b y a para ancho del pulso
        a=input('Ingrese a: ');             %probar 0.5
        b=input('Ingrese b (b>a): ');       %probar 0.8
        R=a +(b-a)*rand(M,N);   
        In=I+R; %agrego ruido a la imagen
        In=max(min(In,1),0);    %clampeo el rango entre 0 y 1
        ruido='Uniforme';
    
    case 5 %Ruido impulsivo
        %Le pido al usuario la probabilidad de sal y de pimienta
        Pa=input('Ingrese probabilidad de sal: ');  %probar 0.01
        Pb=input('Ingrese probabilidad de pimienta: ');  %probar 0.02
        R=ruido_sal_pimienta(M,N,Pa,Pb);
        In=I; %copio la img
        ix1=find(R==0);In(ix1)=0; %busco coord con pimienta y en esas coord de la img px=0
        ix2=find(R==1);In(ix2)=1; %busco coord con sal y en esas coord de la img px=1
        ruido='Impulsivo';
       
    case 6 %Ruido pimienta
        a=input('Ingrese probabilidad de pimienta: ');
        R=ruido_sal_pimienta(M,N,a,0);  %en ruido pimienta, la proba de sal es 0
        In=I;
        ix=find(R==0);In(ix)=0;
        ruido='sólo pimienta';%Para plotear despues 
    
    case 7 %Ruido sal
        b=input('Ingrese probabilidad de sal: ');
        R=ruido_sal_pimienta(M,N,0,b); %en ruido sal, la proba de pimienta es 0
        In=I;
        ix=find(R==1);In(ix)=1;
        ruido='sólo sal';%Para plotear despues 

end

    V=In;
    tipo_de_ruido=ruido;
    R=R;
end