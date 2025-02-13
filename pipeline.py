import os
import pandas as pd

northwind_dir = r"C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset"
print(os.listdir(northwind_dir))

for file in os.listdir(northwind_dir):
    file = str(file)
    dirpath = str(northwind_dir)
    path = dirpath + r'\\' + file
    data = pd.read_csv(path)
    print(data)
    target_dir = str(r"C:\Users\marti\Desktop\SQL_projekt\SQL_Tigers\northwind_dataset_semicolon")
    data.to_csv(target_dir + r'\\' + file, index=False, sep=";")

