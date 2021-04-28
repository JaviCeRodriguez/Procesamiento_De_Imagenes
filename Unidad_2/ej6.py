# Realice operaciones aritméticas usando dos imágenes. Las imágenes deben 
# tener la misma dimensión para poder operar.

import matplotlib.pyplot as plt
from skimage.io import imread
import numpy as np
import tkinter as tk
from tkinter import filedialog

def plot_img(img, num_plot, title):
    '''
    Plot de imagen
    '''
    plt.subplot(num_plot)
    plt.imshow(img)
    plt.title(title)
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path
    

try:
    # Busco imagen y obtengo su ruta
    root = tk.Tk()
    root.withdraw()
    img1 = imread(file_read()) # Female
    img2 = imread(file_read()) # Tree
    
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
    
    plt.show()
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()