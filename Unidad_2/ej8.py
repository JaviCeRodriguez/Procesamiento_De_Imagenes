# Aplique a una imagen grayscale la transformación necesaria para que su 
# histograma cubra todo el rango dinámico (stretching). Intente hacer lo mismo
# utilizando el comando imadjust. ¿Cómo haría si la imagen es truecolor?

import numpy as np
import matplotlib.pyplot as plt
from skimage import img_as_float
from skimage.io import imread
from skimage.exposure import rescale_intensity
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
    plt.subplot(num_plot + 2)
    plt.hist(img_as_float(img).ravel(), bins=256)
    plt.xlim(0, 1)
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path

try:
    # Busco imagen y obtengo su ruta
    root = tk.Tk()
    root.withdraw()
    img_gray = imread(file_read()) # Tigre
    p2, p98 = np.percentile(img_gray, (2, 98))
    img_gray_stretch = rescale_intensity(img_gray, in_range=(p2, p98))
    plot_img_hist(img_gray, 221, 'Tigre')
    plot_img_hist(img_gray_stretch, 222, 'Tigre stretching')
    
    plt.show()
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()