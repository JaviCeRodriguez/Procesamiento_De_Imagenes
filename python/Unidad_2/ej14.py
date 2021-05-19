# -*- coding: utf-8 -*-
"""
Created on Sun Apr 25 22:40:00 2021

@author: Javier
"""

# Aplicar transformaciones geométricas y observar los resultados (emplear
# los comandos fliplr, flipud, imrotate, imcrop)

import matplotlib.pyplot as plt
from skimage.transform import rotate, warp
from skimage.io import imread
import numpy as np
import tkinter as tk
from tkinter import filedialog

def fisheye(xy):
    center = np.mean(xy, axis=0)
    xc, yc = (xy - center).T

    # Polar coordinates
    r = np.sqrt(xc**2 + yc**2)
    theta = np.arctan2(yc, xc)

    r = 0.8 * np.exp(r**(1/2.1) / 1.8)

    return np.column_stack((
        r * np.cos(theta), r * np.sin(theta)
        )) + center
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path

try:
    # Busco imagen y obtengo su ruta
    root = tk.Tk()
    root.withdraw() 
    image = imread(file_read())
    
    # Rotación de 45° y 180°
    img_rotate45 = rotate(image, 45, resize=True)
    img_rotate180 = rotate(image, 180, resize=True)
    
    # Ojo de pez
    face = image[:400, 15:]
    img_fish = warp(face, fisheye)
    
    fig, axes = plt.subplots(ncols=3, nrows=2, figsize=(8, 8))
    ax = axes.ravel()
    ax[0] = plt.subplot(231)
    ax[1] = plt.subplot(232)
    ax[2] = plt.subplot(233)
    ax[3] = plt.subplot(234)
    
    ax[0].imshow(image)
    ax[1].imshow(img_rotate45)
    ax[2].imshow(img_rotate180)
    ax[3].imshow(img_fish)
    
    plt.show()
except:
    print('Cerraste la ventana!')

print('👋🏽')
root.destroy()