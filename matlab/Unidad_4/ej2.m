% A la señal del punto anterior agréguele ruido aleatorio y observe como 
% se modifica su espectro de magnitud

% Frecuencias para los senos
f1 = 2;
f2 = 20;

% Frec de muertreo de Nyquist
fs = 2 * f2;

% Periodo y vector de tiempos y frecuencias
T = 1 / fs;
t = -1:T:1;
N = length(t);
f = -fs/2:fs/N:(fs/2 - fs/N);

% Dominio frecuencial
w1 = 2 * pi * f1;
w2 = 2 * pi * f2;

% Calculo los valores de los senos y los sumo con ruido existente
y1 = sin(w1 * t);
y2 = -10 * sin(w2 * t);
y = y1 + y2 + 3 * rand(size(y2));

% DFT
TF = fftshift(abs(fft(y)));

% Plot
plot(f, TF); 
title('Espectro de magnitud de la suma de dos sinusoides + ruido aleatorio');