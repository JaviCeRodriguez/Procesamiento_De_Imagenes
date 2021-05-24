% 4) Grafique las siguientes superficies utilizando los comandos surf y mesh.
% Use diferentes mapas de colores en cada superficie. 

%% 4.1) z = x^2 + y^2 para x,y entre [-5;5]
figure()
[x_1, y_1] = meshgrid(-5:.5:5);
z_1 = x_1.^2 + y_1.^2;

subplot(2,4,1);
surf(z_1);
title('Surf z = x^2 + y^2');

subplot(2,4,5);
mesh(z_1);
title('Mesh z = x^2 + y^2');


%% 4.2) z = x * e^-(x^2 + y^2) para x,y entre [-2;2]

[x_2, y_2] = meshgrid(-2:.2:2);
z_2 = x_2 .* exp(-(x_2.^2 + y_2.^2));

subplot(2,4,2);
surf(z_2);
title('Surf z = x * e^-(x^2 + y^2)');

subplot(2,4,6);
mesh(z_2);
title('Mesh z = x * e^-(x^2 + y^2)');

%% 4.3) z = (x*y*(x^2-y^2))/(x^2+y^2) para x,y entre [-3;3]

[x_3, y_3] = meshgrid(-3:.3:3);
z_3 = (x_3.*y_3.*(x_3.^2-y_3.^2))./(x_3.^2+y_3.^2);

subplot(2,4,3);
surf(z_3);
title('Surf z = (x*y*(x^2-y^2))/(x^2+y^2)');

subplot(2,4,7);
mesh(z_3);
title('Mesh z = (x*y*(x^2-y^2))/(x^2+y^2)');

%% 4.4) z = sen(sqrt(x^2+y^2))/sqrt(x^2+y^2) para x,y  [-8;8]

[x_4, y_4] = meshgrid(-8:.5:8);
raiz = sqrt(x_4.^2+y_4.^2);
z_4 = sin(raiz)./raiz;

subplot(2,4,4);
surf(z_4);
title('Surf z = sen(sqrt(x^2+y^2))/sqrt(x^2+y^2)');

subplot(2,4,8);
mesh(z_4);
title('Mesh z = sen(sqrt(x^2+y^2))/sqrt(x^2+y^2)');

%% Curvas de  contorno de la funcion 4.4)
figure();
contour(z_3,15);