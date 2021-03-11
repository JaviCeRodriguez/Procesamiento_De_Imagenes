import math
import numpy as np

fs = 2
delta = 1/fs
axis_x = np.arange(0, 10 + delta, delta)
print(axis_x)

def f_cuadratica (axis_x):
    f_list = []
    for x in axis_x:
        f = math.pow(x, 2)
        f_list.append(f)
    return f_list

axis_y = f_cuadratica(axis_x)

print(axis_y)

print(len(axis_x) == len(axis_y))