# ///---- Imports ----///
import math
import numpy as np
from matplotlib import pyplot as plt

def cuadratica (axis_x: list):
    '''
    Función f(x) = x^2\n
    axis_x es una lista de n elementos que se usarán para evaluar f(x)
    '''
    f_list = []
    for x in axis_x:
        f = math.pow(x, 2) # Realizo la función
        f_list.append(f) # Agrego a una lista
    return f_list

def cos_rara (axis_x: list):
    '''
    Función f(x) = |x/8| * cos(4x)\n
    axis_x es una lista de n elementos que se usarán para evaluar f(x)
    '''
    f_list = []
    for x in axis_x:
        f = abs(x/8) * math.cos(4 * x) # Realizo la función
        f_list.append(f) # Agrego a una lista
    return f_list

def log_nat (axis_x: list):
    '''
    Función f(x) = ln(x)\n
    axis_x es una lista de n elementos que se usarán para evaluar f(x)
    '''
    f_list = []
    for x in axis_x:
        f = math.log(x) # Realizo la función
        f_list.append(f) # Agrego a una lista
    return f_list
    
def exp (axis_x: list):
    '''
    Función f(x) = e^x\n
    axis_x es una lista de n elementos que se usarán para evaluar f(x)
    '''
    f_list = []
    for x in axis_x:
        f = math.exp(x) # Realizo la función
        f_list.append(f) # Agrego a una lista
    return f_list


# Ej 2.1
axis_x1 = np.arange(start = -2.5, stop = 2.5, step = 0.1)
axis_y1 = cuadratica(axis_x = axis_x1)
plt.plot(axis_x1, axis_y1, 'rx', label = 'f(x) = x^2')

# Ej 2.2
axis_x2 = np.arange(start = -math.pi, stop = math.pi, step = math.pi/64)
axis_y2 = cos_rara(axis_x = axis_x2)
plt.plot(axis_x2, axis_y2, 'g+', label = 'f(x) = |x/8| * cos(4x)')

# Ej 2.3
axis_x3 = np.arange(start = 0.5, stop = 5, step = 0.05)
axis_y3 = log_nat(axis_x = axis_x3)
plt.plot(axis_x3, axis_y3, 'b*', label = 'f(x) = ln(x)')

# Ej 2.4
axis_x4 = np.arange(start = -2, stop = 2, step = 0.05)
axis_y4 = exp(axis_x = axis_x4)
plt.plot(axis_x4, axis_y4, 'y-', label = 'f(x) = e^x')

# Ploteo las 4 funciones
plt.xlabel('x')
plt.ylabel('y')
plt.title('Funciones / Ejercicio 2')
plt.legend()
plt.grid(True)
plt.show()