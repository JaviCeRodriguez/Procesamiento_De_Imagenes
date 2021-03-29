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
    plt.subplot(num_plot + 4)
    plt.hist(img_as_float(img).ravel(), bins=256)
    plt.xlim(0, 1)


img_gray = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\images\\tigre3.jpg') 
p2, p98 = np.percentile(img_gray, (2, 98))
img_gray_stretch = rescale_intensity(img_gray, in_range=(p2, p98))
plot_img_hist(img_gray, 241, 'Tigre')
plot_img_hist(img_gray_stretch, 242, 'Tigre stretching')

img_rgb = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\images\\loros.jpg') 
p2, p98 = np.percentile(img_rgb, (2, 98))
img_rgb_stretch = rescale_intensity(img_rgb, in_range=(p2, p98))
plot_img_hist(img_rgb, 243, 'Loros')
plot_img_hist(img_rgb_stretch, 244, 'Loros stretching')

plt.show()