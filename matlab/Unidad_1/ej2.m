% 2) Grafique las siguientes funciones.
% 
% 2.1) f: [-5,5] R, f(x) = x^2, siendo paso d x = 0.5
% 2.2) f: [-2pi,2pi]R, f(x)=|x/8| * cos(4x), siendo paso de x=pi/64
% 2.3) f: (0,5] R, f(x) = ln(x), siendo paso de x =0.05
% 2.4) f: [-2,2] R, f(x) = e^x,, siendo paso de x =0.05

figure('Name', 'Funciones');

subplot(2, 2, 1);
x_1 = -5:0.5:5;
y_1 = x_1.^2;
plot(x_1, y_1);
title('f(x) = x^2');

subplot(2, 2, 2);
x_2 = -2*pi:pi/64:2*pi;
y_2 = mod_cos(x_2);
plot(x_2, y_2);
title('f(x)=|x/8| * cos(4x)');

subplot(2, 2, 3);
x_3 = 0:0.05:5;
y_3 = log(x_3);
plot(x_3, y_3);
title('f(x) = ln(x)');

subplot(2, 2, 4);
x_4 = -2:0.05:2;
y_4 = exp(x_4);
plot(x_4, y_4);
title('f(x) = e^x');

function y = mod_cos(x)
    y = abs(x/8) .* cos(4*x);
end