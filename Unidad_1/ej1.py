# 1) Genere un listor de 10 números complejos, calcule el módulo y aplique un redondeo al
# entero más próximo. El listor resultante tendrá números enteros positivos.
#   a) Separe los valores impares de los pares en diferentes listores.
#   b) Ordene de menor a mayor los elementos de ambos listores.

import cmath
import numpy as np

listComplex = []
listModule = []
listPar = []
listImpar = []

for _ in range(0, 10):
    real = np.random.uniform(0, 10)
    comp = np.random.uniform(0, 10)
    z = real + 1j*comp
    listComplex.append(z)

for c in listComplex:
    listModule.append(round(abs(c)))

for m in listModule:
    r = m % 2
    if r == 0:
        listPar.append(m)
    else:
        listImpar.append(m)

listPar.sort()
listImpar.sort()

print(f'Lista de complejos: {listComplex}')
print(f'Lista de modulos redondeados {listModule}')
print(f'Lista de pares: {listPar}')
print(f'Lista de impares: {listImpar}')
