# -*- coding: utf-8 -*-
"""
Created on Wed Apr 14 17:25:10 2021

@author: Javier
"""

import tkinter as tk
from tkinter import filedialog

root = tk.Tk()
root.withdraw()

file_path = filedialog.askopenfilename()
print(file_path)