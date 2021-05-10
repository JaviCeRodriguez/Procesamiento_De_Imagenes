# Abra una imagen y agréguele ruido con el comando imnoise

import matplotlib.pyplot as plt
from skimage.io import imread
from skimage.util import random_noise as noise
import tkinter as tk
from tkinter import filedialog


def file_read():
    file_path = filedialog.askopenfilename()
    return file_path


root = tk.Tk()
root.withdraw()
try:
    # Busco imagen y obtengo su ruta
    image = imread(file_read())
    img_sp = noise(image, mode='s&p', seed=200)
    img_gs = noise(image, mode='gaussian', seed=200)

    fig, axes = plt.subplots(ncols=3, nrows=1, figsize=(10, 2.5))
    ax = axes.ravel()
    ax[0] = plt.subplot(131)
    ax[1] = plt.subplot(132)
    ax[2] = plt.subplot(133)

    ax[0].imshow(image)
    ax[0].set_title('Original')

    ax[1].imshow(img_sp)
    ax[1].set_title('Salt & Pepper')

    ax[2].imshow(img_gs)
    ax[2].set_title('Gaussian')

except:
    print('Cerraste la ventana!')

plt.show()
print('Adios!')
root.destroy()
