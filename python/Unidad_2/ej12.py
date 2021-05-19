# -*- coding: utf-8 -*-
"""
Created on Mon Apr  5 22:34:28 2021

@author: Javier
"""

# Aplíquele a una imagen grayscale la operación binarización de Sauvola.
# Compare los resultados con los obtenidos usando el método de Otsu.

import matplotlib.pyplot as plt
from skimage.io import imread
from skimage.filters import threshold_sauvola, threshold_otsu
import tkinter as tk
from tkinter import filedialog
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path

try:
    # Busco imagen y obtengo su ruta
    root = tk.Tk()
    root.withdraw() 
    img = imread(file_read())
    img_thr = threshold_otsu(img) # 113 int32
    img_sau = threshold_sauvola(img) # shape: (334, 500) float64
    img_binthr = img > img_thr
    img_binsau = img > img_sau
    
    fig, axes = plt.subplots(ncols=3)
    ax = axes.ravel()
    ax[0] = plt.subplot(131)
    ax[1] = plt.subplot(132)
    ax[2] = plt.subplot(133)
    
    ax[0].imshow(img, cmap=plt.cm.gray)
    ax[0].set_title('Imagen grayscale')
    ax[0].axis('off')
    
    ax[1].imshow(img_binthr, cmap=plt.cm.gray)
    ax[1].set_title('Otsu')
    ax[1].axis('off')
    
    ax[2].imshow(img_binsau, cmap=plt.cm.gray)
    ax[2].set_title('Sauvola')
    ax[2].axis('off')
    
    plt.show()
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()