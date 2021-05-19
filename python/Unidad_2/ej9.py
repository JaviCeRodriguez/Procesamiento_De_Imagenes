# Aplique a una imagen grayscale la transformación apropiada para que su 
# histograma se comprima a un cierto rango definido por el usuario (shrinking).

import numpy as np
import matplotlib.pyplot as plt
from skimage import img_as_float
from skimage.color import gray2rgb
from skimage.io import imread
from skimage.exposure import rescale_intensity
import tkinter as tk
from tkinter import filedialog

def plot_img_hist(img, num_plot, title, bins=255):
    '''
    Plots de imagen e histograma
    '''
    # Imagen
    plt.subplot(num_plot)
    if len(img.shape) == 3:
        plt.imshow(img, cmap='gray')
    else: # len(img.shape) == 2
        plt.imshow(gray2rgb(img), cmap='gray')
    plt.title(title)
    # Histograma
    plt.subplot(num_plot + 2)
    plt.hist(img_as_float(img).ravel(), bins=bins)
    plt.xlim(0, 1)
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path


try:
    # Busco imagen y obtengo su ruta
    root = tk.Tk()
    root.withdraw() 
    img = imread(file_read())
    out_range = (0, 50)
    img_shrink = rescale_intensity(img, out_range=out_range).astype(np.uint8)
    plot_img_hist(img, 221, 'Imagen original')
    plot_img_hist(img_shrink, 222, 'Imagen shrinking', bins=out_range[1]-out_range[0])
    
    plt.show()
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()