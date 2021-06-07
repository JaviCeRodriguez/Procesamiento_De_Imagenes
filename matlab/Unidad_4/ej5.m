% A una señal sinusoidal con ruido aleatorio, hágala 
% pasar por un filtro pasa altos (dominio espacial).
% Observe como se modificó su espectro de magnitud. 

% Frecuencia y Frec de muertreo de Nyquist
f1 = 18;
fs = 2 * f1;

% Periodo y vector de tiempos y frecuencias
T = 1 / fs;
t = -1:T:1;
N = length(t);
f = -fs/2:fs/N:(fs/2 - fs/N);

% Dominio frecuencial
w1 = 2 * pi * f1;

% Calculo los valores de los senos y los sumo con ruido existente
y1 = 3.2 * sin(w1 * t);
y = y1 + 3 * rand(size(y1));

% Transformada
TF = fftshift(abs(fft(y)));

% Aplico filtro pasa bajos a la señal y luego transformo
yhigh = highpass(y, 10, fs);
TFhigh = fftshift(abs(fft(yhigh)));

% Plots
subplot(2,2,1);
plot(t,y);
title('Señal senoidal');

subplot(2,2,2);
plot(f,TF);
title('Transformada de Fourier');

subplot(2,2,3);
plot(t,yhigh);
title('Señal con filtro pasa altos');

subplot(2,2,4);
plot(f,TFhigh);
title('TF de la señala filtrada');
