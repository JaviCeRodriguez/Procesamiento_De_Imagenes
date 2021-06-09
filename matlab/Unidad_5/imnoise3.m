function [r, R, S] = imnoise3(M, N, C, A, B)
% Genera ruido periódico

%Ouput:
%r: patrón de ruido espacial sinusoidal (MxN)
%R: DFT2D centrada y cruda
%S: espectro de magnitud, abs(R)

% Input:
% C (kx2): matriz que contiene los k pares de coordenadas (u,v), ubicación de los impulsos en el dominio de frenciencia
% respecto al centro del rectángulo de frecuencia (M/2 + 1, N/2 + 1).  
% Sólo un par de coordenadas es requerido para cada impulso, el programa genera su conjugado
% A: vector 1xk, contiene las amplitudes de los impulsos. Por defecto es 1. 
% B: matriz kx2, contiene las fases Bx y By de cada par de impulsos. Por default B es 0.
  
% Parámetros de entrada
k = size(C, 1); %cantidad de filas de C, equivalente a la cantidad de pares de deltas

if nargin < 4 %cantidad de argumentos 
    A = ones(1, k); %por defaul A = 1 (vector fila)
    B = zeros(k, 2); %por defaul B=0 (matriz kx2)
end

if nargin < 5
    B = zeros(k, 2); %por defaul B=0 (matriz kx2)
end

% Genera R (una matriz de ceros MxN)
R = zeros(M, N);

for s = 1:k
   
   u0 = floor(M/2) + 1;
   v0 = floor(N/2) + 1 ;
   
   u = u0 - C(s, 1); %calcula las coordenadas "u" respecto centro
   v = v0 + C(s, 2); %calcula las coordenadas "v" respecto centro
   
   %Opuesto
   u_op = u0 + C(s,1);
   v_op = v0 - C(s,2);

   R(u,v) =  i*M*N*(A(s)/2)*exp(-i*2*pi*(C(s,1)*B(s,1)/M+C(s,2)*B(s,2)/N)); %la expo se hace 1 si la fase es 0
   R(u_op,v_op) = -i*M*N*(A(s)/2)*exp( i*2*pi*(C(s,1)*B(s,1)/M+C(s,2)*B(s,2)/N));

end

% Genera el espectro de magnitud y elpatrón sinusoidal espacial
S = abs(R); %R está centrado -> S está centrado
r = real(ifft2(ifftshift(R)));
