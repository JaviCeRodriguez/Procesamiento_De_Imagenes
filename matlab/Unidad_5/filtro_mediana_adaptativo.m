function O = filtro_mediana_adaptativo(I,Smax)

O = zeros(size(I));
P = false(size(I)); %matriz lógica (me indica si un pixel fue o no procesado), false = cero, true = 1.

% Ordena los datos dentro de la venta para luego buscar el mínimo o el máximo de cada ventana. 
% La ventana se mueve recorriendo cada pixel de la imagen. 
% Completa usando simetría cuando es necesario.

for k = 3:2:Smax

    Zmin = ordfilt2(I,1,ones(k,k),'symmetric');   %busca el mínimo dentro de la ventana kxk
    Zmax = ordfilt2(I,k*k,ones(k,k),'symmetric'); %busca el máximo (kxk) dentro de la venta
    Zmed = medfilt2(I,[k k],'symmetric');
    
    nivelA = (Zmed > Zmin) & (Zmax > Zmed) & ~P;  %~P (si el pixel no fue procesado), si cumplen, el pixel vale 1
    nivelB = (I > Zmin) & (I < Zmax);
    
    outZxy = nivelA & nivelB;   %donde se cumpla nivelA y nivelB, habrá un 1
    outZmed = nivelA & ~nivelB; %donde se cumpla nivel A y no se cumpla nivel B, habrá 1
	
    O(outZxy) = I(outZxy);
    O(outZmed) = Zmed(outZmed);
    
    P = P | nivelA; %actualizo matriz P
    
    if all(P(:)) %si ningún pixel es cero --> si ya se analizaron todos los píxeles
        break;
    end    
end

O(~P) = Zmed(~P); %cuado el tamaño de la ventana no pueda crecer más, 
%sólo quedan los no procesados..

