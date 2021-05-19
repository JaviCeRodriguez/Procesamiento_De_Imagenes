# 3) Abra una imagen y aplíquele diferentes tipos de filtros pasa altos. Visualice el resultado
# y observe qué ocurre cuando se modifican los coeficientes (kernel 3x3).

import cv2
import math
import matplotlib.pyplot as plt
import numpy as np
import tkinter as tk
from tkinter import filedialog


def file_read():
    '''
    Abro una ventana Tkinter y obtengo path de la imagen
    '''
    file_path = filedialog.askopenfilename()
    return file_path

def high_pass_filtering(image, radius, n):
    """
         High pass filter function
         :param image: input image
         :param radius: radius
         :param n: ButterWorth filter order
         :return: filtering result
    """
         # Fourier transform the image, fft is a three-dimensional array, fft[:, :, 0] is the real part, fft[:, :, 1] is the imaginary part
    fft = cv2.dft(np.float32(image), flags=cv2.DFT_COMPLEX_OUTPUT)
         # Centralize fft, the generated dshift is still a three-dimensional array
    dshift = np.fft.fftshift(fft)
 
         # Get the center pixel
    rows, cols = image.shape[:2]
    mid_row, mid_col = int(rows / 2), int(cols / 2)
 
         # Build ButterWorth high-pass filter mask
 
    mask = np.zeros((rows, cols, 2), np.float32)
    for i in range(0, rows):
        for j in range(0, cols):
                         # Calculate the distance from (i, j) to the center
            d = math.sqrt(pow(i - mid_row, 2) + pow(j - mid_col, 2))
            try:
                mask[i, j, 0] = mask[i, j, 1] = 1 / (1 + pow(radius / d, 2*n))
            except ZeroDivisionError:
                mask[i, j, 0] = mask[i, j, 1] = 0
         # Multiply the Fourier transform result by a mask
    fft_filtering = dshift * mask
         # Inverse Fourier transform
    ishift = np.fft.ifftshift(fft_filtering)
    image_filtering = cv2.idft(ishift)
    image_filtering = cv2.magnitude(image_filtering[:, :, 0], image_filtering[:, :, 1])
         # Normalize the inverse transform results (generally normalize the last step of image processing, except in special cases)
    cv2.normalize(image_filtering, image_filtering, 0, 1, cv2.NORM_MINMAX)
    return image_filtering

def ploteo(original, result):
    fig, axes = plt.subplots(ncols=2, nrows=1, figsize=(6, 2.5))
    ax = axes.ravel()
    ax[0] = plt.subplot(121) # Imagen original
    ax[1] = plt.subplot(122) # Imagen resultado

    ax[0].imshow(original, 'gray')
    ax[0].set_title('Original')

    ax[1].imshow(result, 'gray')
    ax[1].set_title('Filtro pasa altos')


# Inicio Tkinter
root = tk.Tk()
root.withdraw()

try:
    image = cv2.imread(file_read(), 0)
    img_filter = high_pass_filtering(image=image, radius=50, n=1)
    ploteo(original=image, result=img_filter)
    plt.show()

except:
    print('Fin del codigo')

root.destroy()