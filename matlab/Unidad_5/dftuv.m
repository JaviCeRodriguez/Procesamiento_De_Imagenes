function [U, V] = dftuv(M, N)
% Calcula las matrices U y V (meshgrid de frecuencia)  
% U y V se emplean para armar filtros en el dominio de las frecuencias
% Ambas son de dimensión MxN y de clase single.

% Seteo el rango de las variables
u= single(0:(M - 1));
v= single(0:(N - 1)); 

%Calcula el índice para usar en meshgrid
idx = find(u > M/2);
u(idx) = u(idx) - M;

idy = find(v > N/2);
v(idy) = v(idy) - N; 

% Compute the meshgrid arrays.
[V,U] = meshgrid(v,u);  %observación, deben ir invertidos en orden
