function R = ruido_sal_pimienta (M,N,Pa,Pb) 
% Genera una matriz R (MxN) de 0 (con Pa) pimienta, 1 (con Pb) sal y 0.5 (P=1-(Pa+Pb)) 
% Pa = probabilidad de pixeles 0, Pb = probabilidad de pixeles 1, P = probabilidad pixeles 0.5

if (Pa + Pb) > 1 %Debo chequear que Pa+Pb<1.
    error( 'La suma de probabilidades no debe exceder 1')
end

R = ones(M,N)*0.5;
X = rand(M,N) ;
R(X <= Pa)=0; %pimienta
P = Pa + Pb;
R(X > Pa & X <= P)= 1; %sal