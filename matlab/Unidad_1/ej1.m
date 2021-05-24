% 1) Genere un vector de 10 números complejos, calcule el módulo y aplique
% un redondeo al entero más próximo. El vector resultante tendrá números
% enteros positivos.
%   a) Separe los valores impares de los pares en diferentes vectores.
%   b) Ordene de menor a mayor los elementos de ambos vectores.

large = 10;
factor = 10;
v = zeros(1, large);
v_i = [];
v_p = [];

for i = 1:large
    cvalue = complex(rand(1)*factor, rand(1)*factor); % Complejo
    value = round(abs(cvalue)); % Modulo y Redondeo
    v(i) = value; % Guardo en vector v
    if mod(value, 2) == 0
        v_p = [v_p, value];
    else
        v_i = [v_i, value];
    end
end

v_p = sort(v_p);
v_i = sort(v_i);

disp(v);
disp(v_p);
disp(v_i);