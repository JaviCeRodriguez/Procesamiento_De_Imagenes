import matplotlib.pyplot as plt
from skimage import img_as_float
from skimage.color import rgb2gray
from skimage.io import imread
from skimage.exposure import adjust_gamma

def plot_img_hist(img, num_plot, title):
    '''
    Plots de imagen e histograma
    '''
    # Imagen
    plt.subplot(num_plot)
    plt.imshow(img, cmap='gray')
    plt.title(title)
    # Histograma
    plt.subplot(num_plot + 3)
    plt.hist(img_as_float(img).ravel(), bins=256)
    plt.xlim(0, 1)


img = rgb2gray(imread('D:\GitHub\Procesamiento-De-Imagenes\images\oso.jpg'))
img_bright = adjust_gamma(img, gamma=0.3, gain=1)
img_dark = adjust_gamma(img, gamma=2.5, gain=1)

plot_img_hist(img, 231, 'Imagen original')
plot_img_hist(img_bright, 232, 'Imagen con mucho brillo')
plot_img_hist(img_dark, 233, 'Imagen con poco brillo')

plt.show()