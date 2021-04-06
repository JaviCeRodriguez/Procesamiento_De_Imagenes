import numpy as np
import matplotlib.pyplot as plt
from skimage import img_as_float
from skimage.color import gray2rgb
from skimage.io import imread
from skimage.exposure import rescale_intensity

def plot_img_hist(img, num_plot, title, bins=255):
    '''
    Plots de imagen e histograma
    '''
    # Imagen
    plt.subplot(num_plot)
    if len(img.shape) == 3:
        plt.imshow(img, cmap='gray')
    else: # len(img.shape) == 2
        plt.imshow(gray2rgb(img), cmap='gray')
    plt.title(title)
    # Histograma
    plt.subplot(num_plot + 2)
    plt.hist(img_as_float(img).ravel(), bins=bins)
    plt.xlim(0, 1)


# Imagen RGB
# img_gray = imread('D:/GitHub/Procesamiento-De-Imagenes/images/sauvola.JPG')
# Imagen Grayscale 
img_gray = imread('D:/GitHub/Procesamiento-De-Imagenes/images/tigre3.jpg')
out_range = (0, 50)
img_gray_shrink = rescale_intensity(img_gray, out_range=out_range).astype(np.uint8)
plot_img_hist(img_gray, 221, 'Tigre')
plot_img_hist(img_gray_shrink, 222, 'Tigre shrinking', bins=out_range[1]-out_range[0])

plt.show()