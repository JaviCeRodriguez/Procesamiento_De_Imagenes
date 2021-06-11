% Genere diferentes elementos estructurales (SE) empleando la función strel.
clear, clc, close all

% SE Diamante
R = 5;
SE1 = strel('diamond', R);
% SE1.Neighborhood

% SE Disco
SE2 = strel('disk', R);
% SE2.Neighborhood

% SE Linea
len = 16; deg = 15;
SE3 = strel('line', len, deg);
% SE3.Neighborhood

% SE Rectangulo
MN = [2 4];
SE4 = strel('rectangle', MN);
% SE4.Neighborhood

% SE Cuadrado
W = 4;
SE5 = strel('square', W);
% SE5.Neighborhood

% SE Arbitrario
NHOOD = [0 1 0; 1 0 1];
SE6 = strel('arbitrary', NHOOD);
SE6.Neighborhood