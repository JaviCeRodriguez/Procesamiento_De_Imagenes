import numpy as np
import matplotlib.pyplot as plt

size = (10, 10)

def ajedrez(mat):
    for i in range(0, 10):
        for j in range(0, 10):
            if ((i % 2 == 0) and (j % 2 != 0)) or ((i % 2 != 0) and (j % 2 == 0)):
                mat[i][j] = 1
    return mat


def pattern(mat):
    for i in range(0, 6):
        for j in range(0, 10):
            if ((i % 2 == 0) and (j % 2 != 0)) or ((i % 2 != 0) and (j % 2 == 0)):
                mat[i][j] = 1

    for i in range (5, 10):
        for j in range (0, 10):
            if ((i % 2 != 0) and (j < 5)) or ((j >= 5) and (j % 2 == 0)):
                mat[i][j] = 1
    return mat


def plot_patterns(patt):
    labels = range(10)
    plt.rcParams['image.cmap'] = 'gray' # Indico que el plot es en escala de grises
    valuePattern = patt

    plt.figure()
    plt.imshow(valuePattern, vmin = 0, vmax = 1) # Hago plot de la matriz, indicando valores mínimo y máximo
    plt.xticks(labels)
    plt.yticks(labels)

plot_patterns(ajedrez(np.zeros(size)))
plot_patterns(pattern(np.zeros(size)))
plt.show() # Muestro plot


# plt.matshow(ajedrezArr) # Este es otro tipo de plot pero no me estaría sirviendo para lo que necesito

