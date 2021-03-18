# Imports
import cv2
from matplotlib import pyplot as plt
import numpy as np
from skimage import draw

# Función callback para obtener coordenadas y realizar el trazo para perfil de intensidades
def print_coords(event, x, y, flags, param):

    # Global variables needed
    global image, image_copy, x_start, y_start

    # Obtengo coordenadas de inicio de trazo al hacer click izquierdo (sin soltarlo)
    if (event == cv2.EVENT_LBUTTONDOWN):
        x_start = x
        y_start = y
        print(f'Punto inicial: ({x_start}, {y_start})')

    # Obtengo coordenadas de fin de trazo al soltar clic izquierdo, luego ploteo el perfil de intensidades
    if (event == cv2.EVENT_LBUTTONUP):
        x_end = x
        y_end = y
        print(f'Punto final: ({x_end}, {y_end})')
        image = cv2.line(image_copy.copy(), (x_start, y_start), (x_end, y_end), (255, 255, 255), 2)
        line = np.transpose(np.array(draw.line(x_start, y_start, x_end, y_end)))
        data = image_copy.copy()[line[:, 1], line[:, 0], :]
        plt.close()
        plt.figure('Perfil de intensidades')
        plt.plot(data[:, 0], 'b', data[:, 1], 'g', data[:, 2], 'r')
        # plt.draw() # Si descomento esto, rompe todo
        # plt.pause(0.001)
        plt.legend(['Blue', 'Green', 'Red'])
        plt.ylim((0, 255))

# Leer imagen
imgPath = r'D:\GitHub\Procesamiento-De-Imagenes\images\loros.jpg' # Acá va el path de la imagen
image = cv2.imread(imgPath, cv2.IMREAD_COLOR)
if image is None:
    print('Esto esta devolviendo None')
else:
    image_copy = image.copy()

# Set up window and mouse callback function
cv2.namedWindow("Foto")
cv2.setMouseCallback("Foto", print_coords)

# En teoría, debería cerrar las ventanas al presionar "c", pero no funca del todo bien...
# Solo cierra si cerramos primero el plot con el botón de la ventana "X"
while True:
    cv2.imshow("Foto", image)
    plt.show()
    key = cv2.waitKey(1) & 0xFF

    if  key == ord("c"):
        cv2.destroyAllWindows()
        break
