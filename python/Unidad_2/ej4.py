# Modifique el brillo de una imagen y observe cómo cambia su histograma
# (imhist). Utilice imágenes en escala de grises.

import matplotlib.pyplot as plt
from skimage import img_as_float
from skimage.color import rgb2gray
from skimage.io import imread
from skimage.exposure import adjust_gamma
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
    file_path = filedialog.askopenfilename()
    img = rgb2gray(imread(file_path))
    img_bright = adjust_gamma(img, gamma=0.3, gain=1)
    img_dark = adjust_gamma(img, gamma=2.5, gain=1)
    
    # Funciones de ploteo de imagenes e histogramas
    plot_img_hist(img, 231, 'Imagen original')
    plot_img_hist(img_bright, 232, 'Imagen con mucho brillo')
    plot_img_hist(img_dark, 233, 'Imagen con poco brillo')
    
    # plt.show() # Esto no hace falta estando en Spyder
except:
    print('Cerraste la ventana!')
    
print('👋🏽')
root.destroy()