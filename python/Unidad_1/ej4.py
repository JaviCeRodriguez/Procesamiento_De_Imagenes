# Imports
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits import mplot3d

# Config plot
def config_plt():
    fig = plt.figure(figsize=(6,4))
    ax3d = plt.axes(projection="3d")
    return fig, ax3d

# Ejercicios
def ejer_1():
    xdata = np.arange(start = -5, stop = 5, step = 0.01)
    ydata = np.arange(start = -5, stop = 5, step = 0.01)
    X,Y = np.meshgrid(xdata,ydata)
    Z = pow(base = X, exp = 2) + pow(base = Y, exp = 2)
    return X, Y, Z

def ejer_2():
    xdata = np.arange(start = -2, stop = 2, step = 0.01)
    ydata = np.arange(start = -2, stop = 2, step = 0.01)
    X,Y = np.meshgrid(xdata,ydata)
    Z = X * np.exp(-pow(base = X, exp = 2) - pow(base = Y, exp = 2))
    return X, Y, Z

def ejer_3():
    xdata = np.arange(start = -3, stop = 3, step = 0.01)
    ydata = np.arange(start = -3, stop = 3, step = 0.01)
    X,Y = np.meshgrid(xdata,ydata)
    Z = (X * Y * (pow(base = X, exp = 2) - pow(base = Y, exp = 2))) / (pow(base = X, exp = 2) + pow(base = Y, exp = 2))
    return X, Y, Z

def ejer_4():
    xdata = np.arange(start = -8, stop = 8, step = 0.1)
    ydata = np.arange(start = -8, stop = 8, step = 0.1)
    X,Y = np.meshgrid(xdata,ydata)
    module = np.sqrt((pow(base = X, exp = 2) + pow(base = Y, exp = 2)))
    Z = np.sin(module) / module
    return X, Y, Z


# Lista de funciones para recorrer en el for
fList = [ejer_1(), ejer_2(), ejer_3(), ejer_4()]
for n, fun in enumerate(fList):
    X, Y, Z = fList[n]
    # Ploteo
    fig, ax3d = config_plt()
    plt.figure(n + 1)
    ax3d = plt.axes(projection='3d')
    surf=ax3d.plot_surface(X, Y, Z, rstride=7, cstride=7, cmap="gray")
    fig.colorbar(surf, ax=ax3d)
    ax3d.set_title(f'Plot de superficie / Ejercicio {n+1}')
    ax3d.set_xlabel('X')
    ax3d.set_ylabel('Y')
    ax3d.set_zlabel('Z')

# Curva de nivel de una función elegida
# X, Y, Z = ejer_4()
# TODO: 15 curvas de nivel

# plt.savefig("Customized Surface Plot.png")

# Muestro todos los plots
plt.show()