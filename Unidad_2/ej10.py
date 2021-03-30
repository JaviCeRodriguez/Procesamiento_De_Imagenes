import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from skimage.filters import threshold_otsu, threshold_multiotsu
from skimage.io import imread

matplotlib.rcParams['font.size'] = 9

image = imread('D:\\GitHub\\Procesamiento-De-Imagenes\\images\\Diatoms.bmp')
thresh = threshold_otsu(image)
thresh2 = threshold_multiotsu(image)
binary = image > thresh
print(thresh)
regions = np.digitize(image, bins=thresh2)
print(thresh2)

fig, axes = plt.subplots(nrows=2, ncols=3, figsize=(8, 6))
ax = axes.ravel()
ax[0] = plt.subplot(231)
ax[1] = plt.subplot(235)
ax[2] = plt.subplot(232)
ax[3] = plt.subplot(236)
ax[4] = plt.subplot(233)

# Imagen original
ax[0].imshow(image, cmap=plt.cm.gray)
ax[0].set_title('Original')
ax[0].axis('off')

# Thresholds simple y doble
ax[1].hist(image.ravel(), bins=256)
ax[1].axvline(thresh, color='r')
ax[3].hist(image.ravel(), bins=256)
for th in thresh2:
    ax[3].axvline(th, color='r')

# Imagenes con threshold aplicado
ax[2].imshow(binary, cmap=plt.cm.gray)
ax[2].set_title('Threshold simple')
ax[2].axis('off')
ax[4].imshow(regions, cmap=plt.cm.gray)
ax[4].set_title('Threshold doble')
ax[4].axis('off')

plt.show()