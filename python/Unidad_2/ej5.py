# TODO: Ver otras posibilidades de adjuste de brillo

# Modifique el contraste de una imagen. Observe cómo se cambia su histograma.

import matplotlib.pyplot as plt
from skimage import img_as_float
from skimage.color import rgb2gray
from skimage.io import imread
from skimage.exposure import adjust_sigmoid
import tkinter as tk
from tkinter import filedialog

def plot_img_hist(img, num_plot, title):
    '''
    Plots de imagen e histograma
    '''
    # Imagen
    plt.subplot(num_plot)
    plt.imshow(img, cmap='gray')
    plt.title(title)
    # Histograma
    plt.subplot(num_plot + 3)
    plt.hist(img_as_float(img).ravel(), bins=256)
    plt.xlim(0, 1)

try:
    # Busco imagen, obtengo su ruta y cambio el brillo
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename() # Sauvola
    img = rgb2gray(imread(file_path))
    img_lowcontrast = adjust_sigmoid(img, cutoff=0.5, gain=0.1)
    img_highcontrast = adjust_sigmoid(img, cutoff=0.5, gain=20)
    
    plot_img_hist(img, 231, 'Imagen original')
    plot_img_hist(img_lowcontrast, 232, 'Imagen con bajo contraste')
    plot_img_hist(img_highcontrast, 233, 'Imagen con alto contraste')
    
    # plt.show() # Esto no hace falta estando en Spyder
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()