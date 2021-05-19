# 5) Realce los bordes de una imagen usando la segunda derivada mediante el comando
# fspecial.

import numpy as np
import matplotlib.pyplot as plt
from skimage.io import imshow, imread
from skimage.color import rgb2yuv, rgb2hsv, rgb2gray, yuv2rgb, hsv2rgb
from scipy.signal import convolve2d
import tkinter as tk
from tkinter import filedialog


def file_read():
    '''
    Abro una ventana Tkinter y obtengo path de la imagen
    '''
    file_path = filedialog.askopenfilename()
    return file_path

def multi_convolver(image, kernel, iterations):
    for i in range(iterations):
        image = convolve2d(image, kernel, 'same', boundary = 'fill',
                           fillvalue = 0)
    return image

def convolver_rgb(image, kernel, iterations = 1):
    img_yuv = rgb2yuv(image)   
    img_yuv[:,:,0] = multi_convolver(img_yuv[:,:,0], kernel, 
                                     iterations)
    final_image = yuv2rgb(img_yuv)
                               
    fig, ax = plt.subplots(1,2, figsize = (17,10))
    
    ax[0].imshow(image)
    ax[0].set_title(f'Original', fontsize = 20)
    
    ax[1].imshow(final_image);
    ax[1].set_title(f'YUV Adjusted, Iterations = {iterations}', 
                    fontsize = 20)
    
    [axi.set_axis_off() for axi in ax.ravel()]
    
    fig.tight_layout()
    
    return final_image


def ploteo(original, result, msg_result):
    fig, axes = plt.subplots(ncols=2, nrows=1, figsize=(6, 2.5))
    ax = axes.ravel()
    ax[0] = plt.subplot(121) # Imagen original
    ax[1] = plt.subplot(122) # Imagen resultado

    ax[0].imshow(original)
    ax[0].set_title('Original')

    ax[1].imshow(result)
    ax[1].set_title(msg_result)


# Inicio Tkinter
root = tk.Tk()
root.withdraw()

# Variables
sharpen = np.array([[0, -1, 0],
                    [-1, 5, -1],
                    [0, -1, 0]])

try:
    image = imread(file_read())
    final_image = convolver_rgb(image, sharpen, iterations = 1)
    ploteo(original=image, result=final_image, msg_result='Realce de bordes')

except:
    print('Hay algo mal que no esta bien :/')

# Cierro procesos de Tkinter
root.destroy()