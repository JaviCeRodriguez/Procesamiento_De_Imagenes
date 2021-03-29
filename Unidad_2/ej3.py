import numpy as np
import matplotlib.pyplot as plt
from skimage.io import imread
from skimage.color import rgb2gray
from skimage.transform import downscale_local_mean

factors = 4**np.arange(1, 5)
img = imread('D:\GitHub\Procesamiento-De-Imagenes\images\perro.jpg')
img2 = rgb2gray(img)
# print(img.shape, img2.shape) # Para ver las dimensiones de las imagenes
figure, axis = plt.subplots(1, len(factors), figsize=(10, 4))
for factor, ax in zip(factors, axis): # Uso zip para transformarlo en diccionario y poder iterar en él
    image = downscale_local_mean(
        img2, 
        factors=(factor, factor)
    )
    # image = image.astype(int) # Esto si tenemos RGB
    ax.imshow(image, cmap='gray')
    ax.set_title(f'N={image.shape[0]}')

plt.show()