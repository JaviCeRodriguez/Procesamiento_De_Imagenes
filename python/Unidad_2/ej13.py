# -*- coding: utf-8 -*-
"""
Created on Sun Apr 25 18:07:44 2021

@author: Javier
"""

# Realice procesamientos que involucren operaciones aritméticas y booleanas.
# NO ESTA TERMINADO, ESTOY VIENDO LA POSIBILIDAD DE USAR OPENCV
# https://answers.opencv.org/question/228538/how-to-create-a-binary-mask-for-medical-images/


from matplotlib import pyplot as plt
from skimage.io import imread
from skimage.color import rgb2gray
from skimage.filters import threshold_otsu as th_otsu
import tkinter as tk
from tkinter import filedialog
    
def file_read():
    file_path = filedialog.askopenfilename()
    return file_path

try:
    root = tk.Tk()
    root.withdraw() 
    image = imread(file_read()) # Leo imagen
    if len(image.shape) == 3: # Si es Truecolor, paso a grayscale
        img_gray = rgb2gray(image)
    else: # Sino, solo paso los valores
        img_gray = image
    val = th_otsu(img_gray, nbins=256)
    mask = img_gray > val
    masked_image = img_gray * mask
    
    fig, (ax0, ax1) = plt.subplots(nrows=1, ncols=2)
    ax0.imshow(image, cmap=plt.cm.gray)
    ax1.imshow(masked_image, cmap=plt.cm.gray)
    
except:
    print('No abriste ninguna imagen!')


print('👋🏽')
root.destroy()