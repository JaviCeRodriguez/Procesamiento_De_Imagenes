import matplotlib.pyplot as plt
from skimage import data, io
from skimage.transform import resize

# image = data.astronaut()
image = io.imread('D:\GitHub\Procesamiento-De-Imagenes\images\loros.jpg')
image_sub = resize(image, (image.shape[0]//6, image.shape[1]//6))
image_sobre = resize(image, (image.shape[0]*4, image.shape[1]*4))

plt.subplot(2, 2, 3)
plt.imshow(image_sub)
plt.title('Imagen submuestreada')

plt.subplot(2, 2, (1, 2))
plt.imshow(image)
plt.title('Imagen Original')

plt.subplot(2, 2, 4)
plt.imshow(image_sobre)
plt.title('Imagen sobremuestreada')

plt.show()