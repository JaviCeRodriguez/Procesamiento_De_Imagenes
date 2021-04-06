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

suma = img1 + img2
resta = img1 - img2
multip = (img1 * img2).astype(np.uint8)
comb = (img1 * 0.3 + img2 * 0.7).astype(np.uint8)

plot_img(img1, 231, 'Mujer')
plot_img(img2, 232, 'Árbol')
plot_img(suma, 233, 'Suma')
plot_img(resta, 234, 'Resta')
plot_img(multip, 235, 'Multiplicación')
plot_img(comb, 236, 'Combinación')

# plt.show()