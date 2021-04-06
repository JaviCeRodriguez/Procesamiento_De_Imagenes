import matplotlib.pyplot as plt
from skimage import util
from skimage import img_as_float
from skimage.io import imread


def plot_img_hist(img, num_plot, title):
    """
        Plots de imagen e histograma
    """
    # Imagen
    plt.subplot(num_plot)
    plt.imshow(img, cmap='gray')
    plt.title(title)
    # Histograma
    plt.subplot(num_plot + 4)
    plt.hist(img_as_float(img).ravel(), bins=256)
    plt.xlim(0, 1)


img1 = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\images\\cara.png')
img2 = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\images\\tigre3.jpg')

plot_img_hist(img1, 241, 'Cara')
plot_img_hist(img2, 242, 'Tigre')
plot_img_hist(util.invert(img1), 243, 'Cara invertida')
plot_img_hist(util.invert(img2), 244, 'Tigre invertido')

plt.show()
