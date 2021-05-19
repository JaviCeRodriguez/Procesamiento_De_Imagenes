# -*- coding: utf-8 -*-
"""
Created on Mon Apr  5 22:11:30 2021

@author: Javier
"""
# A una imagen grayscale aplíquele la operación de binarización basada en el
# método de Otsu (use la función graythresh e im2bw).


import matplotlib.pyplot as plt
from skimage.io import imread
from skimage.filters import threshold_otsu
import tkinter as tk
from tkinter import filedialog
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path

try:
    # Busco imagen y obtengo su ruta
    root = tk.Tk()
    root.withdraw() 
    img = imread(file_read()) # Tigre
    img_th = threshold_otsu(img)
    img_bin = img > img_th # Tomo como referencia el resultado de Otsu para
                            # obtener un array binario (true o false)
    
    fig, axes = plt.subplots(ncols=3, figsize=(8, 2.5))
    ax = axes.ravel()
    ax[0] = plt.subplot(131)
    ax[1] = plt.subplot(132)
    ax[2] = plt.subplot(133, sharex=ax[0], sharey=ax[0])
    
    ax[0].imshow(img, cmap=plt.cm.gray)
    ax[0].set_title('Imagen grayscale')
    ax[0].axis('off')
    
    ax[1].hist(img.ravel(), bins=256)
    ax[1].set_title('Histograma')
    ax[1].axvline(img_th, color='r')
    
    ax[2].imshow(img_bin, cmap=plt.cm.gray)
    ax[2].set_title('Imagen thresholdeada')
    ax[2].axis('off')
    
    plt.show()
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()