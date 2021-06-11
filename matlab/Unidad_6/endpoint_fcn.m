function is_end_point = endpoint_fcn(nhood) 
interval1=[-1 1 -1;-1 1 -1; -1 -1 -1];
interval2=[1 -1 -1; -1 1 -1;-1 -1 -1]; 
for k = 1:4
 % rot90(A, k) rota A 90º k veces
 C = bwhitmiss(nhood, rot90(interval1, k));
 D = bwhitmiss(nhood, rot90(interval2, k));
 
 if (C (2,2) == 1) || (D (2,2) == 1)
% La vecindad del pixel matchea
% una configuración de punto extremo
 is_end_point = true; 
 return;
 end
end
is_end_point = false; 