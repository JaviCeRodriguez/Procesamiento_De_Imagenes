%genera filtro Notch
function FN = filtro_notch_simplificado(forma,tipo,M,N,C,D0,n)
%Input:  
%forma= 'ideal', BTW ('btw'), Gauss ('gaussian')
%tipo: rechaza banda ('reject') o pasa banda ('pass')

FN = ones(M,N);
f=size(C,1); %cantidad de pares de deltas

[V,U]=meshgrid(1:N,1:M); %Ojo, primero va V y luego U

u0  = floor(M/2)+1;
v0  = floor(N/2)+1;

for i=1:f
    u1 = u0 - C(i,1); %calcula las coordenadas u respecto centro
    v1 = v0 + C(i,2); %calcula las coordenadas v respecto centro
   
    %Distancia entre el píxel correspondiente al centro Notch (u1,v1) y el resto de los píxeles
    DE = sqrt((U-u1).^2+(V-v1).^2); 
    
    switch forma
        case 'ideal'
          H =DE>=D0; %pasa alto (rechaza banda notch)
            
        case 'btw'
          H = 1./(1+(D0./DE).^(2*n)); %pasa alto (rechaza banda notch)
            
        case 'gaussian'
         H =1-exp(-(DE.^2)/(2*D0^2)); %pasa alto (rechaza banda notch)
    end
    
    
    Hr=rot90(H,2); %roto 180    
    
    FN=FN.*H.*Hr;    
end

if strcmp (tipo,'pass') %si es pasa banda notch
    FN=1- FN;
end



