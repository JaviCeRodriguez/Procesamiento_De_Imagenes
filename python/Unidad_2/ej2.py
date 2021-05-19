# Utilice el comando imresize para modificar la resolución espacial de una
# imagen (submuestreo y sobremuestreo).

import matplotlib.pyplot as plt
from skimage import io
from skimage.transform import resize
import tkinter as tk
from tkinter import filedialog

try:
    # Busco imagen, obtengo su ruta y cambio el muestreo
    root = tk.Tk()
    root.withdraw()
    file_path = filedialog.askopenfilename()
    image = io.imread(file_path)
    image_sub = resize(image, (image.shape[0]//6, image.shape[1]//6))
    image_sobre = resize(image, (image.shape[0]*4, image.shape[1]*4))
    
    
    # Plots
    plt.subplot(2, 2, 3)
    plt.imshow(image_sub)
    plt.title('Imagen submuestreada')
    
    plt.subplot(2, 2, (1, 2))
    plt.imshow(image)
    plt.title('Imagen Original')
    
    plt.subplot(2, 2, 4)
    plt.imshow(image_sobre)
    plt.title('Imagen sobremuestreada')

    plt.show() # Esto no hace falta estando en Spyder
except:
    print('Cerraste la ventana!')
    
print('👋🏽🍕')
root.destroy()