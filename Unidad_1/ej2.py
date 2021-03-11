# ///---- Imports ----///
import math
import numpy as np
from matplotlib import pyplot as plt
# from .modules import functions as f

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


# if __name__ == "__main__":
delta = [0.5, math.pi, 0.05, 0.05]

# Ej 2.1
axis_x = np.arange(start = delta[1], stop = 10*delta[0], step = delta[0])
axis_y1 = cuadratica(axis_x = axis_x)
plt.plot(axis_x, axis_y1, 'rx', label = 'f(x) = x^2')

# Ej 2.2
axis_x = np.arange(start = delta[1], stop = 20*delta[1], step = delta[1])
axis_y2 = cos_rara(axis_x = axis_x)
plt.plot(axis_x, axis_y2, 'g+', label = 'f(x) = |x/8| * cos(4x)')

# Ej 2.3
axis_x = np.arange(start = delta[1], stop = 20*delta[1], step = delta[1])
axis_y3 = log_nat(axis_x = axis_x)
plt.plot(axis_x, axis_y3, 'b*', label = 'f(x) = ln(x)')

# Ej 2.4
axis_x = np.arange(start = 0, stop = 1*delta[1])
axis_y4 = exp(axis_x = axis_x)
plt.plot(axis_x, axis_y4, 'y-', label = 'f(x) = e^x')

# Ploteo las 4 funciones
plt.xlabel('x')
plt.ylabel('y')
plt.title('Funciones / Ejercicio 2')
plt.legend()
plt.grid(True)
plt.show()