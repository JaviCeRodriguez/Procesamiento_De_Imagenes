# Obtenga el negativo de una imagen (grayscale y truecolor) y observe como se
# modifica su histograma. Hágalo aplicando la fórmula y con el comando
# imcomplement.

import matplotlib.pyplot as plt
from skimage import util
from skimage import img_as_float
from skimage.io import imread
import tkinter as tk
from tkinter import filedialog


def plot_img_hist(img, num_plot, title):
    """
        Plots de imagen e histograma
    """
    # Imagen
    plt.subplot(num_plot)
    plt.imshow(img, cmap='gray')
    plt.title(title)
    # Histograma
    plt.subplot(num_plot + 4)
    plt.hist(img_as_float(img).ravel(), bins=256)
    plt.xlim(0, 1)
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path

try:
    # Busco imagen y obtengo su ruta
    root = tk.Tk()
    root.withdraw()
    img1 = imread(file_read()) # Cara
    img2 = imread(file_read()) # Tigre
    
    plot_img_hist(img1, 241, 'Cara')
    plot_img_hist(img2, 242, 'Tigre')
    plot_img_hist(util.invert(img1), 243, 'Cara invertida')
    plot_img_hist(util.invert(img2), 244, 'Tigre invertido')
    
    plt.show()
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()
