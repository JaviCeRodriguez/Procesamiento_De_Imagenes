% Genere ruido periódico y observe su DFT2D

% Defino parametros para imnoise3
C=[6 0,0 10];
M = 120; N = 220;
A=[20 50];

[r,R,S]=imnoise3(M,N,A);
%r: patron de ruido espacial sinusoidal (MxN)
%R: DFT2D centrada y cruda
%S: espectro de magnitud, abs(R)

figure

subplot(131);imshow(r,[]);title('Patron espacial ruido periódico')
xlabel('x');ylabel('y');

subplot(132);imshow(S,[]);title('Espectro de magnitud periodico')
xlabel('V');ylabel('U');

subplot(133);mesh(S);title('Espectro de magnitud 3D')
xlabel('V');ylabel('U');zlabel('AMP');axis tight;colormap(pink(256))