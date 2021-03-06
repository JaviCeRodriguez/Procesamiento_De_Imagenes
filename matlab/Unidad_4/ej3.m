% Sume 3 señales sinusoidales de diferente frecuencia angular y amplitud. 
% Filtre las señales demayor y menor frecuencia, eliminándolas. Grafique el
% resultado de la anti-transformada de Fourier.

% Amplitudes
A1 = 1; A2 = 5; A3 = 10;

% Frecuencias
f1 = 0.2; f2 = 6; f3 = 20;

% Frec de muestreo de Nyquist
fs = 2 * f3;

% Frecuencias angulares
w1 = 2 * pi * f1;
w2 = 2 * pi * f2;
w3 = 2 * pi * f3;

% Dominio temporal y frecuencial
t = 0:1/fs:10/fs;
N = length(t);
f = -fs/2:fs/N:(fs/2 - fs/N);

% Señaes sinusoidales y suma
y1 = A1 * sin(w1*t);
y2 = A2 * sin(w2*t);
y3 = A3 * sin(w3*t);
y = y1 + y2 + y3;

% Transformada
TF = fftshift(abs(fft(y)));

% Filtro pasabanda
fci = f2 - f2/2;
fcs = f2 + f2/2;
for j = 1:N
    if (f(j) > -fcs && f(j) < -fci) || (f(j) > fci && f(j) < fcs)
        H(j) = 1;
    else
        H(j) = 0;
    end
end
v = TF .* H;

% Antitransformada
P = fft(y) .* ifftshift(H);
iTF = real(ifft(P));

% Plots
subplot(2,2,1);
plot(t,y);
title('Señales senoidales sumadas');

subplot(2,2,2);
plot(f,TF);
title('Transformada de Fourier');

subplot(2,2,4);
plot(f,v);
title('Filtro pasabada (fci = 3 Hz y fcs = 9 Hz)');

subplot(2,2,3);
plot(t,iTF);
title('Antitransformada con filtro pasabanda');