import numpy as np
import matplotlib.pyplot as plt
from skimage import img_as_float
from skimage.io import imread
from skimage.exposure import rescale_intensity

def plot_img_hist(img, num_plot, title):
    '''
    Plots de imagen e histograma
    '''
    # Imagen
    plt.subplot(num_plot)
    plt.imshow(img, cmap='gray')
    plt.title(title)
    # Histograma
    plt.subplot(num_plot + 2)
    plt.hist(img_as_float(img).ravel(), bins=256)
    plt.xlim(0, 1)


img_gray = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\images\\tigre3.jpg') 
pa, pb = np.percentile(img_gray, (2, 50))
img_gray_shrink = rescale_intensity(img_gray, in_range=(0.3, 0.5))
plot_img_hist(img_gray, 221, 'Tigre')
plot_img_hist(img_gray_shrink, 222, 'Tigre shrinking')

plt.show()