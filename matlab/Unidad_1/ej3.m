ajedrez = zeros(10);
patron = zeros(10);
[f, c] = size(ajedrez);

for i = 1:f
    for j = 1:f
        if (mod(i,2) == 0 && mod(j,2) ~= 0) || (mod(i,2) ~= 0 && mod(j,2) == 0)
            ajedrez(i, j) = 1;
        end
    end
end

for i = 1:f/2
    for j = 1:f
        if (mod(i,2) == 0 && mod(j,2) ~= 0) || (mod(i,2) ~= 0 && mod(j,2) == 0)
            patron(i, j) = 1;
        end
    end
end

s = f/2 + 1;
for i = s:f
    for j = 1:f
        if (mod(i,2) == 0 && j < s) || (j >= s  && mod(j,2) ~= 0)
            patron(i, j) = 1;
        end
    end
end

f = figure;
f.Position = [150 200 1000 400];

subplot(1, 2, 1);
imagesc(ajedrez);
colormap(gray);

subplot(1, 2, 2);
imagesc(patron);
colormap(gray);