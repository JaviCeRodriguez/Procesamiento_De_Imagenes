import matplotlib.pyplot as plt
import numpy as np

# Make a 9x9 grid...
nrows, ncols = 9,9
image = np.zeros(nrows*ncols)

# Set every other cell to a random number (this would be your data)
image[::2] = np.random.random(nrows*ncols //2 + 1)

# Reshape things into a 9x9 grid.
image = image.reshape((nrows, ncols))
print(image)

row_labels = range(nrows)
col_labels = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I']
plt.matshow(image)
plt.xticks(range(ncols), col_labels)
plt.yticks(range(nrows), row_labels)
plt.show()