import matplotlib.pyplot as plt
from skimage.io import imread
import numpy as np

def plot_img(img, num_plot, title):
    '''
    Plot de imagen
    '''
    plt.subplot(num_plot)
    plt.imshow(img)
    plt.title(title)


img1 = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\Unidad_2\\female.tiff')
img2 = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\Unidad_2\\tree.tiff')

plot_img(img1, 231, 'Mujer')
plot_img(img2, 232, 'Árbol')
plot_img(img1 + img2, 233, 'Suma')
plot_img(img1 - img2, 234, 'Resta')
plot_img(img1 * img2, 235, 'Multiplicación')
plot_img((img1 * 0.3 + img2 * 0.7).astype(np.uint8), 236, 'Combinación')

plt.show()